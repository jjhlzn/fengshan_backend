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
    public partial class neworder : System.Web.UI.Page
    {
        private ConfigService service = new ConfigService();

        protected Config peopleConfig = Config.JDR;
        protected Config styleConfig = Config.KS;
        protected Config carveStyleConfig = Config.DKFS;
        protected Config materialConfig = Config.CZ;
        protected Config materialDubanConfig = Config.CZDB;
        protected Config deliveryCompanyConfig = Config.WLGS;
        protected Config deliveryPayTypeConfig = Config.WLZFFS;
        protected Config deliveryPackageConfig = Config.WLDBFS;

        protected void Page_Load(object sender, EventArgs e)
        {
            foreach(Config config in Config.ALL_CONFIGS)
            {
                service.loadConfigItems(config);
            }

        }
    }
}