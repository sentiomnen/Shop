$(document).ready(function() {
    $('#board tbody tr').click(function() {
        let number = $(this).find('#no').text();
        location.href = "/board/view?no="+number;
    });
});