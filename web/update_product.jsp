<%--
  Created by IntelliJ IDEA.
  User: Momo
  Date: 4/11/2018 AD
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<sql:query dataSource="jdbc/school_coffee" var="categories">
    SELECT ID, CategoryName from ProductCategory
</sql:query>

<sql:query dataSource="jdbc/school_coffee" var="product" maxRows="1">
    SELECT *
    FROM Product
    WHERE ID = ${param.id}
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

    <title>Update Product</title>
</head>
<body>

<c:forEach var="p" items="${product.rows}">

    <br>
    <div class="container">
        <h1>Product</h1>
        <h2>Product ID: <c:out value="${param.id}"/></h2>

        <form class="form-horizontal" action="admin">

            <input type="hidden" name="cmd" value="update"/>
            <input type="hidden" name="id" value="<c:out value="${param.id}"/>"/>

            <div class="form-group">
                <label class="control-label col-sm-2" for="name">Name:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="name" name="name" value="<c:out value="${p.Name}"/>">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="info">Description:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="info" name="info" value="<c:out value="${p.Description}"/>">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="price">Price:</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="price" name="price" value="<c:out value="${p.Price}"/>">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="image">Image URL:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="image" name="image" value="<c:out value="${p.ImageURL}"/>">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="featured">Featured Product:</label>
                <select class="col-sm-10" id="featured" name="featured">
                    <c:choose>
                        <c:when test="${p.IsFeatured == 'Y'}">
                            <option selected value="Y">Yes</option>
                            <option value="N">No</option>
                        </c:when>
                        <c:otherwise>
                            <option value="Y">Yes</option>
                            <option selected value="N">No</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="category">Category:</label>
                <select class="col-sm-10" id="category" name="category">
                   <c:forEach var="cat" items="${categories.rows}">
                       <c:choose>
                           <c:when test="${p.CategoryID == cat.ID}">
                               <option selected value="<c:out value="${cat.ID}"/>"><c:out value="${cat.CategoryName}"></c:out></option>
                           </c:when>
                           <c:otherwise>
                               <option value="<c:out value="${cat.ID}"/>"><c:out value="${cat.CategoryName}"></c:out></option>
                           </c:otherwise>
                       </c:choose>
                   </c:forEach>
                </select>
                </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary">Update</button>
                </div>
            </div>

        </form>
    </div>

</c:forEach>


</body>
</html>
