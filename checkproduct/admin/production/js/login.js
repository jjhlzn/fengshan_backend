
function submitForm() {
    var validateResult = true;
    $('#formdiv :input:not(:button)').parsley().forEach(item => {
        if (item.validate) {
            validateResult = validateResult && (item.validate() === true);
        }
    })
    if (validateResult !== true)
        return;

    $.post("/login.aspx", JSON.stringify({a: $('#username').val(), b: $('#password').val()}))
      .done(function (data) {
          //alert("下单成功");
          console.log(data);
          var result = JSON.parse(data);
          if (result.status == 0) {
              console.log('登录成功')
              window.location.href = "orders.aspx";
          } else {
              console.log('登录失败')
              alert(result.errorMessage)
          }
      })
      .fail(function () {
          console.log('登录失败')
      })
      .always(function () {
      });
}