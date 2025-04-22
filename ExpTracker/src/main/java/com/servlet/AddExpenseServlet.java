package com.servlet;

import java.io.IOException;

import com.dao.ExpenseDao;
import com.db.HibernateUtil;
import com.entity.Expense;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addExpenseAction")
public class AddExpenseServlet extends HttpServlet {
	
	private ExpenseDao expenseDao;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Add expense servlet called");
		
		String title = req.getParameter("title");
		Double amount = Double.parseDouble(req.getParameter("amount"));
		String date = req.getParameter("date");
		String description = req.getParameter("description");
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("loginUser");
		
		//System.out.println(title+" "+amount+" "+date+" "+description+" "+user);
		
		Expense expense = new Expense(date, title, amount, description, user);
		
		expenseDao = new ExpenseDao(HibernateUtil.getSessionFactory());
		boolean success = expenseDao.addExpense(expense);
		
		if(success) {
			session.setAttribute("msg", "Expense added successfully");
		}else {
			session.setAttribute("msg", "Server error");
		}
		resp.sendRedirect("user/addExpense.jsp");
		
	}

}
