﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using fengshan.other;

namespace fengshan.admin.production
{
    public partial class admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[Utils.SESSION_USER] == null)
            {
                Response.Redirect("login.aspx");
            }
        }
    }
}