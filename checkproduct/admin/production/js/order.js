
function getOrderNo() {
    var orderNo = _.chain(window.location.search)
    .replace('?', '') // a=b454&c=dhjjh&f=g6hksdfjlksd
    .split('&') // ["a=b454","c=dhjjh","f=g6hksdfjlksd"]
    .map(_.partial(_.split, _, '=', 2)) // [["a","b454"],["c","dhjjh"],["f","g6hksdfjlksd"]]
    .fromPairs() // {"a":"b454","c":"dhjjh","f":"g6hksdfjlksd"}
    .value().orderNo;
    return orderNo;
}

$(document).ready(() => {
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

         var string = "taobaoId,receiveOrderPerson, orderDate, deliveryDate, size, carveStyle, color, deliveryCompany, deliveryPayType, deliveryPackage, address, memo, amount, orderName,style";
         var properties = string.split(",");
         properties.forEach(prop => {
             $('#' + _.trim(prop)).html(order[_.trim(prop)]);
         })

         $('#material').html(order['material'] + ' &nbsp;&nbsp;  ' +order['isDuban']);

         $('#delivery').html(order.deliveryCompany + ' - ' + order.deliveryPayType + ' - ' + order.deliveryPackage);

         var contentImages = order.contentImages;
         contentImages.forEach(img => {
             $('<img>', {"width": "85%", src: "/uploads/"+img}).appendTo('#contentImagesDiv');
         });
         
         var templateImages = order.templateImages;
         templateImages.forEach(img => {
             $('<img>', { "width": "85%", src: "/uploads/" + img }).appendTo('#templateImagesDiv');
         });


         var statusList = order.flow.statusList;
         statusList.forEach(status => {
             
             $('<td>').append(
                $('<div>', { 'class': 'statusDiv' })
                    .append($('<img>', {'src': status.isFinished ? './images/finished.png' : './images/notfinished.png', 'class': 'statusImage'}))
                    .append($('<p>', {'class': 'statusText'}).html(status.name))
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