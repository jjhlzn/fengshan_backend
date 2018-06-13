using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using fengshan.DomainModel;

namespace fengshan
{
    public partial class getorderinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var resp = new
            {
                status = 0,
                errorMessage = "",
                order = makeOrder()
            };

            Response.Write(JsonConvert.SerializeObject(resp));
            Response.End();
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
            order.files.Add("test.jpg");
            return order;
        }
    }
}