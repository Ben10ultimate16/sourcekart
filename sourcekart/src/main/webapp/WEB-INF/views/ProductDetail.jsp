<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <jsp:include page="header.jsp"></jsp:include> 
 
  <c:if test="${pageContext.request.userPrincipal.name!=null}">
	<c:if test = "${sessionScope.roleName == 'user'}">
 
 
 <div class="clear spaces20"></div>
<div class="clear spaces20"></div>


<div class="clear spaces20"></div>

<div class="clear spaces20"></div>

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
<form action="${pageContext.request.contextPath}/AddCart" method="POST">
<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" >

<img src="${pageContext.request.contextPath}/resources/pimages/${product.getProductId()}.jpg"  alt="Image" class="productimage">
<div class="clear"></div>
</div>
<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" id="productimgMT">
<span><b class="productname"> ${product.getProductName()}</b></span>
					
					<div class="clear spaces20"></div>
					<span ><i id="ruppee" class="fa fa-inr" ></i>  <i class="productname"> ${product.getPrice()} </i></span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><h4 class="stckclr" >In Stock</h4></span>
					
					<c:if test="${sessionScope.roleName=='user'}">
<input type="hidden" name="cartProductId" value="${product.getProductId()}"/>
<div class="form-group">
<input name="cartQnty" class="form-control" placeholder="QUANTITY"  required="requied"/>
</div>
<div class="form-group">
<input type="submit" value="ADD TO CART"  class="btn btn-primary" />
</div>
</c:if>
</div>
<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>
</form>
</div>		

</c:if>
	
	<c:if test = "${sessionScope.roleName == 'admin'}">
		<jsp:forward page="login.jsp" />
	</c:if>
	
</c:if>

<c:if test="${pageContext.request.userPrincipal.name==null}">
	<jsp:forward page="login.jsp" />
</c:if>
				

		
