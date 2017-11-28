<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Product</title>
<style type="text/css">
p{
color:red;
font-family: "Lucida Sans Unicode", "Lucida Grande", "sans-serif";
}
.font
{
font-family: "Lucida Sans Unicode", "Lucida Grande", "sans-serif";
}
</style>
</head>
<body>
	<center>
		<h2>Product Details</h2>
	</center>
	<br>
	<div class="container">
		<table class="table table-striped">
			<tr>
				<c:url value="/resources/productimages/${product.productId }.jpg" var="image"></c:url>
			<td colspan="2"><img src="${image}" height="300" width="250"/></td>
			<td class="font">ProductName&nbsp&nbsp   ${product.productName}<br><br>
			   
			    Price&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp    ${product.price}<br><br>
			    Description&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp  ${product.productDesc}<br><br>
			</tr>
		</table>
		<c:if test="${product.stock!=0 }">
	<c:url value="/cart/addtocart/${product.productId}" var="shop"></c:url>
		<form action="${shop}">
			<!-- Enter Units<input type="text" name="units"><br> -->
			
			<input type="text" name="units" value="1" style="width: 36px; text-align: center;" hidden />
			
			<button type="submit"  class="btn btn-warning pull-left" >
			<span class="glyphicon glyphicon-shopping-cart"></span>AddToCart</button>
			</form>
	</c:if>
	
	<c:url value="/product" var="action"></c:url>
		<form action="${action}">
			<button type="submit"  class="btn btn-success pull-right" >
			<span class="glyphicon glyphicon-eye-open"></span>Back</button>
			</form>
		

	
	<c:if  test="${product.stock==0 }">
	<center><p>Out Of Stock</p></center>
	</c:if>
	
	</div><br>

</body>
</html>
 
 --%>