<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Shop - Dashboard</title>

  <!-- Javascript API and Frameworks -->
  <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <!-- Custom Script -->
<%--  <script src="views/member/scripts/dashboard.js"></script>--%>


  <!-- Default Script -->
  <link rel="stylesheet" href="resources/design/init.css"/>
  <link rel="stylesheet" href="resources/design/typography.css"/>
  <!-- Fragments CSS -->
  <link rel="stylesheet" href="/views/fragments/stylesheet/header.css" />
  <link rel="stylesheet" href="/views/fragments/stylesheet/main.css" />
  <!-- Components CSS -->
  <link rel="stylesheet" href="resources/design/components/button.css"/>
  <link rel="stylesheet" href="resources/design/components/form.css" />
  <link rel="stylesheet" href="resources/design/components/tab.css" />
  <link rel="stylesheet" href="resources/design/components/input-text.css" />
  <link rel="stylesheet" href="resources/design/components/data-table.css"/>

  <link rel="stylesheet" href="/views/member/stylesheet/dashboard.css"/>
</head>
<body>
<%@ include file="/views/fragments/header.jsp" %>

<%--<main>--%>
<%--  <header>--%>
<%--    <h1>마이페이지</h1>--%>
<%--  </header>--%>

<%--  <nav class="tab">--%>
<%--    <ul>--%>
<%--      <li id="account" class="selected"><a href="/member?tab=account">회원관리</a></li>--%>
<%--      <li id="register"><a href="/member?tab=register">회원가입</a></li>--%>
<%--    </ul>--%>
<%--  </nav>--%>

<%--  <c:choose>--%>
<%--    <c:when test="${param.tab == 'account'}">--%>
<%--      <c:import url="${sessionScope.ssKey.role}-dash.jsp"></c:import>--%>
<%--    </c:when>--%>
<%--  </c:choose>--%>
<%--</main>--%>

<%@ include file="/views/fragments/footer.jsp" %>
</body>
</html>
