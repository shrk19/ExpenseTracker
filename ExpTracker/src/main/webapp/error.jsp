<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<%@include file="components/template.jsp"%>
</head>
<body>
	<div class="container ">
		<div
			class="d-flex flex-column align-items-center justify-content-center">
			<img src="images/error.png" alt="error"
				style="max-width: 20%; height: auto;">
			<h1 class="display-6">Server Error</h1>
			<p class="lead mb-4">
				An unexpected error occurred. Please try again later. <strong>Error
					Details:</strong>
				<%=exception.getMessage()%>
			</p>
		</div>
	</div>
</body>
</html>
