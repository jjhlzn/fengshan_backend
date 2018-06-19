using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using log4net;
using Newtonsoft.Json;
using fengshan.Service;

namespace fengshan
{
    class DeleteImageRequest
    {
        public string orderNo;
        public string imageUrl;
        public string type;
    }

    public partial class deleteorderimage : System.Web.UI.Page
    {
        private ILog logger = LogManager.GetLogger(typeof(deleteorderimage));

        protected void Page_Load(object sender, EventArgs e)
        {
            //string json = Request.Params["req"];
            Stream req = Request.InputStream;
            req.Seek(0, System.IO.SeekOrigin.Begin);
            string json = new StreamReader(req).ReadToEnd();
            logger.Debug(json);
            DeleteImageRequest request = JsonConvert.DeserializeObject<DeleteImageRequest>(json);

            bool result = false;
            Uri uri = new Uri(request.imageUrl);

            var filename = uri.Segments.Last();
            logger.Debug(filename);
            result = new OrderService().deleteOrderImage(request.orderNo, filename, request.type);
            

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