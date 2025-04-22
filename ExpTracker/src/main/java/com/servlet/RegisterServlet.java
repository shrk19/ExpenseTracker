package com.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.HibernateUtil;
import com.entity.User;

import jakarta.servlet.annotation.WebServlet;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	
	private UserDao userDao;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("cll");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String pass = req.getParameter("password");
	
		User u = new User(name, email, pass);
		System.out.println(u);
		
		userDao = new UserDao(HibernateUtil.getSessionFactory());
		HttpSession session = req.getSession();
		
		if(userDao.doesEmailExist(u)) {
			System.out.println("already eixsts email");
			session.setAttribute("msg", "Email already exists");
		}else if(userDao.saveUser(u)){
			session.setAttribute("msg", "Registered successfully");
		}else {
			session.setAttribute("msg", "Server Error");
		}
			
		resp.sendRedirect("register.jsp");
		
	}

}
