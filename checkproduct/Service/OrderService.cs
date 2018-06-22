using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using fengshan.DomainModel;
using log4net;
using Dapper;
using System.Data;

namespace fengshan.Service
{
    public class QueryResult
    {
        public List<Order> orders = new List<Order>();
        public int totalCount;
    }
    public class OrderService
    {
        private static ILog logger = LogManager.GetLogger(typeof(OrderService));

        public bool saveOrder(Order order)
        {
            order.id = Guid.NewGuid().ToString();
            order.orderNo = assignOrderNo();
            using (IDbConnection conn = ConnectionFactory.GetInstance())
            {
                string sql = @"insert into t_order (id, orderNo, taobaoId, receiveOrderPerson, orderDate, deliveryDate,
                               material, size, carveStyle, color, deliveryCompany, deliveryPayType, deliveryPackage, address,
                               memo, amount, orderName, style, isDuban) 
                               values 
                               (@id, @orderNo, @taobaoId, @receiveOrderPerson, @orderDate,
                               @deliveryDate, @material, @size, @carveStyle, @color, @deliveryCompany, @deliveryPayType, @deliveryPackage, @address,
                               @memo, @amount, @orderName, @style, @isDuban)";
                sql = string.Format(sql, sql);
                logger.Debug("sql: " + sql);
                logger.Debug("order.orderDate = " + order.orderDate);
                logger.Debug("order.deliveryDate = " + order.deliveryDate);
                logger.Debug("order.taobaoId = " + order.taobaoId);
                int rowCount = conn.Execute(sql, new { id = order.id, orderNo = order.orderNo,
                    taobaoId = order.taobaoId, receiveOrderPerson = order.receiveOrderPerson,
                    orderDate = order.orderDate, deliveryDate = order.deliveryDate, material = order.material, size = order.size,
                    carveStyle = order.carveStyle, color = order.color, deliveryCompany = order.deliveryCompany, 
                    deliveryPayType = order.deliveryPayType, deliveryPackage = order.deliveryPackage, address = order.address,
                    memo = order.memo, amount = order.amount, orderName = order.orderName, style = order.style, isDuban = order.isDuban
                });

                if (rowCount != 1)
                {
                    logger.Fatal("insert t_order fail");
                    return false;
                }

                //添加默认的flow
                sql = @"insert into t_order_status (id, orderNo, statusName, sequence) values (@id, @orderNo, @statusName, @sequence)";
                foreach (FlowStatus status in order.flow.statusList)
                {
                   rowCount = conn.Execute(sql, new { id = Guid.NewGuid(), orderNo = order.orderNo, statusName = status.name, sequence = status.sequence });
                    if (rowCount != 1)
                    {
                        logger.Fatal("insert t_order_status fail： status = " + status.name);
                        return false;
                    }
                }

                //关联图片
                sql = @"insert into t_order_img (id, orderNo, type, imageurl) values (@id, @orderNo, @type, @imageUrl)";
                foreach(string imageUrl in order.contentImages)
                {
                    conn.Execute(sql, new { id = Guid.NewGuid().ToString(), orderNo = order.orderNo, type = "content", imageUrl = imageUrl });
                }
                foreach(string imageUrl in order.templateImages)
                {
                    conn.Execute(sql, new { id = Guid.NewGuid().ToString(), orderNo = order.orderNo, type = "template", imageUrl = imageUrl });
                }

                return true;
            }
        }

        public QueryResult search(string startDate, string endDate, string keyword, bool isShowFinished, int pageNo, int pageSize)
        {
            string orderSum = @"orderNo + taobaoId + receiveOrderPerson  +material +
                                size + carveStyle + color + deliveryCompany +deliveryPayType +deliveryPackage + 
                                address + memo + orderName";

            string where = " deliveryDate between '" + startDate + "' and '" + endDate + "'  and  " + orderSum + " like '%" + keyword + "%' and flag = 0 ";

            if (!isShowFinished)
            {
                where += " and orderNo not in (select aa.orderNo from t_order_status as aa where aa.statusName = '完成' and aa.isFinished = 1)";
            } 

            int skipCount = pageNo * pageSize;

            string sql = @"select top " + pageSize + @" orderNo, taobaoId , receiveOrderPerson, CONVERT(varchar(100), orderDate, 23) as orderDate, CONVERT(varchar(100), deliveryDate, 23) as deliveryDate, material,
                                size, carveStyle , color , deliveryCompany , deliveryPayType , deliveryPackage, orderName,
                                address, memo  from t_order where " + where + " and id not in (select top " + skipCount + @" id from t_order
                          where " + where + @" order by deliveryDate) order by deliveryDate, orderNo";

            logger.Debug(sql);

            QueryResult result = new QueryResult();

            List<Order> orders = new List<Order>();

            logger.Debug("startDate = " + startDate + ", endDate = " + endDate);
            using (IDbConnection conn = ConnectionFactory.GetInstance())
            {
                orders = conn.Query<Order>(sql).AsList();
                result.orders = orders;
                if (orders.Count == 0)
                    return result;

                string orderNoSum = "";
                foreach (Order order in orders)
                {
                    orderNoSum = orderNoSum + " '" + order.orderNo + "',";
                }
                orderNoSum = orderNoSum.Substring(0, orderNoSum.Length - 1);

                sql = "select orderNo, statusName as name, isFinished, handletime as finishDate, sequence from t_order_status where orderNo in (" + orderNoSum + ") order by orderNo, sequence";

                List<FlowStatus> statusList = conn.Query<FlowStatus>(sql).AsList();
                foreach (Order order in orders)
                {
                    List<FlowStatus> list = new List<FlowStatus>();
                    foreach (FlowStatus status in statusList)
                    {
                        if (order.orderNo == status.orderNo)
                        {
                            list.Add(status);
                        }
                    }
                    order.flow = new Flow(list);
                }

                sql = "select count(*) from t_order where " + where;
                result.totalCount = conn.QuerySingle<int>(sql);
            }

            foreach (Order order in result.orders)
            {
                order.flow.currentStatus = order.flow.getCurrentStatus();
            }

            return result;
        }


        public Order getOrder(string orderNo)
        {

            using (IDbConnection conn = ConnectionFactory.GetInstance())
            {
                string sql = @"select id, orderNo, taobaoId, receiveOrderPerson, CONVERT(varchar(100), orderDate, 23) as orderDate, CONVERT(varchar(100), deliveryDate, 23) as deliveryDate,
                               material, size, carveStyle, color, deliveryCompany, deliveryPayType, deliveryPackage, address, style, isDuban,
                               memo, amount, orderName from t_order where orderNo = @orderNo and flag = 0 ";
                Order order = conn.QueryFirstOrDefault<Order>(sql, new { orderNo = orderNo });
                if (order == null)
                {
                    return order;
                }
                //加载图片
                sql = "select imageUrl from t_order_img where orderNo = @orderNo and type = 'content' order by addtime";
                List<string> urls = conn.Query<string>(sql, new { orderNo = orderNo }).AsList();
                order.contentImages = urls;

                sql = "select imageUrl from t_order_img where orderNo = @orderNo and type = 'template' order by addtime";
                urls = conn.Query<string>(sql, new { orderNo = orderNo }).AsList();
                order.templateImages = urls;

                sql = "select imageUrl from t_order_img where orderNo = @orderNo and type = 'other' order by addtime";
                urls = conn.Query<string>(sql, new { orderNo = orderNo }).AsList();
                order.otherImages = urls;

                //加载状态
                sql = "select orderNo, statusName as name, isFinished, handletime as finishDate, sequence from t_order_status where orderNo = '" + orderNo + "'";

                List<FlowStatus> statusList = conn.Query<FlowStatus>(sql).AsList();
                List<FlowStatus> list = new List<FlowStatus>();
                foreach (FlowStatus status in statusList)
                {
                    if (order.orderNo == status.orderNo)
                    {
                        list.Add(status);
                    }
                }
                order.flow = new Flow(list);
                order.flow.currentStatus = order.flow.getCurrentStatus();
                return order;
            } 

        }

        public bool deleteOrder(string orderNo)
        {
            using (IDbConnection conn = ConnectionFactory.GetInstance())
            {
                string sql = @"update t_order set flag = -1 where orderNo = @orderNo";
                int count = conn.Execute(sql, new { orderNo = orderNo });
                return count == 1;
            }
        }

        public bool setOrderFlowStatus(string orderNo, string statusName, bool isFinished)
        {
            using (IDbConnection conn = ConnectionFactory.GetInstance())
            {
                string sql = @"select sequence from t_order_status where orderNo = @orderNo and statusName = @statusName";
               
                int sequence = conn.QueryFirstOrDefault<int>(sql, new { orderNo, statusName });
                
                if (isFinished)
                {
                    sql = @"update t_order_status set isFinished = @isFinished, handletime = @handleTime where orderNo = @orderNo and sequence <= @sequence";
                } else
                {
                    sql = @"update t_order_status set isFinished = @isFinished, handletime = @handleTime where orderNo = @orderNo and sequence >= @sequence";
                }

                logger.Debug(sql);

                if ( conn.Execute(sql, new { orderNo = orderNo, sequence = sequence, isFinished = isFinished, handleTime = DateTime.Now }) > 0)
                {
                    setOrderStatusFinished(orderNo);
                    return true; 
                } else
                {
                    return false;
                }
            }
        }



        public bool setOrderFlowStatus2(string orderNo, string statusName, bool isFinished)
        {
            using (IDbConnection conn = ConnectionFactory.GetInstance())
            {
                string sql = @"update t_order_status set isFinished = @isFinished, handletime = @handleTime where orderNo = @orderNo and statusName = @statusName";
                logger.Debug(sql);
                int count = conn.Execute(sql, new { orderNo = orderNo, statusName = statusName, isFinished = isFinished, handleTime = DateTime.Now });
                logger.Debug("count = " + count);
                if (count >= 1)
                {
                    setOrderStatusFinished(orderNo);
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        private void setOrderStatusFinished(string orderNo)
        {
            using (IDbConnection conn = ConnectionFactory.GetInstance())
            {
                string sql =  @"select orderNo, statusName as name, isFinished, handletime as finishDate, sequence from t_order_status where orderNo = '" + orderNo + "'";
                List<FlowStatus> statusList = conn.Query<FlowStatus>(sql).AsList();
                bool isOrderFinished = true;
                foreach (FlowStatus status in statusList)
                {
                    if (status.name != "完成")
                    {
                        isOrderFinished = isOrderFinished && status.isFinished;
                    }
                }
                sql = @"update t_order_status set isFinished = @isFinished, handletime = @handleTime where orderNo = @orderNo and statusName = '完成'";
                conn.Execute(sql, new { orderNo = orderNo, isFinished = isOrderFinished, handleTime = DateTime.Now });

            }
        }

        public bool addOrderImage(string orderNo, string imageName, string type)
        {
            using (IDbConnection conn = ConnectionFactory.GetInstance())
            {
                string sql = @"insert into t_order_img (id, orderNo, type, imageurl) values (@id, @orderNo, @type, @imageUrl)";
                int count = conn.Execute(sql, new { id = Guid.NewGuid().ToString(), orderNo = orderNo, type = type, imageUrl = imageName });
                return count == 1;
            }
        }


        public bool deleteOrderImage(string orderNo, string imageName, string type)
        {
            using (IDbConnection conn = ConnectionFactory.GetInstance())
            {
                string sql = @"delete from t_order_img where orderNo = @orderNo and imageUrl = @imageUrl and type = @type";
                int count = conn.Execute(sql, new { id = Guid.NewGuid().ToString(), orderNo = orderNo, type = type, imageUrl = imageName });
                return count == 1;
            }
        }

        private string assignOrderNo()
        {
            string orderNo = "G" + DateTime.Now.ToString("yyMMdd") + getOrderNoSeq();
            logger.Debug("newOrderNo = " + orderNo);
            return orderNo;
        }

        private string getOrderNoSeq()
        {
            using (IDbConnection conn = ConnectionFactory.GetInstance())
            {
                string orderNoPefix = "G" + DateTime.Now.ToString("yyMMdd");
                string sql = @"select top 1 orderno from t_order where orderNo like '" + orderNoPefix + "%' order by orderno desc";
                logger.Debug("sql: " + sql);
                Order order = conn.QueryFirstOrDefault<Order>(sql);
                if (order == null)
                {
                    logger.Debug("can't find any order today");
                    return "0001";
                }
                string orderNo = order.orderNo;
                string seq = orderNo.Substring(7, 4);
                return nextOrderNo(seq);
            }
        }

        private string nextOrderNo(string seq)
        {
            int index = int.Parse(seq);
            index++;
            return index.ToString("0000");
        }
    }
}