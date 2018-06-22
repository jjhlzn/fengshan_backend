using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using fengshan.Service;
using Newtonsoft.Json;
using log4net;

namespace fengshan
{
    public partial class report : System.Web.UI.Page
    {
        private ReportService service = new ReportService();

        protected void Page_Load(object sender, EventArgs e)
        {
            var resp = new
            {
                status = 0,
                errorMessage = "",
                result = service.getReport()
            };

            Response.Write(JsonConvert.SerializeObject(resp));
            Response.End();

        }
    }
}