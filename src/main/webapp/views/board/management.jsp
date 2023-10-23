<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>회원 관리</title>

	<link rel="stylesheet" href="/resources/design/init.css"/>
	<link rel="stylesheet" href="/resources/design/typography.css"/>
	<!-- Fragments CSS -->
	<link rel="stylesheet" href="/views/fragments/stylesheet/header.css" />
	<link rel="stylesheet" href="/views/fragments/stylesheet/main.css" />
	<!-- Components CSS -->
	<link rel="stylesheet" href="/resources/design/components/datatable.css"/>
	<link rel="stylesheet" href="/resources/design/components/button.css"/>
</head>
<body>
<%@ include file="/views/fragments/header.jsp" %>

<main>
	<article>
		<div class="data-table">
			<header>
				<h3>회원 관리</h3>
				<p>회원 관리 페이지, 관리자용</p>

				<nav class="toolbar">
					<ul>
					</ul>
				</nav>
			</header>
			<table>
				<thead>
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
								<td class="short">${member.id}</td>
								<td class="short">${member.name}</td>
								<td class="long">${member.email}</td>
								<td class="long">${member.phone}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</tbody>

				<jsp:include page="/resources/scripts/components/data-table.jsp"></jsp:include>
			</table>
		</div>
	</article>
</main>
</body>
</html>
