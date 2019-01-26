
function getOrderNo() {
    var orderNo = _.chain(window.location.search)
    .replace('?', '') // a=b454&c=dhjjh&f=g6hksdfjlksd
    .split('&') // ["a=b454","c=dhjjh","f=g6hksdfjlksd"]
    .map(_.partial(_.split, _, '=', 2)) // [["a","b454"],["c","dhjjh"],["f","g6hksdfjlksd"]]
    .fromPairs() // {"a":"b454","c":"dhjjh","f":"g6hksdfjlksd"}
    .value().orderNo;
    return orderNo;
}

function setPrintTable(order) {
    var string = "taobaoId,receiveOrderPerson, orderDate, deliveryDate, size, carveStyle, color, deliveryCompany, deliveryPayType, deliveryPackage, address, memo, amount, orderName,style,memo";
    var properties = string.split(",");
    properties.forEach(function (prop) {
        $('#' + _.trim(prop) + '2').html(order[_.trim(prop)]);
    })

    $('#orderName3').html(order.orderName)
    $('#material2').html(order['material'] + ' &nbsp;&nbsp;  ' + order['isDuban']);

    $('#delivery2').html(order.deliveryCompany + ' - ' + order.deliveryPayType + ' - ' + order.deliveryPackage);
}



function clickStatus(statusDiv) {
    var name = $($(statusDiv).children()[1]).html()
    var sequence = $($(statusDiv).children()[1]).attr('sequence')
    var isFinished = $($(statusDiv).children()[1]).attr('isFinished') == '1'

    $.post("/setflowstatus.aspx", JSON.stringify({ orderNo: getOrderNo(), statusName: name, isFinished: !isFinished}))
    .done(function (data) {
        //alert("下单成功");
        console.log(data);
        var result = JSON.parse(data);
        if (result.status != 0) {
            alert('设置失败');
            return;
        }
        setOrderStatus(name, sequence, !isFinished)
    })
}

function setOrderStatus(name, sequence, isFinished) {
    $('.statusDiv').each(function () {
       
        var s = $($(this).children()[1]).attr('sequence')
        if (isFinished) {
            if (s <= sequence) {
                $($(this).children()[1]).attr('isFinished', '1')
                $($(this).children()[0]).attr('src', './images/finished.png')
            }
        } else {
            if (s >= sequence) {
                $($(this).children()[1]).attr('isFinished', '0')
                $($(this).children()[0]).attr('src', './images/notfinished.png')
            }
        }
    })

    var isOrderFinished = true
    $('.statusDiv').each(function () {
        var n = $($(this).children()[1]).html()
        if (n != '完成') {
            isOrderFinished = isOrderFinished && $($(this).children()[1]).attr('isFinished') == '1'
        }
    })

    
    $('.statusDiv').each(function () {
        var n = $($(this).children()[1]).html()
        if (n == '完成') {
            if (isOrderFinished) {
                $($(this).children()[1]).attr('isFinished', '1')
                $($(this).children()[0]).attr('src', './images/finished.png')
            } else {
                $($(this).children()[1]).attr('isFinished', '0')
                $($(this).children()[0]).attr('src', './images/notfinished.png')
            }
        } 
    })
    
}

$(document).ready(function(){
    $('#orderMenu').addClass('active')
    $('#orderMenu ul').css('display', 'block')

    $.post("/getorderinfo.aspx", JSON.stringify({orderNo: getOrderNo()}))
     .done(function (data) {
         //alert("下单成功");
         console.log(data);
         var result = JSON.parse(data);
         if (result.status != 0) {
             alert('订单不存在');
             return;
         }
         var order = result.order;

         var string = "taobaoId,receiveOrderPerson, orderDate, deliveryDate, size, carveStyle, color, deliveryCompany, deliveryPayType, deliveryPackage, address, memo, amount, orderName,style,memo";
         var properties = string.split(",");
         properties.forEach(function (prop) {
             $('#' + _.trim(prop)).html(order[_.trim(prop)]);
         })

         setPrintTable(order)

        

         $('#material').html(order['material'] + ' &nbsp;&nbsp;  ' +order['isDuban']);

         $('#delivery').html(order.deliveryCompany + ' - ' + order.deliveryPayType + ' - ' + order.deliveryPackage);

         var contentImages = order.contentImages;
         contentImages.forEach( function(img) {
             $('<img>', {'style': "width: 80%", src: "/uploads/"+img}).appendTo('#contentImagesDiv');
         });
         
         var templateImages = order.templateImages;
         templateImages.forEach(function (img) {
             $('<img>', { 'style': "width: 80%", src: "/uploads/" + img }).appendTo('#templateImagesDiv');
         });

         var otherImages = order.otherImages;
         otherImages.forEach(function (img) {
             $('<img>', { 'style': "width: 40%", src: "/uploads/" + img }).appendTo('#otherImagesDiv');
         });

         var statusList = order.flow.statusList;
         statusList.forEach(function (status) {
             
             $('<td>').append(
                $('<div>', { 'class': 'statusDiv', onclick: 'clickStatus(this)' })
                    .append($('<img>', {'src': status.isFinished ? './images/finished.png' : './images/notfinished.png', 'class': 'statusImage'}))
                    .append($('<p>', { 'class': 'statusText', sequence: status.sequence, isFinished: status.isFinished ? "1" : "0"}).html(status.name))
             ).appendTo('#progressRow');

             console.log(status.name != '完成')
             if (status.name != '完成') {
                 $('<td>').append(
                     $('<div>').append(
                        $('<img>', {'src': './images/arrow.png', 'class': 'arrowImage'})
                     )
                 ).appendTo('#progressRow')
             } 
         });
        
     })
});

function deleteOrderClick() {
    if (window.confirm('你确认删除吗？')) {
        deleteOrder();
    }
}

function modifyClick() {
    window.location.href = "/admin/production/modifyorder.aspx?orderNo="+getQueryParam('orderNo')
}

function deleteOrder() {
    $.post("/deleteorder.aspx", JSON.stringify({ orderNo: getOrderNo() }))
    .done(function (data) {
        console.log(data);
        var result = JSON.parse(data);
        if (result.status != 0) {
            alert('订单删除失败');
            return;
        }

        window.location.href = "orders.aspx";

    })
}

function printClick() {
   
    //
    if (! (/Chrome/.test(navigator.userAgent) && /Google Inc/.test(navigator.vendor)) ) {
        if (window.confirm("当前浏览器不能支持打印，请下载Chrome浏览器，点击确定跳转到下载页面")) {
            window.location.href = "/admin/production/support.aspx";
        }
        return;
    }

    var dom = $('#printDiv');
    dom.show()
    printJS({ printable: 'printDiv', type: 'html', css: './css/order.css' })
    dom.hide();
}