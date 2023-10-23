<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>상품 관리 - ${param.no}</title>

	<!-- Javascript API and Frameworks -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<!-- Common Script -->

	<!-- Page Script -->
	<script src="/views/products/scripts/order.js"></script>

	<!-- Guideline CSS -->
	<link rel="stylesheet" href="/resources/design/init.css"/>
	<link rel="stylesheet" href="/resources/design/typography.css"/>
	<link rel="stylesheet" href="/resources/design/guideline/layer.css"/>
	<!-- Fragments CSS -->
	<link rel="stylesheet" href="/views/fragments/stylesheet/header.css" />
	<link rel="stylesheet" href="/views/fragments/stylesheet/main.css" />
	<link rel="stylesheet" href="/views/fragments/stylesheet/footer.css" />
	<!-- Components CSS -->
	<link rel="stylesheet" href="/resources/design/components/button.css"/>
	<link rel="stylesheet" href="/resources/components/tile/tile.css"/>
	<link rel="stylesheet" href="/resources/design/components/form.css"/>
</head>
<body>
<%@ include file="/views/fragments/header.jsp" %>

<main>
	<article>
		<div class="tile layer-02">
			<article>
				<img src="/products/load.do?filename=${product.image}"></img>
				<h3>${product.label}</h3>
				<p>${product.desc}</p>
			</article>
		</div>
		<form id="insert" class="tile fluid layer-02" method="post" action="/cart/add.do" enctype="multipart/form-data">
			<header>
				<h3>상품 정보</h3>
			</header>
			<main>
				<div class="input-text">
					<label for="label" class="name-tag">상품 이름</label>
					<input type="text" name="label" id="label" value="${product.label}" readonly/>
					<p class="help"></p>
				</div>
				<div class="input-text">
					<label for="desc" class="name-tag">상품 설명</label>
					<input type="text" name="desc" id="desc" value="${product.desc}" readonly/>
					<p class="help"></p>
				</div>
				<section>
					<div class="input-text">
						<label for="price" class="name-tag">개별 가격</label>
						<input type="number" name="price" id="price" value="${product.price}" readonly />
						<p class="help"></p>
					</div>
					<div class="input-text">
						<label for="number" class="name-tag">주문 수량</label>
						<input type="number" name="number" id="number" value="1" />
						<p class="help"></p>
					</div>
				</section>
				<input type="text" name="ref" id="ref" value="${product.no}" hidden readonly/>
			</main>
			<footer>
				<button class="secondary button" type="button"
				        id="add">
					장바구니 담기</button>
				<button class="primary   button" type="button"
				        id="order">
					구매하기</button>
			</footer>
		</form>
	</article>
</main>

<%@ include file="/views/fragments/footer.jsp" %>
</body>
</html>
