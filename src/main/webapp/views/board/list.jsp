<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>상품 관리</title>

	<!-- Components -->
	<link rel="stylesheet" href="/resources/components/datatable/datatable.css"/>

	<!-- Javascript API and Frameworks -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<!-- Custom Script -->
	<script type="module" src="/views/board/scripts/board-list.js"></script>
	<script src="/views/board/scripts/view.js"></script>

	<!-- Guideline CSS -->
	<link rel="stylesheet" href="/resources/design/init.css"/>
	<link rel="stylesheet" href="/resources/design/typography.css"/>
	<link rel="stylesheet" href="/resources/design/guideline/layer.css"/>
	<!-- Fragments CSS -->
	<link rel="stylesheet" href="/views/fragments/stylesheet/main.css" />
	<link rel="stylesheet" href="/views/fragments/stylesheet/header.css" />
	<link rel="stylesheet" href="/views/fragments/stylesheet/footer.css" />
	<!-- Components CSS -->
	<link rel="stylesheet" href="/resources/design/components/button.css"/>
</head>
<body>
<%@ include file="/views/fragments/header.jsp" %>

<main>
	<article>
		<div class="data-table layer-01 zebra" id="board">
			<header>
				<h3>자유 게시판</h3>
				<p>자유 게시판 페이지, 일반 사용자용</p>

				<nav class="toolbar">
					<ul>
					</ul>
				</nav>
			</header>
			<table>
				<thead class="layer-accent-01">
				<tr>
					<th class="no" id="rn" sort="1">번호</th>
					<th class="long" id="title" sort="1">제목</th>
					<th class="short" id="author" sort="1">작성자</th>
					<th class="no" id="views" sort="1">조회수</th>
					<th class="short" id="regdate" sort="1">작성일</th>
				</tr>
				</thead>

				<tbody>
					<tr><td colspan='4'>아직 게시글이 없습니다.</td></tr>
				</tbody>
			</table>
			<jsp:include page="/resources/scripts/components/data-table.jsp"></jsp:include>
		</div>
	</article>
</main>

<%@ include file="/views/fragments/footer.jsp" %>
</body>
</html>
