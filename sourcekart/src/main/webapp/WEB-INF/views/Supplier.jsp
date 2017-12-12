<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<c:if test="${pageContext.request.userPrincipal.name!=null}">
	<c:if test = "${sessionScope.roleName == 'admin'}">
	
	
	<c:url value="/AddSupplier" var="insert" />
	<form:form action="${insert} " modelAttribute="supplier" id="supplierForm">
	
		<table align="center" cellspacing="2">
			<tr>
				<td colspan="2">Supplier Module</td>
			</tr>

			<%-- <tr>
				<td>Supplier ID</td>
				<td><form:input path="supplierId" /></td>
			</tr>
 --%>
			<tr>
				<td>Supplier Name</td>
				<td><form:input path="supplierName" /></td>
			</tr>

			<tr>
				<td>Supplier Address</td>
				<td><form:input path="supplierAddress" /></td>
			</tr>
		</table>
		<tr>
		<td colspan="3"></td>
		<center>
			<input type="submit" value="Insert" />
		</center>
	</tr>
	</form:form>
	
	
	
	<div    class="col-md-2 col-lg-2"> </div>
	<div    class="col-md-8 col-lg-8"> 
	 
	<table cellspacing="2" align="center"  class="table table-bordered"  >
		<tr bgcolor="gray">
			<td>Supplier ID</td>
			<td>Supplier Name</td>
			<td>Supplier Address</td>
			<td>operation</td>
		</tr>
		
		<c:forEach items="${supplierList}" var="supplier">
			<tr bgcolor="cyan">
				<td>${supplier.supplierId}</td>
				<td>${supplier.supplierName}</td>
				<td>${supplier.supplierAddress}</td>

				<td><c:url value="/deleteSupplier/${supplier.supplierId}"
						var="delete" /> <a href="${delete}">DELETE</a> <c:url
						value="/updateSupplier/${supplier.supplierId}" var="update" /> <a
					href="${update}">UPDATE</a></td>
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
		
		
		<div    class="col-md-2 col-lg-2"> </div>
</body>
</html>