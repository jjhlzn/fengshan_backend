using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dapper;
using System.Data;
using fengshan.DomainModel;
using log4net;

namespace fengshan.Service
{
    public class ReportService
    {
        private static ILog logger = LogManager.GetLogger(typeof(ReportService));

        private ConfigService configService = new ConfigService();

        public Object getReport(string device = "PC")
        {

            using (IDbConnection conn = ConnectionFactory.GetInstance())
            {
                string sql = @"select COUNT(*) from t_order where flag = 0 and 
                                orderNo in (select orderNo from t_order_status where statusName = '完成' and isFinished = 0) ";

                logger.Debug(sql);

                int notFinishedOrders = conn.ExecuteScalar<int>(sql);

                sql = @"select COUNT(*) from t_order where flag = 0 and deliveryDate < CONVERT(varchar(100), GETDATE(), 23) and
orderNo in (select orderNo from t_order_status where statusName = '完成' and isFinished = 0)";

                logger.Debug(sql);
                int timeoutOrders = conn.ExecuteScalar<int>(sql);

                

                var result = new
                {
                    notFinishedOrders = notFinishedOrders,
                    timeoutOrders = timeoutOrders,
                    orderChart = getOrderChartData(device)
                };


                return result;
            }

            
        }

        class OrderChartDataItem
        {
            public string name;
            public int notFinishedOrder;
            public int timeoutOrder;
        }


        private Object getOrderChartData(string device = "PC")
        {
            using (IDbConnection conn = ConnectionFactory.GetInstance())
            {
                string sql = @"select a.name, 
                                (select COUNT(*) from t_order where flag = 0 and
                                orderNo in (select orderNo from t_order_status where statusName = '完成' and isFinished = 0 and receiveOrderPerson = a.name)
                                ) as notFinishedOrder,
                                (select COUNT(*) from t_order where flag = 0 and deliveryDate < CONVERT(varchar(100), GETDATE(), 23) and
                                orderNo in (select orderNo from t_order_status where statusName = '完成' and isFinished = 0 and receiveOrderPerson = a.name)
                                ) as timeoutOrder
                                from (
                                select name, sequence, addtime from t_config where code = 'JDR' 
                                ) as a order by sequence, addtime";

                List<OrderChartDataItem> items = conn.Query<OrderChartDataItem>(sql).AsList();

                if (device == "WX")
                {
                    return items;
                } else
                {
                    List<string> labels = new List<string>();
                    List<int> notFinishedOrders = new List<int>();
                    List<int> timeoutOrders = new List<int>();

                    foreach (OrderChartDataItem item in items)
                    {
                        labels.Add(item.name);
                        notFinishedOrders.Add(item.notFinishedOrder);
                        timeoutOrders.Add(item.timeoutOrder);
                    }

                    var result = new
                    {
                        labels = labels,
                        datasets = new[] { new {
                                            label = "未完成",
                                            backgroundColor = "#1ABB9C",
                                            data =  notFinishedOrders
                                        },
                                        new {
                                            label = "超时",
                                            backgroundColor = "#E74C3C",
                                            data =  timeoutOrders
                                        }
                        }
                    };


                    return result;
                }

                
            }
        }
    }
}