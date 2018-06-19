using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using log4net;
using Dapper;
using checkproduct.DomainModel;
using fengshan.Service;
using System.IO;
using fengshan.other;

namespace checkproduct
{
    public class LoginRequest
    {
        public string a
        {
            get;
            set;
        }

        public string b
        {
            get;
            set;
        }
    }

    public partial class login : System.Web.UI.Page
    {
        private UserService userService = new UserService();

        private ILog logger = LogManager.GetLogger(typeof(login));

        protected void Page_Load(object sender, EventArgs e)
        {
            Stream req = Request.InputStream;
            req.Seek(0, System.IO.SeekOrigin.Begin);
            string json = new StreamReader(req).ReadToEnd();
            logger.Debug(json);
            LoginRequest request = JsonConvert.DeserializeObject<LoginRequest>(json);

            User user = null;

            int status = 0;
            string errorMessage = "";

            user = userService.Login(request.a, request.b);
            
            if (user == null)
            {
                status = -1;
                errorMessage = "用户名或密码错误";
            } else
            {
                Session[Utils.SESSION_USER] = user;
            }

            var resp = new
            {
                status = status,
                errorMessage = errorMessage,
                user = user
            };

            Response.Write(JsonConvert.SerializeObject(resp));
            Response.End();

        }

    }
}