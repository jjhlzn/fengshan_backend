﻿using System;
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
    class SetStatusRequest {
        public string orderNo = "";
        public string statusName = "";
        public bool isFinished = false;
    }

    public partial class setflowstatus : System.Web.UI.Page
    {
        private ILog logger = LogManager.GetLogger(typeof(setflowstatus));

        protected void Page_Load(object sender, EventArgs e)
        {
            Stream req = Request.InputStream;
            req.Seek(0, System.IO.SeekOrigin.Begin);
            string json = new StreamReader(req).ReadToEnd();
            logger.Debug(json);
            SetStatusRequest request = JsonConvert.DeserializeObject<SetStatusRequest>(json);

            bool result = new OrderService().setOrderFlowStatus(request.orderNo, request.statusName, request.isFinished);

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