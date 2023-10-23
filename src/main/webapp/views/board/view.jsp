<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>${post.title}</title>

	<!-- Javascript API and Frameworks -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<!-- Custom Script -->
	<script src="/view/board/scripts/view.js"></script>

	<link rel="stylesheet" href="/resources/design/init.css"/>
	<link rel="stylesheet" href="/resources/design/typography.css"/>
	<link rel="stylesheet" href="/resources/design/guideline/layer.css"/>
	<!-- Fragments CSS -->
	<link rel="stylesheet" href="/views/fragments/stylesheet/header.css" />
	<link rel="stylesheet" href="/views/fragments/stylesheet/footer.css" />
	<link rel="stylesheet" href="/views/fragments/stylesheet/main.css" />
	<!-- Components CSS -->
	<link rel="stylesheet" href="/resources/design/components/button.css"/>
	<link rel="stylesheet" href="/resources/design/components/form.css"/>
	<link rel="stylesheet" href="/resources/components/tile/tile.css"/>
</head>
<body>
<%@ include file="/views/fragments/header.jsp" %>

<main>
	<header>
		<h1>${post.title}</h1>
		<p class="author">${post.author}</p> -
		<p class="regdate">${post.regdate}</p> -
		<p class="views">${post.views}</p> views

		<nav>
			<input type="hidden" name="no" value="${post.no}">
			<button type="button" class="primary button" id="reply">Reply</button>
			<button type="button" class="secondary button" id="edit">Edit</button>
			<button type="button" class="secondary button" id="delete">Delete</button>
			<button type="button" class="ghost button" onclick="location.href='/board/list?page=1'">Back to list</button>
		</nav>
	</header>

	<article class="tile layer-01">
		<p>${post.content}</p>

		<c:choose>
			<c:when test="${post.step > 0}">
				<div class="sub-toolbar">
					<p>Reference:
						<a class="reference" href="view.post?no=${post.ref}">${refer}</a>
				</div>
			</c:when>
		</c:choose>
	</article>
</main>

<%@ include file="/views/fragments/footer.jsp" %>
</body>
</html>
