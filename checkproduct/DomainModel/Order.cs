using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace fengshan.DomainModel
{
    public class PageInfo
    {
        public int pageNo;
        public int pageSize = 10;
    }

    public class User
    {
        public string username;
        public string name;
        public string password;
        public string department;
        public string role;
    }

    public class Order
    {
        public String id;
        public String orderNo; //订单编号
        public String orderName;
        public String taobaoId;
        public String receiveOrderPerson;
        public Decimal amount; //金额
        public String orderDate; //下单日期
        public String deliveryDate; //发货日期
        public String material;
        public String isDuban;
        public String size;
        public String carveStyle;
        public String color;
        public String deliveryCompany;
        public String deliveryPayType;
        public String deliveryPackage;
        public String address;
        public String style;
        public int flag;
        public String memo;
        public List<string> contentImages = new List<string>();
        public List<string> templateImages = new List<string>();
        public List<String> otherImages = new List<string>();
        public string otherImageUpdateTime = "";
        public Flow flow;

        public Order() { }

    }

    public class Flow
    {
        public List<FlowStatus> statusList = new List<FlowStatus>();

        public static Flow DefaultFlow = new Flow();

        static Flow()
        {
            FlowStatus status0 = new FlowStatus("雕刻", 0);
            FlowStatus status1 = new FlowStatus("打磨", 1);
            FlowStatus status2 = new FlowStatus("油漆", 2);
            FlowStatus status3 = new FlowStatus("描字", 3);
            FlowStatus status4 = new FlowStatus("发货", 4);
            DefaultFlow.statusList.Add(status0);
            DefaultFlow.statusList.Add(status1);
            DefaultFlow.statusList.Add(status2);
            DefaultFlow.statusList.Add(status3);
            DefaultFlow.statusList.Add(status4);
            DefaultFlow.statusList.Add(FlowStatus.FinishStatus);
        }

        public Flow()
        {
        }

        public Flow(List<FlowStatus> statusList)
        {
            this.statusList = statusList;
        }

        public Flow(Flow flow)
        {
            List<FlowStatus> statuses = new List<FlowStatus>();
            foreach(FlowStatus status in flow.statusList)
            {
                statuses.Add(new FlowStatus(status));
            }
            this.statusList = statuses;
        }

        public string currentStatus = "";

        public string getCurrentStatus()
        {
            foreach(FlowStatus status in statusList)
            {
                if (!status.isFinished)
                {
                    return status.name;
                }
            }
            return "完成";
        }
    }

    public class FlowStatus
    {
        public string orderNo;
       // public String id;
        public String name;
        public Boolean isFinished;
        public User finishUser;
        public DateTime finishDate;
        public int sequence;

        public FlowStatus() { }
        public FlowStatus(String name, int seq)
        {
            this.name = name;
            this.sequence = seq;
        }

        public FlowStatus(FlowStatus status)
        {
            this.name = status.name;
        }

        public static FlowStatus FinishStatus = new FlowStatus("完成", 10000);
    }

    public class Config
    {
        public static List<Config> ALL_CONFIGS = new List<Config>();
        public string code = "";
        public string name = "";
        public List<ConfigItem> items = new List<ConfigItem>();

        public Config() { }
        public Config(string code, string name)
        {
            this.code = code;
            this.name = name;
        }

        public static Config JDR = new Config("JDR", "接单人");
        public static Config DKFS =  new Config("DKFS", "雕刻方式");
        public static Config CZ =  new Config("CZ", "材质");
        public static Config CZDB =  new Config("CZDB", "材质-独板");
        public static Config WLGS =  new Config("WLGS", "物流公司");
        public static Config WLZFFS =  new Config("WLZFFS", "物流支付方式");
        public static Config WLDBFS =  new Config("WLDBFS", "物流打包方式");
        public static Config KS =  new Config("KS", "款式");

        static Config()
        {
            ALL_CONFIGS.Add(JDR);
            ALL_CONFIGS.Add(DKFS);
            ALL_CONFIGS.Add(CZ);
            ALL_CONFIGS.Add(CZDB);
            ALL_CONFIGS.Add(WLGS);
            ALL_CONFIGS.Add(WLZFFS);
            ALL_CONFIGS.Add(WLDBFS);
            ALL_CONFIGS.Add(KS);
        }

        public static Config getConfig(string code)
        {
            foreach(Config config in ALL_CONFIGS)
            {
                if (code == config.code)
                {
                    return config;
                }
            }
            return null;
        }
    }

    public class ConfigItem
    {
        public string id;
        public string typeName;
        public string typeCode;
        public string name;
        public string value;
        public int sequence;
    }
}