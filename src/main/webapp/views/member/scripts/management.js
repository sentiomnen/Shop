$(document).ready(function() {
    $('#member tbody tr').click(function() {
        let number = $(this).find('#no').text();
        location.href = "/member/view?no="+number;
    });
});