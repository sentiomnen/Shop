<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>상품 관리</title>

	<!-- Javascript API and Frameworks -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<!-- Component Script -->
<%--	<script src="/resources/scripts/components/data-table.jsp"></script>--%>
	<!-- Custom Script -->
	<script type="module" src="/views/products/scripts/product-list.js"></script>
	<script src="/views/products/scripts/view.js"></script>


	<!-- Tiles -->
	<link rel="stylesheet" href="/resources/components/tile/tile.css"/>
	<link rel="stylesheet" href="/resources/components/tile/list.css"/>
	<link rel="stylesheet" href="/resources/components/tile/list.js"/>


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
	<link rel="stylesheet" href="/resources/design/components/form.css"/>
</head>
<body>
<%@ include file="/views/fragments/header.jsp" %>

<main>
	<header>
		<h3>상품 목록</h3>
	</header>

	<article>
		<form class="tile layer-02 fluid template">
			<main>
				<div class="header">
					<img id="image" class="value" />
					<h3 id="label" class="value"></h3>
					<p id="desc" class="value"></p>
				</div>
				<section>
					<div class="input-text">
						<label for="price" class="name-tag">개별 가격</label>
						<input type="number" name="price" id="price" readonly class="value" />
					</div>
					<div class="input-text">
						<label for="stock" class="name-tag">재고 수량</label>
						<input type="number" name="stock" id="stock" readonly class="value" />
					</div>
				</section>
			</main>
			<footer>
				<button class="secondary button" type="button" goto="/order/add.do">구매하기</button>
				<button class="primary   button" type="button" goto="/products/view">더보기</button>
			</footer>
		</form>
	</article>

	<button class="ghost button" id="more">더보기</button>
</main>

<%@ include file="/views/fragments/footer.jsp" %>
</body>
</html>
