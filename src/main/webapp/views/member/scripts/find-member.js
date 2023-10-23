$(document).ready(function() {
    // Select tab and remove right border of left tab of selected.
    let selected_tab = new URL(window.location.href);
    selected_tab = selected_tab.searchParams.get('find');

    let tab = $('nav.tab li');
    tab.each(function(i) {
        let $current = tab.eq(i);
        $current.removeClass('selected');
    });
    tab = $('nav.tab li#'+selected_tab).addClass('selected');
});
// Region Find methods
function find_id() {
    let user_name  = $('input[name="user_name"]').val();
    let user_email = $('input[name="user_email"]').val();

    if (validate_email(user_email)) return;

    let invalid = false;
    $.ajax({
        type: 'POST',
        async: false,
        url: '/find-id.do?user_name=' + user_name + '&user_email=' + user_email,
        success: function(data) {
            if (data == "") invalid = true;
            else
                alert('아이디는 ' + data + '입니다.');
        },
        error: function() {
            console.error('AJAX Communication Error');
        }
    });

    if (invalid) alert('입력된 정보와 일치하는 아이디가 존재하지 않습니다.');
}

function find_password() {
    let user_id    = $('input[name="user_id"]').val();
    let user_name  = $('input[name="user_name"]').val();
    let user_email = $('input[name="user_email"]').val();

    if (validate_id(user_id)) return;
    if (validate_email(user_email)) return;

    let invalid = false;
    $.ajax({
        type: 'POST',
        async: false,
        url: '/find-pw.do?user_id=' + user_id + '&user_name=' + user_name + '&user_email=' + user_email,
        success: function(data) {
            if (data == "") invalid = true;
            else
                alert('비밀번호는 ' + data + '입니다.');
        },
        error: function() {
            console.error('AJAX Communication Error');
        }
    });

    if (invalid) alert('입력된 정보와 일치하는 비밀번호가 존재하지 않습니다.');
}
// End Region Find methods
// Region Validates
function validate_email(email) {
    let pattern = new RegExp(/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]+$/);
    let result = !pattern.test(email);
    if (result) alert('이메일 형식이 올바르지 않습니다.');
    return result;
}
function validate_id(user_id) {
    if(user_id .length < 6 || user_id.length > 10) return true;
    if(user_id.indexOf(" ") >= 0) return true;
    return false;
}
// End Region Validates
