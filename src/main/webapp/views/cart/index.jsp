<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>장바구니</title>

	<!-- Javascript API and Frameworks -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/resources/design/init.css"/>
	<link rel="stylesheet" href="/resources/design/typography.css"/>
	<!-- Fragments -->
	<link rel="stylesheet" href="/views/fragments/stylesheet/header.css" />
	<link rel="stylesheet" href="/views/fragments/stylesheet/main.css" />
	<link rel="stylesheet" href="/views/fragments/stylesheet/footer.css" />

	<!-- Data Table -->
	<script type="module" src="/views/cart/scripts/list.js"></script>
	<link rel="stylesheet" href="/resources/components/datatable/datatable.css" />

	<!-- Other Components -->
	<link rel="stylesheet" href="/resources/design/components/form.css" />
	<link rel="stylesheet" href="/resources/design/components/button.css" />
</head>
<body>
<%@ include file="/views/fragments/header.jsp" %>

<main>
	<article>
		<div class="data-table layer-01 zebra" id="cart">
			<header>
				<h3>장바구니</h3>

				<nav class="toolbar">
					<ul>
					</ul>
				</nav>
			</header>
			<table>
				<thead class="layer-accent-01">
				<tr>
					<th class="name"  id="label">이름</th>
					<th class="no"    id="quantity">수량</th>
					<th class="short" id="total">총 가격</th>
				</tr>
				</thead>

				<tbody>
				</tbody>
			</table>
		</div>
	</article>
</main>

<%@ include file="/views/fragments/footer.jsp" %>
</body>
</html>
