using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using fengshan.DomainModel;
using checkproduct.Service;
using log4net;


namespace fengshan
{
    public partial class getorders : System.Web.UI.Page
    {
        //private CheckOrderService checkOrderService = new CheckOrderService();
        private static ILog logger = LogManager.GetLogger(typeof(getorders));

        protected void Page_Load(object sender, EventArgs e)
        {
            PageInfo pageInfo = new PageInfo();
            string username = Request.Params["username"];

            //string ticketNo = Request.Params["ticketNo"] ?? "";
            //ticketNo = ticketNo.Trim();
            
            string startDate = Request.Params["startDate"];
            string endDate = Request.Params["endDate"];
            string status = Request.Params["status"];
            string pageNo = Request.Params["pageNo"] ?? "0";

            //string str = string.Format(@"ticketNo = {0}, startDate = {1}, endDate = {2}, status = {3}, pageNo = {4}, username = {5}, checker = {6}",
            //    ticketNo, startDate, endDate, status, pageNo, username, checker);
            //logger.Debug("params: " + str);

            pageInfo.pageNo = int.Parse(pageNo);

            //GetCheckOrdersResult checkOrdersResult = checkOrderService.GetCheckOrders(DateTime.Now, DateTime.Now, status, username,checker, pageInfo, ticketNo);

            var resp = new
            {
                status = 0,
                errorMessage = "",
                totalCount = 40,
                items = getOrders()
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
            order.orderDate = DateTime.Now;
            order.orderName = "牌匾";
            order.deliveryDate = DateTime.Now.AddDays(10);
            order.amount = 100;
            order.flow = new Flow(Flow.DefaultFlow);
            return order;
        }
    }
}