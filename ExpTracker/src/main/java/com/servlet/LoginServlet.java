package com.servlet;

import java.io.IOException;

import com.dao.UserDao;
import com.db.HibernateUtil;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private UserDao userDao; 
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		userDao = new UserDao(HibernateUtil.getSessionFactory());
		User user = userDao.loginUser(email, password);
		
		HttpSession session = req.getSession();
		if(user==null) {
			session.setAttribute("msg", "Invalid username or password");
			resp.sendRedirect("login.jsp");
		}else {
			session.setAttribute("loginUser", user);
			resp.sendRedirect("user/home.jsp");
		}
	}

}
