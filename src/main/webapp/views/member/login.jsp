<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Shop - Login</title>

	<!-- Javascript API and Frameworks -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- Custom Script -->
	<script src="/views/member/scripts/member.js"></script>


	<!-- Default Script -->
	<link rel="stylesheet" href="/resources/design/init.css"/>
	<link rel="stylesheet" href="/resources/design/typography.css"/>
	<!-- Fragments CSS -->
	<link rel="stylesheet" href="/views/fragments/stylesheet/header.css" />
	<link rel="stylesheet" href="/views/fragments/stylesheet/main.css" />
	<!-- Components CSS -->
	<link rel="stylesheet" href="/resources/design/components/button.css"/>
	<link rel="stylesheet" href="/resources/design/components/form.css" />
	<link rel="stylesheet" href="/resources/design/components/tab.css" />
	<link rel="stylesheet" href="/resources/design/components/input-text.css" />
</head>
<body>
<%@ include file="/views/fragments/header.jsp" %>

<main>
	<header>
		<h1>회원 로그인</h1>
	</header>



	<nav class="tab full">
		<ul>
			<li id="login"><a href="/member?tab=login">로그인</a></li>
			<li id="register"><a href="/member?tab=register">회원가입</a></li>
		</ul>
	</nav>
	<c:import url="forms/${param.tab}-form.jsp"></c:import>
</main>

<%--<%@ include file="/views/fragments/footer.jsp" %>--%>
</body>
</html>
