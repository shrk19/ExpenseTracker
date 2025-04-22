<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Expense</title>
<%@include file="../components/template.jsp"%>
</head>
<body>
	<c:if test="${empty loginUser}">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<%@include file="../components/navbar.jsp"%>
	<div class="container pt-4">
		<div class="row justify-content-center">
			<div class="col col-12 col-md-6">
				<h5 class="text-center mb-4">Add Expense</h5>
				<c:if test="${not empty msg}">
					<p class="alert alert-success">${msg}</p>
					<c:remove var="msg" />
				</c:if>
				<form action="../addExpenseAction" method="post">
					<div class="mb-3">
						<label for="title" class="form-label">Title</label> 
						<input type="text" class="form-control" id="title" name="title">
					</div>
					<div class="mb-3">
						<label for="date" class="form-label">Date</label> 
						<input type="date" class="form-control" id="date" name="date">
					</div>
					
					<label for="amount" class="form-label">Amount</label>
					<div class="input-group mb-3">
						<span class="input-group-text">Rs.</span> 
						<input type="text" class="form-control" name="amount">
						<span class="input-group-text">.00</span>
					</div>
					
					<div class="mb-3">
						<label for="description" class="form-label">Description</label>
						<textarea name="description" class="form-control"></textarea>
					</div>
					<button class="btn btn-primary w-100">Submit</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>