using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Dapper;
using checkproduct.DomainModel;
using log4net;

namespace checkproduct.Service
{
    public class GetCheckOrdersResult
    {
        public List<CheckOrder> checkOrders;
        public int totalCount;
    }
   
}