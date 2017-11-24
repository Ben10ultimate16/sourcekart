<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib  uri="http://www.springframework.org/tags/form" prefix= "spr" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Trasitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<style>
.navbar-inverse 
 {
    background-color:#d0b89b !important;
    border-color: #f4f3f7 !important;
    color:#0000 !important;
}
.navbar-inverse .navbar-nav>li>a {
    color: #21263b !important;
}
</style>

<nav id="navbar-red" class="navbar navbar-inverse navbar-static-top" role="navigation">
<div class="container">
<ul class="nav navbar-nav">
<button type="botton" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-nav">
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
</ul>
</div>
<div class="collapse navbar-collapse" id="bs-example-nav">
<ul class="nav navbar-nav">
<!-- <li><a href="/"> Home<i class="fa fa-home" aria-hidden="true"></i></a></li> -->

<c:url value="/" var="home"></c:url>
<li><a href="${home}">Home</a></li>

<c:if test="${pageContext.request.userPrincipal.name==null}">
<li><a style="color:white" href="${pageContext.request.contextPath}/goTologin"><span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;LOGIN</a></li>
<c:url value="/register" var="reg"></c:url>
<li><a href="${reg}">Register</a></li>
</c:if>

<%-- <c:url value="/Login" var="log"></c:url>
<li><a href="${log}">Login<span class="glyphicon glyphicon-log-in"></span></a></li>
 --%>
 
 <c:if test="${pageContext.request.userPrincipal.name!=null }">
<c:if test="${sessionScope.roleName=='admin'}">
<li class="navbarTitleStyle dropdown">
<li><a href="product">Product </a></li>
<li><a href="Category">Category</a></li>
<li><a href="supplier">Supplier</a></li>
</c:if>
<c:if test="${sessionScope.roleName=='user'}">
<%-- <li><a style="color:white" href="${pageContext.request.contextPath}/ProductList">ProductList</a></li> --%>
<li><a style="color:white" href="${pageContext.request.contextPath}/AllProducts">&nbsp;Products</a></li>

<li><a style="color:white" href="${pageContext.request.contextPath}/MyCart">My Cart</a></li>
</c:if>
<li><a style="color:white" href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-log-out"></span>&nbsp;LOG OUT</a></li>
</c:if>

</ul>
</div>
</nav>
</body>
</html>
