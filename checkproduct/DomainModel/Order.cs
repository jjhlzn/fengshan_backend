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
        public Decimal amount; //金额
        public DateTime orderDate; //下单日期
        public DateTime deliveryDate; //发货日期
        public String memo;
        public List<String> files = new List<string>();
        public Flow flow;

        public Order() { }

    }

    public class Flow
    {
        public List<FlowStatus> statusList = new List<FlowStatus>();

        public static Flow DefaultFlow = new Flow();

        static Flow()
        {
            FlowStatus status0 = new FlowStatus("雕刻");
            FlowStatus status1 = new FlowStatus("打磨");
            FlowStatus status2 = new FlowStatus("油漆");
            FlowStatus status3 = new FlowStatus("描字");
            FlowStatus status4 = new FlowStatus("发货");
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
    }

    public class FlowStatus
    {
       // public String id;
        public String name;
        public Boolean isFinished;
        public User finishUser;
        public DateTime finishDate;

        public FlowStatus() { }
        public FlowStatus(String name)
        {
            this.name = name;
        }

        public FlowStatus(FlowStatus status)
        {
            this.name = status.name;
        }

        public static FlowStatus FinishStatus = new FlowStatus("完成");
    }
}