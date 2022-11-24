<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Sensors</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <form id="logoutForm" method="POST" action="${contextPath}/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
    <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a>
    </h2>
</c:if>
<div class="container mt-5 mb-5">
    <h1>Add sensor</h1>
    <form action="/adminSensor/addSensor" method="post">
        Name <input type="text" name="name" placeholder="Input sensor`s name" class="form-control"><br>
        Model<input type="text" name="model" placeholder="Input sensor`s model" class="form-control"><br>
        Range Form <input type="number" name="rangeMin" placeholder="Input rangeMin" class="form-control">
        to <input type="number" name="rangeMax" placeholder="Input rangeMax" class="form-control"><br>
        Type
        <select type="text" name="type">
            <c:forEach items="${type}" var="row" >
                <option value="${row.name}">${row.name}</option>
            </c:forEach>
        </select><br>
        Unit
        <select type="text" name="unit">
            <c:forEach items="${type}" var="row" >
                <option value="${row.unit}">${row.unit}</option>
            </c:forEach>
        </select><br>
        Location <input type="text" name="location" placeholder="Input sensor`s location"
                        class="form-control"><br>
        Description <textarea type="text" name="description" placeholder="Input sensor`s description"
                              class="form-control"></textarea><br>
        <button type="sumbit" class="btn-success">Save</button>
    </form>
    <a href="/adminSensor"><button>Cancel</button></a>


</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
