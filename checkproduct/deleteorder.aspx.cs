﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace fengshan
{
    public partial class deleteorder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var resp = new
            {
                status = 0,
                errorMessage = ""
            };

            Response.Write(JsonConvert.SerializeObject(resp));
            Response.End();
        }
    }
}