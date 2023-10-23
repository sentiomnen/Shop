$(document).ready(function() {
    // Select tab and remove right border of left tab of selected.
    let selected_tab = new URL(window.location.href);
    selected_tab = selected_tab.searchParams.get('tab');

    let tab = $('nav.tab li');
    tab.each(function(i) {
        let $current = tab.eq(i);
        $current.removeClass('selected');
    });
    // if (tab.length == 0) location.href = "/member?tab=login";
    tab = $('nav.tab li#'+selected_tab).addClass('selected');
});

function login() {
    let user = get_form('member');
    if (user === false) return;

    let invalid = false;
    invalid = validate_id(user[0], false);
    invalid = validate_pw(user[1]);

    //= Attempt to log in with AJAX.
    let result;
    if (!invalid)
    $.ajax({
        type: 'POST',
        async: false,
        url: '/member/login.do?id=' + user[0] + '&password=' + user[1],
        success: function(data) {
            if (data == 'failed') invalid = true;

        },
        error: function() {
            console.error('AJAX Communication Error');
        }
    });

    if (invalid) alert('아이디 또는 비밀번호가 올바르지 않습니다.');
    else {
        alert('성공적으로 로그인되었습니다.');
        location.href = "/member";
    }
}
function register() {
    let user = get_form('member');
    if (user === false) return;

    if (validate_id(user[0], true)) {
        alert('아이디 형식이 올바르지 않습니다.');
        return;
    }
    if (check_pw(user[1], user[2])) {
        alert('비밀번호 형식이 올바르지 않습니다.');
        return;
    }
    if (validate_email(user[5])) return;

    alert('성공적으로 가입되었습니다.');
    $('form#member').submit();
}
// Region Get Form
function get_form(id) {
    let result = [];
    let $form = $('form#'+ id + " input");

    $form.each(function () {
        result.push( $(this).val() );
    });

    let invalid = false;
    for (let i in result) {
        let $current  = $form.eq(i).parent();
        let $help = $current.children('.help');

        if (result[i] == null || result[i].length == 0){
            $current.addClass('invalid');
            $help.text('입력해주세요.');
            invalid = true;
        } else {
            $current.removeClass('invalid');
            $help.text('');
            result[i] = result[i].trim();
        }
    }
    if (invalid) { alert("입력되지 않은 항목이 존재합니다."); return false; }

    return result;
}
// End Region Get Form
// Region Validates Form
function validate_id(user_id, check_duplicate) {
    if(user_id .length < 6 || user_id.length > 10) return true;
    if(user_id.indexOf(" ") >= 0) return true;

    let result = false;
    if (check_duplicate)
    $.ajax({
        type: 'POST',
        url: '/id-check?user_id=' + user_id,
        success: function(data) {
            if (data > 0) alert('이미 존재하는 아이디입니다.');
            result = true;
        },
        error: function() {
            console.error('AJAX Communication Error');
        }
    });
    return result;
}
function validate_pw(user_pw) {
    if(user_pw.length < 8 || user_pw.length > 15) {
        alert('비밀번호는 8자 이상 15자 이하여야 합니다.');
        return true;
    }

    return false;
}
function check_pw(user_pw, repeat_pw) {
    if (validate_pw(user_pw)) return true;
    if(user_pw !== repeat_pw) {
        alert('입력한 비밀번호가 동일하지 않습니다.');
        return true;
    }
    return false;
}
function validate_email(email) {
    let pattern = new RegExp(/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]+$/);
    let result = !pattern.test(email);
    if (result) alert('이메일 형식이 올바르지 않습니다.');
    return result;
}
// End Region Validates Form
// Region Setters
function set_address() {
    new daum.Postcode({
        oncomplete: function(data) {
            console.log(data);
            $('form#member input[name="user_zipcode"]').val(data.zonecode);
            $('form#member input[name="user_addr"]').val(data.address);
        }
    }).open();
}
// End Region Setters
