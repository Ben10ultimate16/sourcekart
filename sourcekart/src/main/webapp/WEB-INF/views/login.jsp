<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="spr" %>




<jsp:include page="header.jsp"></jsp:include>




<h2>Login Form</h2>

<form action="${pageContext.request.contextPath}/login" id="loginForm"  method="post"  class="form-horizontal" >
 

 
 
  <div class="form-group">
    <label  class="col-sm-2 control-label">Email</label>
    <div class="col-sm-6">
      <input type="email" class="form-control"  placeholder="Email" name="email" >
    </div>
  </div>
  <div class="form-group">
    <label  class="col-sm-2 control-label">Password</label>
    <div class="col-sm-6">
      <input type="password" class="form-control"  placeholder="Password"  name="password">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label>
          <input type="checkbox"> Remember me
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">login</button>
    </div>
  </div>
</form>
 
 
 
 
 
 
</body>
</html>