
<%@ page language="java" contentType="text/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <jsp:include page="header.jsp"></jsp:include> 
 
 <c:if test="${pageContext.request.userPrincipal.name!=null}">
	<c:if test = "${sessionScope.roleName == 'user'}">
 
 
 <div class="clear spaces20"></div>
<div class="clear spaces20"></div>

<div class="clear spaces20"></div>
<div class="clear spaces20"></div>
<div class="clear spaces20"></div>

<div class="clear spaces20"></div>

<div class="col-lg-12 col-md-12 col-xs-12 col-sm-12"> 

<table class="table table-sm table-inverse">
<thead class="thead-inverse" style="font-variant-caps: all-petite-caps; font-family: initial;" >
<tr>
<th>Product Id</th>
<th>Product Name</th>

<th>Product Price</th>
<th>Product Stock</th>
<th>Category</th>

<th>Product Image</th>
<th>Operations</th>
</tr>
</thead>
<c:forEach items="${productList}" var="product">
<tr>
<td>${product.productId}</td>
<td>${product.productName}</td>

<td>${product.price}</td>
<td>${product.stock}</td>
<td>${product.catId}</td>

<td><a href="ProductDesc/${product.productId}"><img src="<c:url value="/resources/pimages/${product.productId}.jpg"/> "width="50px" height="50px" />
</a></td>
<td><a href="<c:url value="updateProduct/${product.productId}"/>">UPDATE</a>/
<a href="<c:url value="deleteProduct/${product.productId}"/>">DELETE</a></td>

</tr>

</c:forEach>
</table>
</div>

</c:if>
	
	<c:if test = "${sessionScope.roleName == 'admin'}">
		<jsp:forward page="login.jsp" />
	</c:if>
	
</c:if>

<c:if test="${pageContext.request.userPrincipal.name==null}">
	<jsp:forward page="login.jsp" />
</c:if>


