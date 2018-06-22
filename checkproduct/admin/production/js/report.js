


$(document).ready(function () {
    $('#orderMenu').addClass('active')
    $('#orderMenu ul').css('display', 'block')

    $.post("/report.aspx", JSON.stringify({}))
      .done(function (data0) {
          console.log(data0);
          
          var result = JSON.parse(data0);
          if (result.status == 0) {
              
              $('#notFinishedOrderCount').html(result.result.notFinishedOrders)
              $('#timeoutOrderCount').html(result.result.timeoutOrders)
              createOrderChart(result.result.orderChart);
              
          } else {
              alert("获取数据失败");
          }
      })
      .fail(function () {
          alert("获取数据失败");
      })
      .always(function () {
         
      })
    //window.createOrderChart()
}) 

function createOrderChart(data1) {
    var ctx = document.getElementById("orderChart").getContext("2d");
    console.log(ctx)
    var data = {
        labels: ["小王", "小金", "小张", "小刘", "小毛", "小毛", "小毛", "小毛", "小毛"],
        datasets: [{
            label: "未完成",
            backgroundColor: "#1ABB9C",
            data: [13, 7, 1, 2, 3, 1, 2, 3, 20]
        }, {
            label: "超时",
            backgroundColor: "#E74C3C",
            data: [24, 3, 1, 2, 3, 1, 2, 3, 20]
        }, ]
    };
    if (data1) {
        data = data1
    }


    new Chart(ctx, {
        type: 'bar',
        data: data,
        options: {
            barValueSpacing: 40,
            scales: {
                yAxes: [{
                    ticks: {
                        min: 0,
                    }
                }]
            },
            "animation": {
                "duration": 1,
                "onComplete": function () {
                    var chartInstance = this.chart,
                      ctx = chartInstance.ctx;

                    ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
                    ctx.textAlign = 'center';
                    ctx.textBaseline = 'bottom';

                    this.data.datasets.forEach(function (dataset, i) {
                        var meta = chartInstance.controller.getDatasetMeta(i);
                        meta.data.forEach(function (bar, index) {
                            var data = dataset.data[index];
                            ctx.fillText(data, bar._model.x, bar._model.y - 5);
                        });
                    });
                }
            },
        },
        
    });
}
