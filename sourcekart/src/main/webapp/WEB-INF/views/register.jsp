<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
    <%@ taglib  uri="http://www.springframework.org/tags/form" prefix= "spr" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%-- <head>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>


<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/FormValidation.js"></script>


</head>
 --%>
 <jsp:include page="header.jsp"></jsp:include>
 
 <body>

<div><div class="container">
<h1>Sourcekart Customer sign up Form</h1>
<div class="col-lg-12">
<div class="row">
<spr:form   action="saveregister"  modelAttribute="user" method="post"  id="registerForm">

<div class= "col-lg-12">

<div class="form-group">
<label>Email</label>
<spr:input path ="email" placeholder="Enter email id...." class="form-control" />
</div>

<div class="form-group">
<label>Name</label>
<spr:input path="name" placeholder="Enter name...." class="form-control"/>
</div>

<%-- <div class="form-group">
<label>Password</label>
<spr:input path="password"placeholder="Enter password...."  class="form-control"/>
</div>
 --%>
 
 <div class="form-group">
<label>Password</label>
<spr:input path="password" placeholder="Enter password...." class="form-control"/>
</div>
 
<div class="form-group">
<label>Phone</label>
<spr:input path="phone" type="password" placeholder="Enter phone...." class="form-control"/>
</div>

<div class="form-group">
<label>Address</label>
<spr:input path="address" placeholder="Enter address...." class="form-control"/>
</div>

<div class="form-group">
<label>Country</label>
<spr:input path="country" placeholder="Enter country...." class="form-control"/>
</div>
<spr:input type="hidden" path="role" value="ROLE_USER" />
<spr:input type="hidden" path="enabled" value="TRUE" />
<button type="submit" class="btn btn-lg btn-info">Submit</button>
<button type="reset" class="btn btn-lg btn-info">Cancel</button>
</spr:form> 

</div>
</div>
</div>
</div>


</body>
</html>
