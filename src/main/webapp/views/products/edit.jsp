<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>상품 관리 - ${param.no}</title>

	<!-- Javascript API and Frameworks -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<!-- Custom Script -->
	<script src="/views/products/scripts/edit.js"></script>

	<!-- Guideline CSS -->
	<link rel="stylesheet" href="/resources/design/init.css"/>
	<link rel="stylesheet" href="/resources/design/typography.css"/>
	<link rel="stylesheet" href="/resources/design/guideline/layer.css"/>
	<!-- Fragments CSS -->
	<link rel="stylesheet" href="/views/fragments/stylesheet/header.css" />
	<link rel="stylesheet" href="/views/fragments/stylesheet/main.css" />
	<link rel="stylesheet" href="/views/fragments/stylesheet/footer.css" />
	<!-- Components CSS -->
	<link rel="stylesheet" href="/resources/design/components/datatable.css"/>
	<link rel="stylesheet" href="/resources/design/components/button.css"/>
	<link rel="stylesheet" href="/resources/design/components/tile.css"/>
	<link rel="stylesheet" href="/resources/design/components/form.css"/>
</head>
<body>
<%@ include file="/views/fragments/header.jsp" %>

<main>
	<article>
		<div class="tile layer-02">
			<img src="${product.path}/${product.image}"></img>
			<header>
				<h3>${product.name}</h3>
			</header>
			<p>${product.description}</p>
		</div>
		<form id="insert" class="tile fluid layer-02" method="post" action="/products/edit.do" enctype="multipart/form-data">
			<header>
				<h3>상품 정보 수정</h3>
				<input name="no" hidden value="${product.no}"/>
			</header>
			<main>
				<div class="input-text">
					<label for="name" class="name-tag">상품 이름</label>
					<input type="text" name="name" id="name" placeholder="상품 이름을 입력해주세요. 최대 200자" value="${product.name}"/>
					<p class="help"></p>
				</div>
				<div class="input-text">
					<label for="description" class="name-tag">상품 설명</label>
					<input type="text" name="description" id="description" placeholder="상세 설명을 입력해주세요. 최대 100자" value="${product.description}"/>
					<p class="help"></p>
				</div>
				<section>
					<div class="input-text">
						<label for="price" class="name-tag">개별 가격</label>
						<input type="number" name="price" id="price" placeholder="단가를 설정해주세요" value="${product.price}" />
						<p class="help"></p>
					</div>
					<div class="input-text">
						<label for="stock" class="name-tag">재고 수량</label>
						<input type="number" name="stock" id="stock" placeholder="재고를 입력해주세요" value="${product.stock}" />
						<p class="help"></p>
					</div>
				</section>
			</main>
			<footer>
				<button class="tertiary danger button" type="button" onclick="deleteProduct()">상품 삭제하기</button>
				<input  type="file" id="upload" name="upload" hidden />
				<label  class="secondary button" type="button" onclick="image()" for="upload">이미지 업로드</label>
				<button class="primary   button" type="submit">수정 완료하기</button>
			</footer>
		</form>
	</article>
</main>

<%@ include file="/views/fragments/footer.jsp" %>
</body>
</html>
