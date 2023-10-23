let name = 1, price = 1, stock = 1, description = 1;

$(document).ready(function() {
    rendering("no", 1);

    $('div.data-table#products th#name').click(function() {
        clear(); rendering("name", name);
        name *= -1;
    })
    $('div.data-table#products th#price').click(function() {
        clear(); rendering("price", price);
        price *= -1;
    })
    $('div.data-table#products th#stock').click(function() {
        clear(); rendering("stock", stock);
        stock *= -1;
    })
    $('div.data-table#products th#description').click(function() {
        clear(); rendering("description", description);
        description *= -1;
    })
})

// Region Document;
function rendering(sort, dir) {
    let data = getList(sort.toUpperCase(), dir);
    let body = $('div.data-table#products tbody');

    if (data == null) {
        body.append("<tr><td colspan='4'>아직 상품이 없습니다.</td><tr>");
        return;
    }

    data.forEach(function(row, i) {
        let row_str  = "<tr>";
        row_str += "<td class='no' id='no'>" + row["rn"] + "</td>";
        row_str += "<td class='name'>" + row["name"] + "</td>";
        row_str += "<td class='short'>" + row["price"] + "</td>";
        row_str += "<td class='no'>" + row["stock"] + "</td>";
        row_str += "<td class='long'>" + row["description"] + "</td>";
        row_str += "</tr>";
        body.append(row_str);
    });
}
function clear() {
    let row_list = $('div.data-table#products tbody').children();
    row_list.remove();
}
// End Region Document;
// Region Get date;
function getList(sort, dir)    {
    let page = new URL(window.location.href);
    page = page.searchParams.get('page');
    let query = '/products/list.do?page='+page+'&sort='+sort+'&dir='+dir
    console.log(query);

    let productList;
    $.ajax({
        async: false,
        type: 'POST',
        url: query,
        dataType: 'json',
        success: function(data) {
            productList = data;
        },
        error: function() {
            productList = null;
        }
    })

    return productList;
}
// End Region Get date;