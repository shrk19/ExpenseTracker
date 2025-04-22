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

@WebServlet("/deleteExpenseAction")
public class DeleteExpenseServlet extends HttpServlet{
	
	private ExpenseDao expenseDao;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		HttpSession session = req.getSession();
		expenseDao = new ExpenseDao(HibernateUtil.getSessionFactory());
		boolean success = expenseDao.deleteExpense(id);
		
		if(success) {
			session.setAttribute("msg", "Expense deleted successfully");
		}else {
			session.setAttribute("msg", "Server error");
		}
		resp.sendRedirect("user/viewExpense.jsp");
	}
	
	
	
}
