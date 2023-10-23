function get_role() {
    let role = "anonymous";

    $.ajax({
        async: false,
        type: 'POST',
        url: '/member/check-role',
        dataType: 'text',
        success: function(data) {
            role = data;
        },
        error: function() { console.log("AJAX Communication Failed"); }
    })

    return role;
}

function get_id() {
    let id = "";

    $.ajax({
        async: false,
        type: 'POST',
        url: '/member/get-id',
        dataType: 'text',
        success: function(data) {
            id = data;
        },
        error: function() { console.log("AJAX Communication Failed"); }
    })

    return id;
}
