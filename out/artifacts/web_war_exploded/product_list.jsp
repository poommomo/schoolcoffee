<%--
  Created by IntelliJ IDEA.
  User: Momo
  Date: 3/11/2018 AD
  Time: 23:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<sql:query dataSource="jdbc/school_coffee" var="result">
    SELECT p.ID, p.Name, p.Description, p.ImageURL, p.Price, p.IsFeatured, c.CategoryName
    FROM Product as p, ProductCategory as c
    WHERE p.CategoryID = c.ID
</sql:query>



<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!-- Custom styles  -->

    <title>Product List</title>
</head>

<body>

<br>
<div class="container">
    <h1>Products</h1>
    <a class="btn btn-primary" href="add_product.jsp" style="margin-bottom: 15px">ADD</a>
    <table class="table table-striped">
        <tr>
            <th>Name</th>
            <th>Description</th>
            <th>Category</th>
            <th>Price</th>
            <th>Image</th>
            <th>Featured Product</th>
            <th></th>
            <th></th>
        </tr>
        <c:forEach var="row" items="${result.rows}">
            <tr>
                <td><c:out value="${row.Name}"/></td>
                <td><c:out value="${row.Description}"/></td>
                <td><c:out value="${row.CategoryName}"/></td>
                <td><c:out value="${row.Price}"/></td>
                <td><img style="width: 70%" src="<c:out value="${row.ImageURL}"/>" alt=""></td>
                <td><c:out value="${row.IsFeatured}"/></td>
                <td><button class="btn btn-warning" onclick="window.location='update_product.jsp?id=<c:out value="${row.ID}"/>';">UPDATE</button></td>
                <td><button class="btn btn-danger" onclick="confirmDelete(<c:out value="${row.ID}"/>);">DELETE</button></td>
            </tr>
        </c:forEach>
    </table>

</div>


</body>
<script>
    function confirmDelete(id) {
        if (confirm('Are you sure?')) {
            window.location = "/admin?cmd=delete&id="+id;
        }
    }
</script>


</body>

</html>