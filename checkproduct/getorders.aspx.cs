using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using fengshan.DomainModel;
using checkproduct.Service;
using log4net;
using System.IO;
using fengshan.Service;

namespace fengshan
{
    class QueryRequest
    {
        public string startDate;
        public string endDate;
        public string keyword;
        public string status;
        public int pageNo;
        public int pageSize;
        
    }

    public partial class getorders : System.Web.UI.Page
    {
        //private CheckOrderService checkOrderService = new CheckOrderService();
        private static ILog logger = LogManager.GetLogger(typeof(getorders));

        protected void Page_Load(object sender, EventArgs e)
        {
            Stream req = Request.InputStream;
            req.Seek(0, System.IO.SeekOrigin.Begin);
            string json = new StreamReader(req).ReadToEnd();

            QueryRequest query = JsonConvert.DeserializeObject<QueryRequest>(json);

            QueryResult result = new OrderService().search(query.startDate, query.endDate, query.keyword, query.pageNo, query.pageSize);

            var resp = new
            {
                status = 0,
                errorMessage = "",
                totalCount = result.orders,
                pages = (result.totalCount + query.pageSize - 1) / query.pageSize,
                items = result.orders
            };

            Response.Write(JsonConvert.SerializeObject(resp));
            Response.End();
        }

        private List<Order> getOrders()
        {
            List<Order> orders = new List<Order>();

            Order order = new Order();
            for(int i = 0; i < 10; i++)
            {
                orders.Add(makeOrder());
            }

            return orders;
        }

        private Order makeOrder()
        {
            Order order = new Order();
            order.orderNo = "123456";
            order.orderDate = "2018-01-01";
            order.orderName = "牌匾";
            order.deliveryDate = "2018-01-01";
            order.amount = 100;
            order.flow = new Flow(Flow.DefaultFlow);
            return order;
        }
    }
}