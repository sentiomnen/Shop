<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<ul class="pagination">
	<li class="amount">Items per page: ${pageUnit}</li>
	<li class="index">${(param.page-1)*pageUnit + 1} -
		<%
			int page_n = Integer.parseInt(request.getParameter("page"));
			int unit = (int) request.getAttribute("pageUnit");
			int amount = (int) request.getAttribute("pageCount");
            int count  = page_n * unit + 1;
            if (count > amount ) count = amount;
            out.print(count);
		%>
		of ${pageCount} items</li>
	<li class="page">${param.page} of ${pageAmount}</li>
	<li class="button"><button type="button" class="ghost button prev">
		<image src="/resources/design/icons/caret--left.svg"></image></button></li>
	<li class="button"><button type="button" class="ghost button next">
		<image src="/resources/design/icons/caret--right.svg"></image></button></li>
</ul>
<script>
    let page = new URL(window.location.href);
    page = page.searchParams.get('page');

    if (page <= 1) $('.button.prev').attr('disabled', true);
    if (page >= ${pageAmount}) $('.button.next').attr('disabled', true);

    $('button.next').on('click', function() {
        let page  = new URL(window.location.href);
        let path  = page.pathname;
        let param = page.searchParams.get('page');

        let url = path + '?page=' + (parseInt(param)+1);
        location.href = url;
    })
    $('button.prev').on('click', function() {
        let page  = new URL(window.location.href);
        let path  = page.pathname;
        let param = page.searchParams.get('page');

        let url = path + '?page=' + (parseInt(param)-1);
        location.href = url;
    })
</script>
