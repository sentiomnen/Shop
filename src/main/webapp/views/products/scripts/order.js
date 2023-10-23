$(document).on('click', '#order', function() {
    let form = $('form#insert');
    form.attr("action", "/cart/order.do");
    // form.submit();

    console.log(get_role());
});

$(document).on('click', '#add', function() {
    let form  = $('form#insert');
    let check = checkLogin();
    if (check !== true) {
        form.attr("action", check);
        form.submit();
    }
    else {
        let name   = form.find('input[name="name"]').val();
        let number = form.find('input[name="number"]').val();
        let price = form.find('input[name="price"]').val();
        let ref    = form.find('input[name="ref"]').val();
        let params = {'name': name, 'ref': ref, 'number': number, 'price': price};

        $.ajax({
            async: false,
            type: 'POST',
            url: '/cart/add.do',
            data: params,
            dataType: 'text',
            success: function(data) {
                if (data == "failed") return;
                let goto = prompt("장바구니에 담았습니다.\n장바구니로 이동하시겠습니까?", true)
                if (goto) location.href = "/cart";
            },
            error: function() { console.log("AJAX Communication Failed"); }
        })
    }
});
