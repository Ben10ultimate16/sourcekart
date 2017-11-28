<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <jsp:include page="header.jsp"></jsp:include> 
 <div class="clear spaces20"></div>
<div class="clear spaces20"></div>
<div class="clear spaces20"></div>
<div class="clear spaces20"></div>

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
<div class="col-lg-1 col-md-1 col-sm-12 col-xs-12">
<form:form action="${pageContext.request.contextPath}/categoryProducts" modelAttribute="category">
		<form:select path="catId" class="form-control" onchange="this.form.submit();" style="      background-color: #2d2929;
    color: antiquewhite; font-size: small;" >
		<c:if test="${catId eq 0 }">
	<c:set var="allselect" value="selected"></c:set>
	</c:if>
			<option ${allselect} value="0">Filter</option>
			<c:forEach items="${categoryList}" var="category">
				<c:if test="${catId eq category.key }">
					<c:set var="eachselect" value="selected"></c:set>
				</c:if>
				<c:if test="${catId ne category.key }">
					<c:set var="eachselect" value=""></c:set>
				</c:if>
				<option ${eachselect} value="${category.key}">${category.value}</option>
			</c:forEach>
		</form:select>
	</form:form>
	</div>
	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12"></div>
<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
<label style="font-size: larger;">COLLECTIONS</label>
</div>	
	</div>

<div class="clear spaces20"></div>


<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 spaces5"  align="center" >
				
	<div class="col-lg-1 col-md-1 col-sm-12 col-xs-12">	
	
	</div>	
			

			<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
			<div class="clear spaces20"></div>
		<div class="clear spaces20"></div>
    <c:forEach items="${productList}" var="product">
    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
				<a href="${pageContext.request.contextPath}/ProductDetail/${product.productId}">
					<img src="${pageContext.request.contextPath}/resources/pimages/${product.productId}.jpg" style="height:50px;width:50px" alt="Title1">
						</a>
					<div>
					<span><b> ${product.productName}</b></span>
					<div class="clear"></div>
					<div class="clear"></div>
					<span><i class="fa fa-inr"></i> ${product.price}</span>
					<span>${product.productDesc}</span>
				</div>
			
				</div>
				</c:forEach>
				
					</div>
					<div class="col-lg-1 col-md-1 col-sm-12 col-xs-12"></div>
					
					</div>
					</div>
					
					





