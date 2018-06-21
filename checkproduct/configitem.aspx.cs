using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Newtonsoft.Json;
using fengshan.DomainModel;
using fengshan.Service;
using log4net;

namespace fengshan
{
    class ConfigItemRequest
    {
        public string id;
        public string op;
        public string type;
        public string name;
        public int sequence;
    }

    public partial class configitem : System.Web.UI.Page
    {
        private static ILog logger = LogManager.GetLogger(typeof(configitem));
        protected void Page_Load(object sender, EventArgs e)
        {
            Stream req = Request.InputStream;
            req.Seek(0, System.IO.SeekOrigin.Begin);
            string json = new StreamReader(req).ReadToEnd();
            logger.Debug(json);
            ConfigItemRequest query = JsonConvert.DeserializeObject<ConfigItemRequest>(json);
            logger.Debug("sequence = " + query.sequence);
            int status = 0;
            string id = "";
            if("add" == query.op)
            {
                ConfigItem item = new ConfigItem();
                item.typeCode = query.type;
                item.name = query.name;
                item.value = item.name;
                item.sequence = query.sequence;
                id = new ConfigService().addItem(item);
                if (string.IsNullOrEmpty(id))
                {
                    status = -1;
                }
            }
            else if ("delete" == query.op)
            {
                status = new ConfigService().deleteItem(query.id) ? 0 :-1;
            }

            var resp = new
            {
                status = status,
                errorMessage = "",
                id = id
            };

            Response.Write(JsonConvert.SerializeObject(resp));
            Response.End();

        }
    }
}