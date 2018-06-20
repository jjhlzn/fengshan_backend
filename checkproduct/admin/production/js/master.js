
function logout() {
    if (window.confirm("确认退出？")) {


        $.post("/logoutpc.aspx", JSON.stringify({}))
          .done(function (data) {
              //alert("下单成功");
              console.log(data);
              var result = JSON.parse(data);
              if (result.status == 0) {
                  window.location.href = "/admin/production/login.aspx";
              } else {
                  alert(result.errorMessage)
              }
          })
          .fail(function () {
          })
          .always(function () {
          });
    }
}