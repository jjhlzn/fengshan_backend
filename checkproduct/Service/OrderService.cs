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
                               memo, amount, orderName) 
                               values 
                               (@id, @orderNo, @taobaoId, @receiveOrderPerson, @orderDate,
                               @deliveryDate, @material, @size, @carveStyle, @color, @deliveryCompany, @deliveryPayType, @deliveryPackage, @address,
                               @memo, @amount, @orderName)";
                sql = string.Format(sql, sql);
                logger.Debug("sql: " + sql);
                int rowCount = conn.Execute(sql, new { id = order.id, orderNo = order.orderNo,
                    taobaoId = order.taobaoId, receiveOrderPerson = order.receiveOrderPerson,
                    orderDate = order.orderDate, deliveryDate = order.deliveryDate, material = order.material, size = order.size,
                    carveStyle = order.carveStyle, color = order.color, deliveryCompany = order.deliveryCompany, 
                    deliveryPayType = order.deliveryPayType, deliveryPackage = order.deliveryPackage, address = order.address,
                    memo = order.memo, amount = order.amount, orderName = order.orderName
                });

                if (rowCount != 1)
                {
                    logger.Fatal("insert t_order fail");
                    return false;
                }

                //添加默认的flow
                sql = @"insert into t_order_status (id, orderNo, statusName) values (@id, @orderNo, @statusName)";
                foreach (FlowStatus status in order.flow.statusList)
                {
                   rowCount = conn.Execute(sql, new { id = Guid.NewGuid(), orderNo = order.orderNo, statusName = status.name });
                    if (rowCount != 1)
                    {
                        logger.Fatal("insert t_order_status fail： status = " + status.name);
                        return false;
                    }
                }

                return true;
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