<%@page import="com.db.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expense Tracker</title>
<%@include file="components/template.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<%
	SessionFactory sf = HibernateUtil.getSessionFactory();
	%>
	<div class="container px-5">
		<div class="container px-5 py-5">
			<div class="row align-items-center">
				<div class="col-md-7 text-center text-md-start">
					<h1 class="display-5 mb-3">ExpenseTracker</h1>
					<p class="lead mb-4">Take control of your money.</p>
					<div class="d-grid gap-2 d-md-flex">
						<a href="register.jsp" class="btn btn-outline-primary btn-lg">Get
							started</a>
					</div>
				</div>
				<div class="col-md-5 text-center mt-4 mt-md-0">
					<img src="images/money.jpg" alt="Money"
						style="max-width: 100%; height: auto;">
				</div>
			</div>
			<hr class="my-4">
		</div>
		<section class="container my-5">
			<div class="row text-center">
				<div class="col-md-4 mb-4">
					<div class="feature-icon mb-3">
						<h1>💸</h1>
					</div>
					<h4>Simple Tracking</h4>
					<p>Add and manage your daily expenses with ease.</p>
				</div>
				<div class="col-md-4 mb-4">
					<div class="feature-icon mb-3">
						<h1>📊</h1>
					</div>
					<h4>Monthly Summary</h4>
					<p>See a quick overview of monthly spend.</p>
				</div>
				<div class="col-md-4 mb-4">
					<div class="feature-icon mb-3">
						<h1>🔒</h1>
					</div>
					<h4>Secure & Private</h4>
					<p>Your data stays safe and confidential with us.</p>
				</div>
			</div>
		</section>
	</div>
	<footer class="bg-light text-center py-3"> &copy; 2025
		ExpenseTracker | Made with ❤️  </footer>
</body>
</html>