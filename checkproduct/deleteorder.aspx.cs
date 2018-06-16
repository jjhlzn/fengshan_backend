using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.IO;
using log4net;
using fengshan.Service;

namespace fengshan
{
    class DeleteRequest
    {
        public string orderNo;
    }
    public partial class deleteorder : System.Web.UI.Page
    {

        private ILog logger = LogManager.GetLogger(typeof(deleteorder));

        protected void Page_Load(object sender, EventArgs e)
        {
            //string json = Request.Params["req"];
            Stream req = Request.InputStream;
            req.Seek(0, System.IO.SeekOrigin.Begin);
            string json = new StreamReader(req).ReadToEnd();
            logger.Debug(json);
            DeleteRequest deleteReq = JsonConvert.DeserializeObject<DeleteRequest>(json);

            var result = new OrderService().deleteOrder(deleteReq.orderNo);

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