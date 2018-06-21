using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dapper;
using System.Data;
using fengshan.DomainModel;

namespace fengshan.Service
{
    public class ConfigService
    {
        public bool loadConfigItems(Config config)
        {
            using (IDbConnection conn = ConnectionFactory.GetInstance())
            {
                string sql = @"select id, code, name, value, sequence from t_config where code = @code order by sequence, addtime";
                List<ConfigItem> items = conn.Query<ConfigItem>(sql, new { code = config.code }).AsList();

                config.items = items;

                return true;
            }
        }

        public string addItem(ConfigItem item)
        {
            using (IDbConnection conn = ConnectionFactory.GetInstance())
            {
                string sql = @"insert into t_config (id, code, name, value, sequence) values (@id, @code, @name, @value, @sequence)";
                string id = Guid.NewGuid().ToString();
                int count = conn.Execute(sql, new { id, code = item.typeCode, name = item.name, value = item.value, item.sequence });
                if (count == 1)
                    return id;
                return "";
            }
        }

        public bool deleteItem(string id)
        {
            using (IDbConnection conn = ConnectionFactory.GetInstance())
            {
                string sql = @"delete from t_config where id = @id";
                int count = conn.Execute(sql, new { id = @id });
                return count == 1;
            }
        }
    }
}