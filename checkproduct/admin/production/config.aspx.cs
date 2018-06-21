using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using fengshan.DomainModel;
using fengshan.Service;

namespace fengshan.admin.production
{
    public partial class config : System.Web.UI.Page
    {
        public Config siteConfig;
        protected string name = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string code = Request.Params["code"];

            this.siteConfig = Config.getConfig(code);

            new ConfigService().loadConfigItems(siteConfig); 

        }
    }
}