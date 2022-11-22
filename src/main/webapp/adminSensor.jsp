<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
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
    <form method="get" action="/adminSensor/search">
        <input type="text" name="search" />
        <button type="submit" href="/adminSensor/search">Search</button>
    </form>
        <table>
            <tr>
                <th></th>
                <th>Name</th>
                <th>Model</th>
                <th>Type</th>
                <th>Range</th>
                <th>Unit</th>
                <th>Location</th>
                <th></th>
            </tr>
            <c:forEach items="${sensors}" var="row">
                <tr>
                    <td>
                        <button><a href="/adminSensor/${row.id}/editSensor">Edit</a></button>
                    </td>
                    <td title="${row.description}">${row.name}</td>
                    <td>${row.model}</td>
                    <td>${row.typeName}</td>
                    <td>${row.rangeMin} - ${row.rangeMax}</td>
                    <td>${row.unit}</td>
                    <td>${row.location}</td>
                    <td>
                        <form method="post" action="/adminSensor/${row.id}/remove">
                            <button type="submit" href="/adminSensor">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    <h3>Total : ${sensors.size()}</h3>

</div>
<form action="/adminSensor/addSensor" target="_blank">
    <button>Add sensor</button>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>