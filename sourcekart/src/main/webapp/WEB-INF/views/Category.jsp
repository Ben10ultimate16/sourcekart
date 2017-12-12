<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="com.model.Category "
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix= "form" %>
     
          <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
     
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category</title>





</head>
<body>
 <jsp:include page="header.jsp"></jsp:include>
 

<div>

<c:if test="${pageContext.request.userPrincipal.name!=null}">
	<c:if test = "${sessionScope.roleName == 'admin'}">
		<form:form action="AddCategory" modelAttribute="category"  id="categoryForm">
			<table align="center" cellspacing="2" >
			<tr >
			<td colspan="2">Category Module</td>
			</tr>
			
			<tr>
			<td>Category Name</td>
			<!--<td><input type="text" name="catName"/></td>-->
			<td><form:input path="catName"/></td>
			</tr>
			
			<tr>
			<td>Category Desc</td>
			<!--<td><input type="text" name="catDesc"/></td>-->
			<td><form:input path="catDesc"/></td>
			</tr>
			<tr>
			
			<td colspan="2">
			<center><input type="submit"  value="Insert"/></center>
			</td>
			</tr>
			
			</table>
		</form:form>
		
		<div class="col-md-12 col-lg-12">
			<table cellspacing="2" align="center"  class="table table-bordered">
				<tr bgcolor="gray">
				<td>Category ID</td>
				<td>Category Name</td>
				<td>Category Description</td>
				<td>Operation</td>
				</tr>
				
				<c:forEach items="${CategoryList }" var="category">
				<tr bgcolor="cyan">
				<td>${category.catId}</td>
				<td>${category.catName}</td>
				<td>${category.catDesc}</td>
							
				<td>
				<a href="<c:url value="/deleteCategory/${category.catId}"/>">DELETE</a>
				<a href="<c:url value="/updateCategory/${category.catId}"/>">UPDATE</a>
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

</div>
</body>
</html>