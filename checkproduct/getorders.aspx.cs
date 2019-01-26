using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using fengshan.DomainModel;
using checkproduct.Service;
using log4net;
using System.IO;
using fengshan.Service;

namespace fengshan
{
    class QueryRequest
    {
        public string startDate;
        public string endDate;
        public string keyword;
        public string status;
        public bool isShowFinished;
        public int pageNo;
        public int pageSize;
        
    }

    public partial class getorders : System.Web.UI.Page
    {
        //private CheckOrderService checkOrderService = new CheckOrderService();
        private static ILog logger = LogManager.GetLogger(typeof(getorders));

        protected void Page_Load(object sender, EventArgs e)
        {
            Stream req = Request.InputStream;
            req.Seek(0, System.IO.SeekOrigin.Begin);
            string json = new StreamReader(req).ReadToEnd();
            logger.Debug(json);
            QueryRequest query = JsonConvert.DeserializeObject<QueryRequest>(json);

            QueryResult result = new OrderService().search(query.startDate, query.endDate, query.keyword, query.isShowFinished, query.pageNo, query.pageSize);

            var resp = new
            {
                status = 0,
                errorMessage = "",
                totalCount = result.totalCount,
                pages = (result.totalCount + query.pageSize - 1) / query.pageSize,
                items = result.orders
            };

            Response.Write(JsonConvert.SerializeObject(resp));
            Response.End();
        }

    }
}