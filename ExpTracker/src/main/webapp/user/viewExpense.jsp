<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.entity.Expense"%>
<%@page import="java.util.List"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Expenses</title>
<%@include file="../components/template.jsp"%>
</head>
<body>
	<c:if test="${empty loginUser}">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<%@include file="../components/navbar.jsp"%>
	<div class="container pt-4">
		<div class="d-flex justify-content-between pb-2">
			<h5 >All Expenses</h5>
			<a class="btn btn-outline-primary" href="addExpense.jsp">Add</a>
		</div>
		
		<c:if test="${not empty msg}">
			<div class="alert alert-success alert-dismissible fade show">
				${msg}
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
			<c:remove var="msg" />
		</c:if>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">No.</th>
					<th scope="col">Title</th>
					<th scope="col">Date</th>
					<th scope="col">Amount</th>
					<th scope="col">Comment</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				User user = (User) session.getAttribute("loginUser");
				ExpenseDao expenseDao = new ExpenseDao(HibernateUtil.getSessionFactory());
				List<Expense> list = expenseDao.getAllExpenseByUser(user);
				for (int i = 1; i < list.size() + 1; i++) {
					Expense ex = list.get(i - 1);
				%>
				<tr>
					<th scope="row"><%=i%></th>
					<td><%=ex.getTitle()%></td>
					<td><%=ex.getDate()%></td>
					<td><%=ex.getAmount()%></td>
					<td><%=ex.getDescription()%></td>
					<td>
						<a href="editExpense.jsp?id=<%=ex.getId()%>" class="btn btn-light">Edit</a> 
						<a href="../deleteExpenseAction?id=<%=ex.getId()%>" class="btn btn-light">Delete</a>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>