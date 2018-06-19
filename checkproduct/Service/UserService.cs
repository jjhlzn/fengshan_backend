using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dapper;
using checkproduct.DomainModel;
using System.Data;
using log4net;

namespace fengshan.Service
{
    public class UserService
    {
        private static ILog logger = LogManager.GetLogger(typeof(UserService));


        public User Login(string userName, string password)
        {
            using (IDbConnection conn = ConnectionFactory.GetInstance())
            {
                string sql = "select username, name, password from t_user where userName = @userName and password = @password";
                var user = conn.QueryFirstOrDefault<User>(sql, new { userName, password });

                if (user == null)
                    return null;
            
                return user;
            }
        }



    }
}