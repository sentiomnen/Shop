<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
	<title>게시판</title>

	<!-- Javascript API and Frameworks -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<!-- Custom Script -->
	<script src="/views/board/scripts/board.js"></script>

	<!-- Default Script -->
	<link rel="stylesheet" href="resources/design/init.css"/>
	<link rel="stylesheet" href="resources/design/typography.css"/>
	<!-- Fragments CSS -->
	<link rel="stylesheet" href="/views/fragments/stylesheet/header.css" />
	<link rel="stylesheet" href="/views/fragments/stylesheet/main.css" />
	<!-- Components CSS -->
	<link rel="stylesheet" href="resources/design/components/data-table.css"/>
	<link rel="stylesheet" href="resources/design/components/button.css"/>
</head>
<body>
<%@ include file="/views/fragments/header.jsp" %>
<main>
	<header>
		<h1>회원 게시판</h1>
	</header>

	<div class="data-table">
		<header>
			<h3>자유 게시판</h3>

			<nav class="toolbar">
			<ul>
				<li><button type="button" class="primary button">글쓰기</button></li>
			</ul>
			</nav>
		</header>
		<table>
			<thead>
			<tr>
				<th class="no">No.</th>
				<th class="long">Title</th>
				<th class="short">Author</th>
				<th class="no">Views</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="post" items="${postList}">
			<tr>
				<td class="no">${post.no}</td>
				<td class="long">${post.title}</td>
				<td class="short">${post.author}</td>
				<td class="no">${post.views}</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</main>
</body>
</html>
