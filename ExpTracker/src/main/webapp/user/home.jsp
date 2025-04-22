<%@page import="com.entity.User"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<%@include file="../components/template.jsp"%>
</head>
<body>
	<c:if test="${empty loginUser}">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<%@include file="../components/navbar.jsp"%>


	<%
	User user = (User) session.getAttribute("loginUser");
	ExpenseDao expenseDao = new ExpenseDao(HibernateUtil.getSessionFactory());
	double total = expenseDao.getMonthlyExpense(user);
	%>

	<div class="container py-2">
		<div class="row align-items-center">
			<div class="col-md-7 text-center text-md-start">
				<h1 class="display-5 mb-3">
					Hi,
					<%=user.getName()%>
				</h1>
				<p class="lead mb-4">
					You have spent Rs.
					<%=total%>
					this month.
				</p>
				<div class="d-grid gap-2 d-md-flex">
					<a href="viewExpense.jsp" class="btn btn-primary btn-lg">Expenses</a>
					<a href="addExpense.jsp" class="btn btn-outline-primary btn-lg">Add
						Expense</a>
				</div>
			</div>
			<div class="col-md-5 text-center mt-4 mt-md-0">
				<img src="../images/money.jpg" alt="Money"
					style="max-width: 100%; height: auto;">
			</div>
		</div>
		<hr class="my-4">
	</div>
</body>
</html>