<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>상품 추가</title>

	<!-- Javascript API and Frameworks -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<!-- Component Script -->
	<script src="/resources/scripts/components/data-table.jsp"></script>
	<!-- Custom Script -->
	<script src="/views/products/scripts/insert.js"></script>

	<!-- Guideline CSS -->
	<link rel="stylesheet" href="/resources/design/init.css"/>
	<link rel="stylesheet" href="/resources/design/typography.css"/>
	<link rel="stylesheet" href="/resources/design/guideline/layer.css"/>
	<!-- Fragments CSS -->
	<link rel="stylesheet" href="/views/fragments/stylesheet/header.css" />
	<link rel="stylesheet" href="/views/fragments/stylesheet/main.css" />
	<!-- Components CSS -->
	<link rel="stylesheet" href="/resources/design/components/datatable.css"/>
	<link rel="stylesheet" href="/resources/design/components/button.css"/>
	<link rel="stylesheet" href="/resources/design/components/form.css"/>
</head>
<body>
<%@ include file="/views/fragments/header.jsp" %>

<main>
	<article>
		<form id="member" class="fluid" method="post" action="/products/insert.do" enctype="multipart/form-data">
			<header>
				<h1>상품 추가</h1>
				<p>관리자용 상품 관리 페이지<br>상품 추가하기</p>
			</header>
			<main>
				<div class="input-text">
					<label for="name" class="name-tag">상품 이름</label>
					<input type="text" name="name" id="name" placeholder="상품 이름을 입력해주세요. 최대 200자"/>
					<p class="help"></p>
				</div>
				<div class="input-text">
					<label for="description" class="name-tag">상품 설명</label>
					<input type="text" name="description" id="description" placeholder="상세 설명을 입력해주세요. 최대 100자"/>
					<p class="help"></p>
				</div>
				<section>
					<div class="input-text">
						<label for="price" class="name-tag">개별 가격</label>
						<input type="number" name="price" id="price" placeholder="단가를 설정해주세요" />
						<p class="help"></p>
					</div>
					<div class="input-text">
						<label for="stock" class="name-tag">재고 수량</label>
						<input type="number" name="stock" id="stock" placeholder="재고를 입력해주세요" />
						<p class="help"></p>
					</div>
				</section>
			</main>
			<footer>
				<input  type="file" id="upload" name="upload" hidden />
				<label  class="secondary button" type="button" onclick="image()" for="upload">이미지 업로드</label>
				<button class="primary   button" type="submit">상품 등록하기</button>
			</footer>
		</form>
	</article>
</main>
</body>
</html>
