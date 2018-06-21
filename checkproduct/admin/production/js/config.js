$(document).ready(function () {
    $('#orderMenu').addClass('active')
    $('#orderMenu ul').css('display', 'block')
})

function getTypeCode() {
    var typeCode = _.chain(window.location.search)
    .replace('?', '') // a=b454&c=dhjjh&f=g6hksdfjlksd
    .split('&') // ["a=b454","c=dhjjh","f=g6hksdfjlksd"]
    .map(_.partial(_.split, _, '=', 2)) // [["a","b454"],["c","dhjjh"],["f","g6hksdfjlksd"]]
    .fromPairs() // {"a":"b454","c":"dhjjh","f":"g6hksdfjlksd"}
    .value().code;
    return typeCode;
}

function addClick() {
    var name = _.trim($('#name').val());
    var sequence = parseInt(_.trim($('#sequence').val()));
    if (!sequence) {
        sequence = 0;
    }

    if (!name) {
        alert("值不能为空")
        return;
    }

    $.post("/configitem.aspx", JSON.stringify({ op: 'add', type: getTypeCode(), name: name, sequence: sequence }))
      .done(function (data) {
          //alert("下单成功");
          console.log(data);
          var result = JSON.parse(data);
          if (result.status == 0) {
              //alert("添加成功");
              $('#name').val('')
              $('#sequence').val('')
              $('<tr>', { 'class': 'pointer', id: result.id })
                .append($('<td>').html(name))
                .append($('<td>').html(sequence))
                .append($('<td>', { 'class': 'last' })
                        .append($('<a>', { 'href': '#', onclick: "deleteClick('" + result.id + "'); return false;" }).html('删除')))
                .appendTo('#tableBody')

          } else {
              alert("添加失败");
          }
      })
      .fail(function () {
          alert("添加失败");
      })
}


function deleteClick(id) {
    console.log(id)
    $.post("/configitem.aspx", JSON.stringify({ op: 'delete', type: getTypeCode(), id: id }))
      .done(function (data) {
          //alert("下单成功");
          console.log(data);
          var result = JSON.parse(data);
          if (result.status == 0) {
              $('#' + id).remove()

          } else {
              alert("删除失败");
          }
      })
      .fail(function () {
          alert("删除失败");
      })
}