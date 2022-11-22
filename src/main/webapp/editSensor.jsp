<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Sensors</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>


<div class="container mt-5 mb-5">
    <h1>Add sensor</h1>

        <form action="/adminSensor/addSensor" method="post">
            <c:forEach items="${sensor}" var="row" >
        Name <input type="text" value="${row.name}" name="name" placeholder="Input sensor`s name" class="form-control"><br>
        Model<input type="text" value="${row.model}" name="model" placeholder="Input sensor`s model" class="form-control"><br>
        Range Form <input type="number" value="${row.rangeMin}" name="rangeMin" placeholder="Input rangeMin" class="form-control">
        to <input type="number" value="${row.rangeMax}" name="rangeMax" placeholder="Input rangeMax" class="form-control"><br>
        Type
        <select type="text" name="type">
            <c:forEach items="${type}" var="typ" >
                <option value="${typ.name}">${typ.name}</option>
            </c:forEach>
        </select><br>
        Unit
        <select type="text" name="unit">
            <c:forEach items="${type}" var="typ" >
                <option value="${typ.unit}">${typ.unit}</option>
            </c:forEach>
        </select><br>
        Location <input type="text" value="${row.location}" name="location" placeholder="Input sensor`s location"
                        class="form-control"><br>
        Description <textarea type="text" name="description" placeholder="${row.description}"
                              class="form-control">${row.description}</textarea><br>
        <button type="sumbit" class="btn-success">Save</button>
            </c:forEach>
        </form>

    <a href="/adminSensor"><button>Cancel</button></a>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>