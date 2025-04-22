<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<%@include file="components/template.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container pt-4">
		<div class="row justify-content-center">
			<div class="col col-12 col-md-6">
				<h5 class="text-center mb-4">Register</h5>
				<c:if test="${not empty msg}">
					<p class="alert alert-success">${msg}</p>
					<c:remove var="msg" />
				</c:if>
				<form action="register" method="post">
					<div class="mb-3">
						<label for="name" class="form-label">Name</label> <input
							type="text" class="form-control" id="name" name="name">
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">Email address</label> <input
							type="email" class="form-control" id="email" name="email"
							aria-describedby="emailHelp">
						<div id="emailHelp" class="form-text">We'll never share your
							email with anyone else.</div>
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">Password</label> <input
							type="password" class="form-control" id="password"
							name="password">
					</div>
					<button class="btn btn-primary w-100">Submit</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>