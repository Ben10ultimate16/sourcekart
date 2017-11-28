<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="spr" %>




<jsp:include page="header.jsp"></jsp:include>




<h2>Login Form</h2>

<form action="${pageContext.request.contextPath}/login" id="loginForm"  method="post" >
 

  <div class="container">
    <label><b>Email</b></label>
    <input type="text" placeholder="Enter Username" name="email" >

    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password">
        
   <input type="submit" value="login"/>
   
  </div>

  
   
  
</form>

</body>
</html>