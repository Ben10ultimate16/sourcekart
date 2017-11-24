<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <jsp:include page="header.jsp"></jsp:include> 
 <div class="clear spaces20"></div>
<div class="clear spaces20"></div>


<div class="col-lg-12 col-md-12 col-xs-12 col-sm-12"> 
<div class="col-lg-2 col-md-2 col-xs-12 col-sm-12"></div>
<div class="col-lg-8 col-md-8 col-xs-12 col-sm-12">
<form action="${pageContext.request.contextPath}/ack" class="form-horizontal">
<fieldset>
<div class="form-group">
<label class="col-sm-4 control-label" for="username">Customer Name</label>
<div class="col-sm-4">
<label class="col-sm-4 control-label" for="username">${userDetails.getName()}</label>
</div>
</div>

<div class="form-group">
<label class="col-sm-4 control-label" for="email">Customer Email</label>
<div class="col-sm-4">
<label class="col-sm-4 control-label" for="email">${userDetails.getEmail()}</label>
</div>
</div>

<div class="form-group">
<label class="col-sm-4 control-label" for="address">Customer Address</label>
<div class="col-sm-4">
<label class="col-sm-4 control-label" for="address">${userDetails.getAddress()}</label>
</div>
</div>

<div class="form-group">
<label class="col-sm-4 control-label" for="deliverydate">Delivery Date</label>
<div class="col-sm-4">
<label class="col-sm-12 control-label" for="deliverydate">Within 7 working days.</label>
</div>
</div>

<div class="form-group">
<label class="col-sm-4 control-label" for="submit"></label>
<div class="col-sm-4">
<input type="submit" value="CONFIRM" class="btn btn-lg" />
</div>
</div>


</fieldset>
</form>
</div>
<div class="col-lg-2 col-md-2 col-xs-12 col-sm-12"></div>

</div>
