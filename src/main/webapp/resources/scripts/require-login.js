$(document).on('click', '.require-login', function() {
    let check = checkLogin();
    if (check === true) return;
    else $(this).attr('href', check);
});

function checkLogin() {
    let role = get_role();
    if (role != "anonymous") return true;

    alert('로그인이 필요합니다.');
    let url = "/member/login?tab=login";
    return url;
}