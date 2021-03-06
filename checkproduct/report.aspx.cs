﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using fengshan.Service;
using Newtonsoft.Json;
using log4net;
using System.IO;

namespace fengshan
{
    class ReportRequest
    {
        public string device = "";
    }

    public partial class report : System.Web.UI.Page
    {
        private ILog logger = LogManager.GetLogger(typeof(report));
        private ReportService service = new ReportService();

        protected void Page_Load(object sender, EventArgs e)
        {
            Stream req = Request.InputStream;
            req.Seek(0, System.IO.SeekOrigin.Begin);
            string json = new StreamReader(req).ReadToEnd();
            logger.Debug(json);
            ReportRequest report = JsonConvert.DeserializeObject<ReportRequest>(json);

            var resp = new
            {
                status = 0,
                errorMessage = "",
                result = service.getReport(report.device)
            };

            Response.Write(JsonConvert.SerializeObject(resp));
            Response.End();

        }
    }
}