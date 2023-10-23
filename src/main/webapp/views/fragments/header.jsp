<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="/resources/scripts/data/login-info.js"></script>
<script src="/resources/scripts/require-login.js"></script>

<header class="global">
	<nav id="sub" class="sub">
	<div>
		<c:choose>
			<c:when test="${sessionScope.ssKey != null}">
				<a href="/member/logout.do">로그아웃</a>
			</c:when>
		</c:choose>
		<a class="require-login" href="/member">마이페이지</a>
		<a class="require-login" href="/cart">장바구니</a>
	</div>
	</nav>

	<nav id="main" class="shell">
	<div>
		<a class="product-name" href="/">SHOP</a>
		<c:choose>
			<c:when test="${sessionScope.ssKey.role == 'admin'}">
				<c:import url="/views/fragments/admin-nav.jsp"></c:import>
			</c:when>
			<c:otherwise>
				<a href="/products/list?page=1">상품 목록</a>
				<a href="/board/list?page=1">게시판</a>
			</c:otherwise>
		</c:choose>
	</div>
	</nav>
</header>