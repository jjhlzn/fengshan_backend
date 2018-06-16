using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using fengshan.DomainModel;
using System.IO;
using log4net;
using fengshan.Service;

namespace fengshan
{
    class GetOrderRequest
    {
        public string orderNo;
    }

    public partial class getorderinfo : System.Web.UI.Page
    {
        private ILog logger = LogManager.GetLogger(typeof(getorderinfo));

        protected void Page_Load(object sender, EventArgs e)
        {
            //string json = Request.Params["req"];
            Stream req = Request.InputStream;
            req.Seek(0, System.IO.SeekOrigin.Begin);
            string json = new StreamReader(req).ReadToEnd();
            logger.Debug(json);
            GetOrderRequest request = JsonConvert.DeserializeObject<GetOrderRequest>(json);

            Order order = new OrderService().getOrder(request.orderNo);

            var resp = new
            {
                status = order != null ? 0 : -1,
                errorMessage = "",
                order = order
            };

            Response.Write(JsonConvert.SerializeObject(resp));
            Response.End();
        }
    }
}