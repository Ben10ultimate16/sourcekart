<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<c:url value="/InsertProduct" var="insert"/>
	<form:form action="${insert} " modelAttribute="product" enctype="multipart/form-data">

		<table align="center">

			<tr>
				<td colspan="2">Product Detail</td>
			</tr>
			<tr>
				<td>Product ID</td>
				<td><form:input path="productId" /></td>
			</tr>

			<tr>
				<td>Product Name</td>
				<td><form:input path="productName" /></td>
			</tr>

			<tr>
				<td>Product Desc</td>
				<td><form:textarea path="productDesc" /></td>
			</tr>

			<tr>
				<td>Product Stock</td>
				<td><form:input path="stock" /></td>
			</tr>

			<tr>
				<td>Product Price</td>
				<td><form:input path="price" /></td>
			</tr>

			<tr>
				<td>Category Name</td>
				<td><form:input path="catId" /></td>
				
				<%-- <td><form:select path="catId">
						<form:option value="0" label="---Select---" />
						<form:options items="${categoryList}" />
					</form:select></td>
			 </tr>--%>

			<tr>
				<td>Supplier</td>
				<td><form:input path="supplierId" /></td>
			</tr>
			<tr>
				<td>Product Image</td>
				<td><form:input type="file" path="pimage" /></td>
			</tr>

			<tr>
				<td colspan="2">
					<center>
						<input type="submit" value="Insert" />
					</center>
				</td>
			</tr>

		</table>
	</form:form>
	
	${error}
	<table cellspacing="2" align="center">
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

				<td><c:url value="/deleteProduct/${product.productId}"
						var="delete" /> <a href="${delete}">DELETE</a> <c:url
						value="/updateProduct/${product.productId}" var="update" /> <a
					href="${update}">UPDATE</a></td>
			</tr>

		</c:forEach>
</body>
</html>
