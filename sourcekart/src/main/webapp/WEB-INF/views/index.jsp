 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head lang="en">
<style type="text/css">
.img-rounded
{
back
}
</style>
<title>Web App</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="utf-8">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"></script>

<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="utf-8">

</head>
<%@ include file="header.jsp" %> 
<body>

<div class="container">

<h2><i>sourcekart</i></h2>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
<ol class="carousel-indicators">
<li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
<li data-target="#myCarousel2" data-slide-to="1" class="active"></li>
<li data-target="#myCarousel3" data-slide-to="2" class="active"></li>
</ol>

<div class="carousel-inner">
<div class="item active">
<img class="img-rounded" class="img-responsive center-block"
src="resources/lap1.jpg" style="width:1140px;height:250px"/> 
 </div>



<div class="item">
<img class="img-rounded" class="img-responsive center-block"
src="resources/lap5.jpg" style="width:1140px;height:250px"/>
</div>

<div class="item">
<img class="img-rounded" class="img-responsive center-block"
src="resources/lap8.jpg" style="width:1140px;height:250px"/>
</div>
</div>

<a class="left carousel-control" href="#myCarousel" data-slide="prev">
<span class="glyphicon glyphicon-chevron-left"></span>
<span class="sr-only">Previous</span>
</a>

<a class="right carousel-control" href="#myCarousel" data-slide="next">
<span class="glyphicon glyphicon-chevron-right"></span>
<span class="sr-only">Next</span>
</a>


</div>
</div>
</body>
</html>

