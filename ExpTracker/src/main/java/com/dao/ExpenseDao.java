package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Expense;
import com.entity.User;

import jakarta.persistence.Query;

public class ExpenseDao {
	
	private SessionFactory factory = null;
	private Session session = null;
	private Transaction tx = null;
	
	public ExpenseDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public boolean addExpense(Expense expense) {
		boolean success = false;
		try {
			session = factory.openSession();
			tx = session.beginTransaction();
			
			session.persist(expense);
			success = true;
			
			tx.commit();
			
		}catch(Exception e) {
			System.out.println("Error in adding expense : "+e);
			if (tx != null) tx.rollback();
            e.printStackTrace();
		}
		return success;
	}
	
	public boolean editExpense(Expense expense) {
		boolean success = false;
		try {
			session = factory.openSession();
			tx = session.beginTransaction();
			
			session.merge(expense);
			success = true;
			
			tx.commit();
			
		}catch(Exception e) {
			System.out.println("Error in adding expense : "+e);
			if (tx != null) tx.rollback();
            e.printStackTrace();
		}
		return success;
	}
	
	public Expense getExpenseById(int id) {
		Expense expense = null;
		try {
			session = factory.openSession();
			tx = session.beginTransaction();
			
			String hql = "From Expense WHERE id = :id";
			Query q = session.createQuery(hql, Expense.class);
			q.setParameter("id", id);
			
			expense = (Expense)q.getSingleResult();
			
			tx.commit();
			
		}catch(Exception e) {
			if (tx != null) tx.rollback();
			e.printStackTrace();
		}
		return expense;
	}
	
	public List<Expense> getAllExpenseByUser(User user){
		List<Expense> list = new ArrayList();
		try {
			session = factory.openSession();
			tx = session.beginTransaction();
			
			String hql = "FROM Expense WHERE user = :user ";
			Query q = session.createQuery(hql, Expense.class);
			q.setParameter("user", user);
			
			list = q.getResultList();
			tx.commit();
			
		}catch(Exception e) {
			if (tx != null) tx.rollback();
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean deleteExpense(int id) {
		boolean success = false;
		try {
			session = factory.openSession();
			tx = session.beginTransaction();
			
			//Expense expense = getExpenseById(id);
			//if(expense!=null) session.remove(expense);
			
			Expense expense = session.get(Expense.class, id);
			if(expense!=null) { 
				session.remove(expense);
				success = true;
			}
			tx.commit();
			
		}catch(Exception e) {
			if (tx != null) tx.rollback();
			e.printStackTrace();
		}
		return success;
	}
	
	public double getMonthlyExpense(User user) {
		double total = 0; 
		try {
			session = factory.openSession();
			tx = session.beginTransaction();
			
			String hql = "SELECT SUM(e.amount) FROM Expense e WHERE e.user = :user AND FUNCTION('LEFT', e.date, 7) = FUNCTION('DATE_FORMAT', CURRENT_DATE, '%Y-%m')";
			Query q = session.createQuery(hql, Double.class);
			q.setParameter("user", user);
			
			total = q.getSingleResult() != null ? (Double)q.getSingleResult() : 0;
			tx.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return total;
	}

}
