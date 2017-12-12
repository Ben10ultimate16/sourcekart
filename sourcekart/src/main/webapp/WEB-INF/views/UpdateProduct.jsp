<%@ page language="java" contentType="text/html"
	import="com.model.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Updating Product</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<c:if test="${pageContext.request.userPrincipal.name!=null}">
	<c:if test = "${sessionScope.roleName == 'admin'}">



<form:form action="${pageContext.request.contextPath}/UpdateProduct" modelAttribute="product" method="post" enctype="multipart/form-data">
		<table align="center" cellspacing="2">
			<tr>
				<td colspan="2">Product Module</td>
			</tr>
			<tr>
				<td>Product ID</td>
				<!--<td><input type="text" name="catId" /></td>-->
				<td><form:input path="productId" /></td>
			</tr>
			<tr>
				<td>Product Name</td>
				<!--<td><input type="text" name="catName" /></td>-->
				<td><form:input path="productName" />
			</tr>
			<tr>
				<td>Product Desc</td>
				<!--<td><input type="text" name="catDesc" /></td>-->
				<td><form:input path="productDesc" />
			</tr>
			<tr>
				<td>Product Stock</td>
				<td><form:input path="Stock" /></td>
			</tr>

			<tr>
				<td>Product Price</td>
				<td><form:input path="Price" /></td>
			</tr>

			<tr>
				<td>Category</td>
				<td><form:select path="catId">
						<form:option value="0" label="---Select---" />
						<form:options items="${categoryList}" />
					</form:select></td>
			</tr>

			<tr>
				<td>Supplier</td>
				<%-- <td><form:input path="supplierId" /></td> --%>
				
				<td><form:select path="supplierId">
						<form:option value="0" label="---Select---" />
						<form:options items="${supplierList}" />
					</form:select></td>
				
				
			</tr>
			<tr>
				<td>Product Image</td>
				<td><form:input type="file" path="pimage" /></td>
			</tr>
		</table>
		<tr>
		<td colspan="3"></td>
		<center>
			<input type="submit" value="UpdateProduct" />
		</center>
	</tr>
	</form:form>
	
	<div class="col-md-12 col-lg-12">
	<table cellspacing="2" align="center" class="table table-bordered">
		<tr bgcolor="gray">
			<td>Product ID</td>
			<td>Product Name</td>
			<td>Product Description</td>
			<td>Stock</td>
			<td>Price</td>
			<td>Category ID</td>
			<td>Supplier ID</td>
			<td>operation</td>
		</tr>

		<c:forEach items="${productList}" var="product">
			<tr bgcolor="cyan">
				<td>${product.productId}</td>
				<td>${product.productName}</td>
				<td>${product.productDesc}</td>
				<td>${product.stock}</td>
				<td>${product.price}</td>
				<td>${product.catId}</td>
				<td>${product.supplierId}</td>
				
				<td><c:url value="/deleteProduct/${product.productId}" var="delete"/>
				<a href="${delete}">DELETE</a>
				<c:url value="/updateProduct/${product.productId}" var="update"/>
				<a href="${update}">UPDATE</a>
				</td>
			</tr>

		</c:forEach>


	</table>
	</div>
	</c:if>
	
	<c:if test = "${sessionScope.roleName == 'user'}">
		<jsp:forward page="login.jsp" />
	</c:if>
	
</c:if>

<c:if test="${pageContext.request.userPrincipal.name==null}">
	<jsp:forward page="login.jsp" />
</c:if>
		
	
</body>
</html>
