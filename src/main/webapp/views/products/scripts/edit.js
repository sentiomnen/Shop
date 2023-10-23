function deleteProduct() {
    let no = new URL(window.location.href);
    no = no.searchParams.get('no');

    let invalid = false;
    $.ajax({
        async: false,
        type: 'POST',
        url: '/products/delete.do?no='+no,
        dataType: 'json',
        success: function(data) {
            if (date == false) {invalid = true;}
            return;
        },
        error: function() {
            invalid = true;
        }
    })

    if(invalid) alert('게시글을 삭제하지 못했습니다.');
    else {
        alert('게시글이 삭제되었습니다.');
        location.href="/products/manage?page=1";
    }
}