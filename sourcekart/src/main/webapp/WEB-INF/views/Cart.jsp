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
<div class="clear spaces20"></div>

<div  style="margin-left: 349px;"><img src="${pageContext.request.contextPath}/resources/.png" id="cartimage"/><label>MY CART </label></div>
	<div class="clear spaces20"></div>

<div class="carttable">
<form action= "${pageContext.request.contextPath}/placeorder" method="get">
	<table class="table table-sm table-inverse">
				<thead class="thead-inverse" id="thead-inversestyle" >
						<tr>
							<th>Product Name</th>
							<th>Product Image</th>
							<th>Product Description</th>
							<th> Quantity</th>
							<th>Price&nbsp;(&nbsp;<i class="fa fa-rupee"></i>&nbsp;)</th>
							<th>Total&nbsp;(&nbsp;<i class="fa fa-rupee"></i>&nbsp;)</th>
							<th>Operation</th>
						</tr>
				</thead>
		 <c:if test="${empty userCartList}">
		 <tr><td >No Record Exists</td></tr>
		 </c:if>

		<c:forEach items="${userCartList}" var="c" varStatus="st">
						<tr >
								<td>${c.product.productName}</td>
								<td><img src="${pageContext.request.contextPath}/resources/pimages/${c.product.productId}.jpg" class="cartproductimg" style="width:200px;height:200px;align:center;"/></td>
								<td>${c.product.productDesc}</td>
								<td>${c.cartQnty}</td>
								<td>${c.cartPrice}</td>
								<td>${c.cartQnty*c.cartPrice}</td>
								<td><a href="<c:url value="/deleteCart/${c.cartId}"/>"><span class="glyphicon glyphicon-trash" id="pencilstyle"></span></a></td>
						</tr>
		
			<c:set var="gtot" value="${gtot+c.cartPrice*c.cartQnty }"></c:set>
		</c:forEach>

				<tr>
					
					<td colspan="7" ><span class="col-lg-7" align="right" ><label >GRAND TOTAL:&nbsp;</label>&nbsp;<i class="fa fa-inr"></i>&nbsp;<b><c:out value="${gtot}"></c:out></b></span>
					 </td>
					
	
				 </tr>
			
				</table>
	
	 <a href="${pageContext.request.contextPath}/Mycart" class="btn btn-cntu" id="placeorder" align="center"></a>
	<input type="submit" value="PLACE ORDER" align="right" style="margin-left:80%;color:green;">
 
	</form>
 </div>

 <a href="${pageContext.request.contextPath}/" class="btn btn-cntu" id="continueshop" align="center"> CONTINUE SHOPPING</a> 

</div>


<div class="col-lg-2 col-md-2 col-xs-12 col-sm-12"></div>

</div>
