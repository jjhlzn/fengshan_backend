function isOrderTimeout(order) {
    var isTimeout = order.deliveryDate < moment().format('YYYY-MM-DD');
    return isTimeout && !isOrderFinished(order);
}


function isOrderFinished(order) {
    var isFinished = false;
    var statusList = order.flow.statusList;
    statusList.forEach(function (status) {
        if (status.name == '完成' && status.isFinished) {
            isFinished = true;
        }
    });
    return isFinished;
}

function updateQueryStringParameter(uri, key, value) {
    var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
    var separator = uri.indexOf('?') !== -1 ? "&" : "?";
    if (uri.match(re)) {
        return uri.replace(re, '$1' + key + "=" + value + '$2');
    }
    else {
        return uri + separator + key + "=" + value;
    }
  
}

function updateWindowUrl(key, value) {
    var newUrl = updateQueryStringParameter(window.location.href, key, value)
    window.history.pushState({ path: newUrl }, '', newUrl);
}

function getQueryParam(key) {
    var value = _.chain(window.location.search)
    .replace('?', '') // a=b454&c=dhjjh&f=g6hksdfjlksd
    .split('&') // ["a=b454","c=dhjjh","f=g6hksdfjlksd"]
    .map(_.partial(_.split, _, '=', 2)) // [["a","b454"],["c","dhjjh"],["f","g6hksdfjlksd"]]
    .fromPairs() // {"a":"b454","c":"dhjjh","f":"g6hksdfjlksd"}
    .value()[key];
    return value;
}