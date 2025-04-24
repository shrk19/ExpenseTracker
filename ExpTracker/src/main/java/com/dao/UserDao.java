package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.mindrot.jbcrypt.BCrypt;

import com.db.HibernateUtil;
import com.entity.User;

import jakarta.persistence.NoResultException;
import jakarta.persistence.Query;

public class UserDao {
	
	private SessionFactory factory = null;
	private Session session = null;
	private Transaction tx = null;
	
	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public boolean doesEmailExist(User user) {
		boolean exists = false;
		try {
			 session = factory.openSession();
			 tx = session.beginTransaction();
			 String hql = "FROM User where email = :email";
			 Query q = session.createQuery(hql, User.class);
		     q.setParameter("email", user.getEmail());
		     
		     List<User> result = q.getResultList();
		     System.out.print(result +  " " + exists);
		     if(!result.isEmpty()) return true;
		     tx.commit();
		     
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return exists;
	}
	
	public boolean saveUser(User user) {
		boolean success = false;
		try{
			 session = factory.openSession();
			 tx = session.beginTransaction();
		     
			 session.persist(user);
			 success = true;
			 
			 tx.commit();
			 
		}catch(Exception e) {
			System.out.println("Error in saving user : "+e);
			if (tx != null) tx.rollback();
            e.printStackTrace();
		}
		return success;
	}
	
	public User loginUser(String email, String password) {

		User user = null;
		boolean isPasswordCorrect = false;
		try {
			session = factory.openSession();
			tx = session.beginTransaction();
			
			String hql = "FROM User WHERE email = :email";
	        Query q = session.createQuery(hql, User.class);
	        q.setParameter("email", email);
	        
	        user = (User)q.getSingleResult();
	        System.out.println("from query : "+user);
	        
	        isPasswordCorrect = user!=null ? BCrypt.checkpw(password, user.getPassword()) : false;
	        
	        if(!isPasswordCorrect) user = null;
	        
			tx.commit();
			
		}catch(Exception e) {
			System.out.println("Error in login : "+e);
			if(tx != null) tx.rollback();
			e.printStackTrace();
		}
		return user;
	}
	
}
