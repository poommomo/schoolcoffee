<%--
  Created by IntelliJ IDEA.
  User: Momo
  Date: 4/11/2018 AD
  Time: 22:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<sql:query dataSource="jdbc/school_coffee" var="categories">
    SELECT ID, CategoryName from ProductCategory
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

    <title>New Product</title></head>
<body>

<br>
<div class="container">
    <h1>Add Product</h1>

    <form class="form-horizontal" action="admin">

        <input type="hidden" name="cmd" value="add"/>

        <div class="form-group">
            <label class="control-label col-sm-2" for="name">Name:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter product name">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="info">Description:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="info" name="info" placeholder="Enter product description">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="price">Price:</label>
            <div class="col-sm-10">
                <input type="number" class="form-control" id="price" name="price" placeholder="Enter product price">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="image">Image URL:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="image" name="image" placeholder="Enter product image URL">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="featured">Featured Product:</label>

            <select class="col-sm-10" id="featured" name="featured">
                <option value="Y">Yes</option>
                <option value="N">No</option>
            </select>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="category">Category:</label>
            <select class="col-sm-10" id="category" name="category">
                <c:forEach var="row" items="${categories.rows}">
                    <option value='<c:out value="${row.ID}"/>'>
                        <c:out value="${row.CategoryName}"/>
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">Create</button>
            </div>
        </div>

    </form>

</div>

</body>

</html>
