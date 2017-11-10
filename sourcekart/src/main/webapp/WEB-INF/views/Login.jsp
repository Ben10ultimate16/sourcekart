<jsp:include page="header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="container">
	<div class="row">

		<div class="col md-4 myform" style="width: 600px; margin:20px auto;">
			<div class="myform_head">

				<h3>Login Here!!</h3>
			</div>
			
			<!-- Form login -->
			<c:url value="/j_spring_security_check" var="action"></c:url>
		<form:form action="${action}" class="log" method="post" >

			
				<div class="form-group">
					<label>User Name</label>
					<input type="text" name="j_username" class="newtext form-control"
						placeholder="Username"/>
						
				</div>

				<div class="form-group">
					<label>Password</label> 
					<input type="password" name="j_password" class="newtext form-control" placeholder="Password" />
				</div>
				
				<c:if test="${error != null }">${error}</c:if>
				<c:if test="${logout != null }">${logout}</c:if>
				
				<c:url value="/register" var="register"></c:url>
			<u><a href="${register}">New User?</a></u><br>
				<!-- <div class="form-group">
					<label for="CategoryImage">Upload Image</label> <input type="file"
						class="form-control-file" id="CategoryImage">
				</div> -->

				<button type="submit" class=" btn-green btn btn-primary">Login</button>
			</form:form>
		</div>
	</div>
</div>

