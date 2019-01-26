using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Newtonsoft.Json;
using log4net;
using fengshan.Service;
using fengshan.DomainModel;

namespace fengshan
{
    public partial class modifyorder : System.Web.UI.Page
    {
        private static ILog logger = LogManager.GetLogger(typeof(modifyorder));

        protected void Page_Load(object sender, EventArgs e)
        {
            Stream req = Request.InputStream;
            req.Seek(0, System.IO.SeekOrigin.Begin);
            string json = new StreamReader(req).ReadToEnd();
            logger.Debug(json);
            Order order = JsonConvert.DeserializeObject<Order>(json);

            bool result = new OrderService().updateOrder(order);
            var resp = new
            {
                status = result ? 0 : -1,
                errorMessage = ""
            };

            Response.Write(JsonConvert.SerializeObject(resp));
            Response.End();
        }
    }
}