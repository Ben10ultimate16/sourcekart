<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <jsp:include page="header.jsp"></jsp:include> 
 <div class="clear spaces20"></div>
<div class="clear spaces20"></div>

<div class="container">
<div class="row">
<div class="col-sm-9 jumbotron" style="color:black;">
<div class="head" style="color:black;">
<h2><p class="myText">SHIPPING DETAILS</p></h2>
</div>

<div class= "outer">
<div class= "well" style= "width:100%">
<form action= "${pageContext.request.contextPath}/invoiceProcess" method="post">
<c:set var ="gtot" value ="0"></c:set>
<c:forEach var="c" items= "${cart}">
<c:set var ="gtot" value ="${gtot+c.cartPrice*c.cartQnty}">
</c:set>
</c:forEach>

<div class= "well">
<table>
<tr>
<td colspan="3"><b>Name:</b></td>
<td>${user.getName() }</td>
</tr>

<tr>
<td colspan="3"><b>Email:</b></td>
<td>${user.getEmail() }</td>
</tr>

<tr>
<td colspan="3"><b>Customer Address:</b></td>
<td>${user.getAddress() }</td>
</tr>

<tr>
<td colspan="3"><b>Total amount payable:</b></td>
<td>${gtot}</td>
</tr>
</table>
</div>

<br><br><hr>
<div style ="margin-top:15px;">
<h3><strong>Enter Card Details</strong></h3>
</div>
<input type ="hidden" name ="total" value ="${gtot }">
<br>
<select name ="payment">
<option value="COD">Cash On Delivery </option>
<option value="NB">Net Banking </option>
<option value="DrCr">Debit or Credit Card  </option>
</select>
<br><br>
<input type="number" name="cardnum" placeholder ="Enter Card Number..">
<input type ="text" name="cardname" placeholder ="Enter your name..">
<table>
<tr>
<th colspan ="2">Expiry Date</th>
<th> &nbsp; &nbsp; &nbsp;</th>
<th>CVV</th>
</tr>
<tr><td colspan="2"><input type="number" min="1" max="12" name="month" placeholder="MM"></tr>
<tr><td colspan="2"><input type="number" min="00" max="99" name="month" placeholder="YY"></tr>
<tr><td>&nbsp;&nbsp;&nbsp;</td></tr>
<tr><td colspan="2"><input type="password" min="00" max="999" name="cvv"></tr>

</table>
<input type="submit" value="PROCEED" class="btn btn-success">

</form>
</div>
</div>
</div>
</div>
</div>
