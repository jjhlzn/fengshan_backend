function submitForm() {

    var order = {}
    order.taobaoId = _.trim($('#taobaoId').val());
    order.receiveOrderPerson = _.trim($('#receiveOrderPerson').val());
    order.orderDate = _.trim($('#orderDate').val());
    order.deliveryDate = _.trim($('#deliveryDate').val());
    order.material = _.trim($('#material').val());
    order.style = _.trim($('#style').val());
    order.size = _.trim($('#size').val());
    order.carveStyle = _.trim($('#carveStyle').val());
    order.color = _.trim($('#color').val());
    order.deliveryCompany = _.trim($('#deliveryCompany').val());
    order.deliveryPayType = _.trim($('#deliveryPayType').val());
    order.deliveryStyle = _.trim($('#deliveryStyle').val());
    order.address = _.trim($('#address').val());

    console.log(JSON.stringify(order));

    var errMsg = checkForm(order);
    if (errMsg) {
        alert(errMsg);
        return;
    }
    
    $.post("/neworder.aspx", {req: order})
      .done(function (data) {
          //alert("下单成功");
          console.log(data);
      })
      .fail(function () {
          alert("下单失败");
      })
      .always(function () {
      });
}

function checkForm(order) {
    for (var property in order) {
        if (order.hasOwnProperty(property)) {
            // do stuff
            if (!order[property]) {
                return "所有属性都不允许为空";
            }
        }
    }
    return "";
}