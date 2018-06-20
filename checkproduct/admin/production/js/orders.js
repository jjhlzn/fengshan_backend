/* * * * * * * * * * * * * * * * *
 * Pagination
 * javascript page navigation
 * * * * * * * * * * * * * * * * */
function clickItem(orderNo) {
    window.location.href = "order.aspx?orderNo="+orderNo;
    console.log('click item')
}

var Pagination = {

    code: '',

    // --------------------
    // Utility
    // --------------------

    // converting initialize data
    Extend: function (data) {
        data = data || {};
        Pagination.size = data.size || 300;
        Pagination.page = data.page || 1;
        Pagination.step = data.step || 3;
    },

    // add pages by number (from [s] to [f])
    Add: function (s, f) {
        for (var i = s; i < f; i++) {
            Pagination.code += '<a>' + i + '</a>';
        }
    },

    // add last page with separator
    Last: function () {
        Pagination.code += '<i>...</i><a>' + Pagination.size + '</a>';
    },

    // add first page with separator
    First: function () {
        Pagination.code += '<a>1</a><i>...</i>';
    },



    // --------------------
    // Handlers
    // --------------------

    // change page
    Click: function () {
        Pagination.page = +this.innerHTML;
        Pagination.Start();


        console.log("page click: " + Pagination.page)
        var queryObj = getQueryObj();
        queryObj.pageNo = parseInt(Pagination.page) - 1;
        queryObj.pageSize = 10;
        loadOrders(queryObj);
    },

    // previous page
    Prev: function () {
        Pagination.page--;
        if (Pagination.page < 1) {
            Pagination.page = 1;
        }
        Pagination.Start();
    },

    // next page
    Next: function () {
        Pagination.page++;
        if (Pagination.page > Pagination.size) {
            Pagination.page = Pagination.size;
        }
        Pagination.Start();
    },



    // --------------------
    // Script
    // --------------------

    // binding pages
    Bind: function () {
        var a = Pagination.e.getElementsByTagName('a');
        for (var i = 0; i < a.length; i++) {
            if (+a[i].innerHTML === Pagination.page) a[i].className = 'current';
            a[i].addEventListener('click', Pagination.Click, false);
        }
    },

    // write pagination
    Finish: function () {
        Pagination.e.innerHTML = Pagination.code;
        Pagination.code = '';
        Pagination.Bind();
    },

    // find pagination type
    Start: function () {
        if (Pagination.size < Pagination.step * 2 + 6) {
            Pagination.Add(1, Pagination.size + 1);
        }
        else if (Pagination.page < Pagination.step * 2 + 1) {
            Pagination.Add(1, Pagination.step * 2 + 4);
            Pagination.Last();
        }
        else if (Pagination.page > Pagination.size - Pagination.step * 2) {
            Pagination.First();
            Pagination.Add(Pagination.size - Pagination.step * 2 - 2, Pagination.size + 1);
        }
        else {
            Pagination.First();
            Pagination.Add(Pagination.page - Pagination.step, Pagination.page + Pagination.step + 1);
            Pagination.Last();
        }
        Pagination.Finish();
    },



    // --------------------
    // Initialization
    // --------------------

    // binding buttons
    Buttons: function (e) {
        var nav = e.getElementsByTagName('a');
        nav[0].addEventListener('click', Pagination.Prev, false);
        nav[1].addEventListener('click', Pagination.Next, false);
    },

    // create skeleton
    Create: function (e) {

        var html = [
            '<a>&#9668;</a>', // previous button
            '<span></span>',  // pagination container
            '<a>&#9658;</a>'  // next button
        ];

        e.innerHTML = html.join('');
        Pagination.e = e.getElementsByTagName('span')[0];
        Pagination.Buttons(e);
    },

    // init
    Init: function (e, data) {
        Pagination.Extend(data);
        Pagination.Create(e);
        Pagination.Start();
    }
};



/* * * * * * * * * * * * * * * * *
* Initialization
* * * * * * * * * * * * * * * * */

function getQueryObj() {
    var startDate = $('#startDate').val();
    var endDate = $('#endDate').val();

    if (!startDate) {
        alert("开始日期不能为空");
        return;
    }

    if (!endDate) {
        alert('结束日期不能为空')
        return;
    }
    var queryObj = {
        startDate: startDate,
        endDate: endDate,
        keyword: $('#keyword').val() ? $('#keyword').val() : ''
    }

    return queryObj;
}

function searchClick() {
    var queryObj = getQueryObj();
    queryObj.pageNo = 0;
    queryObj.pageSize = 10;
    loadOrders(queryObj);
    return false;
}

function loadOrders(queryObj) {
    $('#orderMenu').addClass('active')
    $('#orderMenu ul').css('display', 'block')

    $.post("/getorders.aspx", JSON.stringify(queryObj))
      .done(function (data) {
          //alert("下单成功");
          console.log(data);
          var result = JSON.parse(data);
          var items = JSON.parse(data).items;
          $('#tableBody').html('')
          items.forEach( function(order) {
              $('<tr>', { "class": "pointer" })
                 .append($('<td>').append($('<a>', {'href': "order.aspx?orderNo=" + order.orderNo}).html(order.orderNo)))
                 .append($('<td>').html(order.orderName))
                 .append($('<td>').html(order.deliveryDate.substr(0, 10)))
                 .append($('<td>').html(order.orderDate.substr(0, 10)))
                 .append($('<td>').html(order.flow.currentStatus))
                 .append($('<td>').html(order.amount))
                 .append($('<td>').html(order.receiveOrderPerson))
                  .append($('<td>').append($('<a>', { 'href': "order.aspx?orderNo=" + order.orderNo }).html('查看')))
                 .appendTo('#tableBody');
          })

          var init = function () {
              Pagination.Init(document.getElementById('pagination'), {
                  size: result.pages, // pages size
                  page: queryObj.pageNo + 1,  // selected page
                  step: 3   // pages before and after current
              });
          };

          if (result.totalCount != 0) {
              init();
          } else {
              $('pagination').html('')
          }
          //document.addEventListener('DOMContentLoaded', init, false);

      })
      .fail(function () {
          alert("获取订单失败");
      })
      .always(function () {
      });
}

$(document).ready(function () {
    console.log('...')
    $('#startDate').val('2018-01-01');
    $('#endDate').val('2018-12-31');
    var queryObj = getQueryObj();
    queryObj.pageNo = 0;
    queryObj.pageSize = 10;
    loadOrders(queryObj);
});



