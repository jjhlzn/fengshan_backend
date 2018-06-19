var contentImgs = [];
var yanbanImgs = [];

function submitForm() {
    var validateResult = true;
    $('#formdiv :input:not(:button)').parsley().forEach(item => {
        if (item.validate) {
            validateResult = validateResult && (item.validate() === true);
        }
    })
    if (validateResult !== true)
        return;

    var order = {}
    order.taobaoId = _.trim($('#taobaoId').val());
    order.receiveOrderPerson = _.trim($('#receiveOrderPerson').val());
    order.orderName = _.trim($('#orderName').val());
    order.amount = _.trim($('#amount').val());
    order.orderDate = _.trim($('#orderDate').val());
    order.deliveryDate = _.trim($('#deliveryDate').val());
    order.material = _.trim($('#material').val());
    order.isDuban = _.trim($('#isDuban').val());
    order.style = _.trim($('#style').val());
    order.size = _.trim($('#size').val());
    order.carveStyle = _.trim($('#carveStyle').val());
    order.color = _.trim($('#color').val());
    order.deliveryCompany = _.trim($('#deliveryCompany').val());
    order.deliveryPayType = _.trim($('#deliveryPayType').val());
    order.deliveryPackage = _.trim($('#deliveryPackage').val());
    order.address = _.trim($('#address').val());
    order.memo = _.trim($('#memo').val());
    

    order.contentImages = contentImgs;
    order.templateImages = yanbanImgs;

    console.log(JSON.stringify(order));

    var errMsg = checkForm(order);
    if (errMsg) {
        alert(errMsg);
        return;
    }

    $.post("/neworder.aspx", JSON.stringify(order))
      .done(function (data) {
          //alert("下单成功");
          console.log(data);
          var result = JSON.parse(data);
          if (result.status == 0) {
              alert("下单成功");
          } else {
              alert("下单失败");
          }
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
            if (!order[property] && property != "memo") {
                return property + "不允许为空";
            }
        }
    }

    if (order.contentImages.length == 0) {
        return "请上传内容图片";
    }

    if (order.templateImages.length == 0) {
        return "请上传样板底色图片";
    }

    return "";
}

$(function () {
    $('#orderMenu').addClass('active')
    $('#orderMenu ul').css('display', 'block')

    // Now that the DOM is fully loaded, create the dropzone, and setup the
    // event listeners
    Dropzone.autoDiscover = false;
    //var myDropzone = $("#my-awesome-dropzone");
    var myDropzone = new Dropzone("#my-awesome-dropzone");
    console.log(myDropzone);

    myDropzone.on("success", function (file, resp) {
        /* Maybe display some more file information on your page */
        let json = JSON.parse(resp);
        if (json.status == 0 && json.fileNames.length > 0) {
            contentImgs.push(json.fileNames[0]);
        }
    });


    var myDropzone2 = new Dropzone("#my-awesome-dropzone2");
    myDropzone2.on("success", function (file, resp) {
        /* Maybe display some more file information on your page */
        let json = JSON.parse(resp);
        if (json.status == 0 && json.fileNames.length > 0) {
            yanbanImgs.push(json.fileNames[0]);
        }
    });
})