<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@include file="components/template.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container pt-4">
		<div class="row justify-content-center">
			<div class="col col-12 col-md-6">
				<h5 class="text-center mb-4">Login</h5>
				<c:if test="${not empty msg}">
					<p class="alert alert-success">${msg}</p>
					<c:remove var="msg" />
				</c:if>
				<form action="login" method="post">
					<div class="mb-3">
						<label for="email" class="form-label">Email address</label> <input
							type="email" class="form-control" id="email" name="email"
							aria-describedby="emailHelp">
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">Password</label> <input
							type="password" class="form-control" id="password"
							name="password">
					</div>
					<button type="submit" class="btn btn-primary w-100">Submit</button>
					<p>
						Don't have an account ? <a href="register.jsp">Register</a>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>