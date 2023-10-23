<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Shop - Find</title>

	<!-- Javascript API and Frameworks -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- Custom Script -->
	<script src="views/member/scripts/find-member.js"></script>

	<!-- Fragments CSS -->
	<link rel="stylesheet" href="resources/design/fragments/default.css"/>
	<link rel="stylesheet" href="resources/design/fragments/header.css" />
	<link rel="stylesheet" href="resources/design/fragments/aside.css"  />
	<link rel="stylesheet" href="resources/design/fragments/article.css"/>
	<link rel="stylesheet" href="resources/design/fragments/footer.css" />
	<!-- Elements CSS -->
	<link rel="stylesheet" href="resources/design/elements/form.css" />
	<link rel="stylesheet" href="resources/design/components/tab.css" />
	<link rel="stylesheet" href="resources/design/elements/button.css" />
	<link rel="stylesheet" href="resources/design/components/input-text.css" />
</head>
<body>
<%@ include file="/views/fragments/header.jsp" %>

	<main>
		<nav class="tab full">
		<ul>
			<li id="id" ><a href="/find-member?find=id">아이디 찾기</a></li>
			<li id="password"><a href="/find-member?find=password">비밀번호 찾기</a></li>
		</ul>
		</nav>

		<c:import url="forms/find-${param.find}.jsp"></c:import>
	</main>

<%@ include file="/views/fragments/footer.jsp" %>
</body>
</html>
