<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="product.Controller.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: Momo
  Date: 28/10/2018 AD
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    List<Product> productList = (List<Product>) session.getAttribute("cart");
    Double totalPrice = 0.0;

    if (productList == null) {
        productList = new ArrayList<>();
    }

    for (Product item : productList) {
        totalPrice += item.getPrice();
    }

%>
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

    <%--Font Awesome--%>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">

    <%--Custom Boostrap--%>
    <link rel="stylesheet" href="css/footer.css" >

    <title>Cart</title>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">School Coffee</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="product.jsp">Menu
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="cart.jsp">Cart
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="staff_login.jsp">Admin Console</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container" style="padding-top: 65px">
    <div class="col-lg-auto">
        <h2>Cart</h2>
    <%--Table--%>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Item</th>
                <th scope="col">Price</th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="<%=productList%>">
                <tr>
                    <td><c:out value="${item.name}"/></td>
                    <td><c:out value="${item.price}"/></td>
                    <td>
                        <form action="cart">
                            <input type="hidden" name="cmd" value="d"/>
                            <input type="hidden" name="name" value="${item.name}"/>
                            <button type="submit" class="btn btn-danger">
                                <span style="font-size: 1em; color: white;">
                                    <i class="fas fa-trash"></i>
                                </span>
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div>

<footer class="footer">
    <div class="container">
        <table class="table">
            <tr>
                <td>
                    Total Price:
                    <a class="btn btn-dark" style="color: white;">
                        ฿<%=totalPrice%>
                    </a>
                </td>
                <td>
                    <a class="btn btn-primary" href="checkout.jsp">
                        <span style="font-size: 1em; color: white;">
                            <i class="fas fa-shopping-cart"></i>
                        </span>
                        Checkout
                    </a>
                </td>
            </tr>
        </table>
    </div>
</footer>

</body>

</html>
