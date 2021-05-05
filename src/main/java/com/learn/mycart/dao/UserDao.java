package com.learn.mycart.dao;


import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.query.Query; 
import org.hibernate.Transaction;

import com.learn.mycart.entities.User;
import java.util.List;


public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    //get user by email and password
    public User getUserByEmailAndPassword(String email, String password){
        User user = null;
        try {
            String query="from User where userEmail =: e and userPassword =: p";
            Session session = this.factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            user =(User) q.uniqueResult();
            
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return user;
    }
    public List<User> getUsers(){
        Session s= this.factory.openSession();
        Query query = s.createQuery("from User ORDER BY userName");
        List<User> list= query.list();
        return list;
    }
    public User getUserById(int uid)
    {
        User user = null;
        try {
            
            Session session = this.factory.openSession();
            user = session.get(User.class, uid);
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    //get user by name
   
     public List<User> getUserByName(String name){
        Session s= this.factory.openSession();
        Query query = s.createQuery("from User as u where u.userName = : name");
        query.setParameter("name", name);
        List<User> list= query.list();
        return list;
    }
    
    //save user to database
    public int saveCategory(User user)
    {
        Session session = this.factory.openSession();
        Transaction tx= session.beginTransaction();
        int userId = (int)session.save(user);
        tx.commit();
        session.close();
        return userId;
    }
    
    //get all users of given company
    public List<User> getAllUsersById(int cid){
        
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Users as u where u.companies.companyId =: id");
        query.setParameter("id", cid);
        List<User> list = query.list();
        return list;
    }
    
}
