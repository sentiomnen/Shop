<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>회원 관리</title>

	<!-- Javascript API and Frameworks -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<!-- Custom Script -->
	<script src="/views/member/scripts/management.js"></script>

	<link rel="stylesheet" href="/resources/design/init.css"/>
	<link rel="stylesheet" href="/resources/design/typography.css"/>
	<link rel="stylesheet" href="/resources/design/guideline/layer.css" />
	<!-- Fragments CSS -->
	<link rel="stylesheet" href="/views/fragments/stylesheet/header.css" />
	<link rel="stylesheet" href="/views/fragments/stylesheet/main.css" />
	<!-- Components CSS -->
	<link rel="stylesheet" href="/resources/components/datatable/datatable.css"/>
	<link rel="stylesheet" href="/resources/design/components/button.css"/>
</head>
<body>
<%@ include file="/views/fragments/header.jsp" %>

<main>
	<article>
		<div class="data-table layer-01" id="member">
			<header>
				<h3>회원 관리</h3>
				<p>회원 관리 페이지, 관리자용</p>

				<nav class="toolbar">
					<ul>
						<li><button class="primary button">관리자 회원 추가</button></li>
					</ul>
				</nav>
			</header>
			<table>
				<thead class="layer-accent-01">
				<tr>
					<th class="short">아이디</th>
					<th class="short">이름</th>
					<th class="long">이메일</th>
					<th class="long">연락처</th>
				</tr>
				</thead>

				<tbody>
				<c:choose>
					<c:when test="${memberList == null}">
						<tr><td colspan="4">아직 회원이 없습니다.</td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="member" items="${memberList}">
							<tr>
								<td class="short" id="no">${member.id}</td>
								<td class="short">${member.name}</td>
								<td class="long">${member.email}</td>
								<td class="long">${member.phone}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>

<%--			<c:import url="/resources/scripts/components/data-table.jsp"></c:import>--%>
		</div>
	</article>
</main>
</body>
</html>
