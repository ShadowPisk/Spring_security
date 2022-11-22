<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Create an account</title>
  <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>


<div class="container mt-5 mb-5">

  <c:if test="${pageContext.request.userPrincipal.name != null}">
    <form id="logoutForm" method="POST" action="${contextPath}/logout">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
    <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a>
    </h2>
  </c:if>
  <form method="get" action="/sensor/search">
    <input type="text" name="search"/>
    <button type="submit" href="/sensor/search">Search</button>
  </form>
  <table>
    <tr>
      <th>Name</th>
      <th>Model</th>
      <th>Type</th>
      <th>Range</th>
      <th>Unit</th>
      <th>Location</th>
    </tr>
    <c:forEach items="${result}" var="row">
      <tr>
        <td title="${row.description}">${row.name}</td>
        <td>${row.model}</td>
        <td>${row.typeName}</td>
        <td>${row.rangeMin} - ${row.rangeMax}</td>
        <td>${row.unit}</td>
        <td>${row.location}</td>

      </tr>
    </c:forEach>
  </table>

</div>
<form action="/sensor" target="_blank">
  <button>Back</button>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
