using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using fengshan.DomainModel;
using fengshan.Service;
using System.IO;
using log4net;

namespace fengshan
{
    

    public partial class neworder : System.Web.UI.Page
    {
        private ILog logger = LogManager.GetLogger(typeof(neworder));
        private OrderService orderService = new OrderService();

        protected void Page_Load(object sender, EventArgs e)
        {
            //string json = Request.Params["req"];
            Stream req = Request.InputStream;
            req.Seek(0, System.IO.SeekOrigin.Begin);
            string json = new StreamReader(req).ReadToEnd();
            logger.Debug(json);
            Order order = JsonConvert.DeserializeObject<Order>(json);

            order.flow = Flow.DefaultFlow;

            bool status = orderService.saveOrder(order);

            var resp = new
            {
                status = status ? 0 : -1,
                errorMessage = ""
            };

            Response.Write(JsonConvert.SerializeObject(resp));
            Response.End();
        }
    }
}