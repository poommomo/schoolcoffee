<%--
  Created by IntelliJ IDEA.
  User: Momo
  Date: 3/11/2018 AD
  Time: 22:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8"%>

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
    <link href="css/login.css" rel="stylesheet">

    <title>Staff Login</title>
</head>

<body class="text-center">
<form class="form-signin">
    <h1>Management Portal</h1>
    <h1 class="h3 mb-3 font-weight-normal">Please Login to Continue</h1>
    <input type="text" id="userInput" class="form-control" placeholder="Username" required="" autofocus="">
    <input type="password" id="userPassword" class="form-control" placeholder="Password" required="">
    <button class="btn btn-lg btn-primary btn-block" type="button" onclick="loginCheck()">Sign in</button>
    <p class="mt-5 mb-3 text-muted">© Poom Penghiran 2018</p>
</form>

<script>
    function loginCheck() {
        var username = document.getElementById("userInput").value;
        var password = document.getElementById("userPassword").value;

        if (username == "min" && password == "min") {
            window.location.href = "product_list.jsp";
        } else {
            alert("Invalid username or password (ID: min PW: min");
            location.reload();
        }
    }
</script>

</body>


</html>

