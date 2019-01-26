var order = {
    contentImages: [],
    templateImages: []
};
var myDropzone;
var myDropzone2;

function submitForm() {
    var validateResult = true;
    $('#formdiv :input:not(:button)').parsley().forEach(function(item) {
        if (item.validate) {
            validateResult =  (item.validate() === true) && validateResult;
        }
    })
    if (validateResult !== true)
        return;


    order.orderNo = getQueryParam('orderNo');
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

    console.log(JSON.stringify(order));

    var errMsg = checkForm(order);
    if (errMsg) {
        alert(errMsg);
        return;
    }

   
    $.post("/modifyorder.aspx", JSON.stringify(order))
      .done(function (data) {
          //alert("下单成功");
          console.log(data);
          var result = JSON.parse(data);
          if (result.status == 0) {
              //alert("下单成功");
              // resetForm();
              window.location.href = "order.aspx?orderNo="+order.orderNo
          } else {
              alert("修改失败");
          }
      })
      .fail(function () {
          alert("修改失败");
      }) 
}

function checkForm(order) {
    for (var property in order) {
        if (order.hasOwnProperty(property)) {
            // do stuff
            if (!order[property] && property != "memo"  ) {
                return property + "不允许为空";
            }
        }
    }

    /*
    if (order.contentImages.length == 0) {
        return "请上传内容图片";
    }

    if (order.templateImages.length == 0) {
        return "请上传样板底色图片";
    } */

    return "";
}

function initDropzone(dropzone, type) {
    dropzone.on("success", function (file, resp) {
        /* Maybe display some more file information on your page */
        let json = JSON.parse(resp);
        var imageArray;
        if (type == 'content') {
            imageArray = order.contentImages
        } else {
            imageArray = order.templateImages
        }
        //console.log(file)
        if (json.status == 0 && json.fileNames.length > 0) {
            imageArray.push(json.fileNames[0]);
            console.log(imageArray)
            file.upload.name = json.fileNames[0];
            file.name = json.fileNames[0];
        }
    });

    dropzone.on("removedfile", function (file) {
        
        var imageArray;
        if (type == 'content') {
            imageArray = order.contentImages
        } else {
            imageArray = order.templateImages
        }
        var name = file.upload ? file.upload.name :  null;
        if (!name) {
            name = file.name;
        }
        //console.log("name: " + name)
        _.remove(imageArray, function (item) { return item == name })
        console.log(imageArray) 
    });
}

$(function () {
    $('#orderMenu').addClass('active')
    $('#orderMenu ul').css('display', 'block')
    
    // Now that the DOM is fully loaded, create the dropzone, and setup the
    // event listeners
    Dropzone.autoDiscover = false;

    myDropzone = new Dropzone("#my-awesome-dropzone", { addRemoveLinks: true, });
    initDropzone(myDropzone, 'content')

    $("input[type='radio']").click(function () {
        $(this).attr('checked', 'checked');
        let self = this;
        $("input[type='radio']").each(function (item) {
            if (this.id != self.id) {
                $(this).attr('checked', null);
            }
        });
    });


    myDropzone2 = new Dropzone("#my-awesome-dropzone2", { addRemoveLinks: true, });
    initDropzone(myDropzone2, 'template')

    document.onpaste = function (event) {
        var items = (event.clipboardData || event.originalEvent.clipboardData).items;
        for (index in items) {
            var item = items[index];
            if (item.kind === 'file') {
                // adds the file to your dropzone instance
                if ($('#contentRadio').attr('checked')) {
                    myDropzone.addFile(item.getAsFile())
                } else {
                    myDropzone2.addFile(item.getAsFile())
                }
               
            }
        }
    }

    $.post("/getorderinfo.aspx", JSON.stringify({ orderNo: getQueryParam('orderNo') }))
     .done(function (data) {
         //alert("下单成功");
         console.log(data);
         var result = JSON.parse(data);
         if (result.status != 0) {
             alert('订单不存在');
             return;
         }
         var order = result.order;
         

         var string = "taobaoId,receiveOrderPerson, orderDate, deliveryDate, size, carveStyle, color, deliveryCompany, deliveryPayType, deliveryPackage, address, memo, amount, orderName,style,memo, material, isDuban";
         var properties = string.split(",");
         properties.forEach(function (prop) {
             $('#' + _.trim(prop)).val(order[_.trim(prop)]);
         })


         var contentImages = order.contentImages;
         contentImages.forEach(function (img) {
             $('<img>', { 'style': "width: 80%", src: "/uploads/" + img }).appendTo('#contentImagesDiv');
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
                $('<div>', { 'class': 'statusDiv' })
                    .append($('<img>', { 'src': status.isFinished ? './images/finished.png' : './images/notfinished.png', 'class': 'statusImage' }))
                    .append($('<p>', { 'class': 'statusText' }).html(status.name))
             ).appendTo('#progressRow');

             console.log(status.name != '完成')
             if (status.name != '完成') {
                 $('<td>').append(
                     $('<div>').append(
                        $('<img>', { 'src': './images/arrow.png', 'class': 'arrowImage' })
                     )
                 ).appendTo('#progressRow')
             }
         });

         var contentImages = order.contentImages;
         window.order.contentImages = contentImages
         contentImages.forEach(function (img, index) {
             var mockFile = { name: img, size: index +1 };
             // Call the default addedfile event handler
             myDropzone.emit("addedfile", mockFile);
             myDropzone.emit("thumbnail", mockFile, window.location.origin + "/uploads/" + img);
             myDropzone.emit("complete", mockFile);
         })

         var templateImages = order.templateImages;
         window.order.templateImages = templateImages
         templateImages.forEach(function (img, index) {
             var mockFile = { name: img, size: index + 1 };
             // Call the default addedfile event handler
             myDropzone2.emit("addedfile", mockFile);
             myDropzone2.emit("thumbnail", mockFile, window.location.origin + "/uploads/" + img);
             myDropzone2.emit("complete", mockFile);
         })

     })
})