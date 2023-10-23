$(document).ready(function() {
    $('#products tbody tr').click(function() {
        let number = $(this).find('#no').text();
        location.href = "/products/edit?no="+number;
    });
});