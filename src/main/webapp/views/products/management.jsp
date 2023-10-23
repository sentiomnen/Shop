<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>상품 관리</title>

	<!-- Javascript API and Frameworks -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<!-- Component Script -->
<%--	<script src="/resources/scripts/components/data-table.jsp"></script>--%>
	<!-- Custom Script -->
	<script src="/views/products/scripts/admin_list.js"></script>
	<script src="/views/products/scripts/management.js"></script>

	<!-- Guideline CSS -->
	<link rel="stylesheet" href="/resources/design/init.css"/>
	<link rel="stylesheet" href="/resources/design/typography.css"/>
	<link rel="stylesheet" href="/resources/design/guideline/layer.css"/>
	<!-- Fragments CSS -->
	<link rel="stylesheet" href="/views/fragments/stylesheet/main.css" />
	<link rel="stylesheet" href="/views/fragments/stylesheet/header.css" />
	<link rel="stylesheet" href="/views/fragments/stylesheet/footer.css" />
	<!-- Components CSS -->
	<link rel="stylesheet" href="/resources/components/datatable/datatable.css"/>
	<link rel="stylesheet" href="/resources/design/components/button.css"/>
</head>
<body>
<%@ include file="/views/fragments/header.jsp" %>

<main>
	<article>
		<div class="data-table layer-01 zebra" id="products">
			<header>
				<h3>상품 관리</h3>
				<p>상품 관리 페이지, 관리자용</p>

				<nav class="toolbar">
					<ul>
						<li><button class="primary button" onclick="location.href = '/products/insert'">상품 추가</button></li>
					</ul>
				</nav>
			</header>
			<table>
				<thead class="layer-accent-01">
				<tr>
					<th class="no">번호</th>
					<th class="name" id="name">이름</th>
					<th class="short" id="price">단가</th>
					<th class="no" id="stock">재고</th>
					<th class="long" id="description">비고</th>
				</tr>
				</thead>

				<tbody>
				</tbody>
			</table>

			<jsp:include page="/resources/scripts/components/data-table.jsp"></jsp:include>
		</div>
	</article>
</main>

<%@ include file="/views/fragments/footer.jsp" %>
</body>
</html>
