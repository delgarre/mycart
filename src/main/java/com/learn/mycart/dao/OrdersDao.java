
package com.learn.mycart.dao;

import com.learn.mycart.entities.Orders;
import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.query.Query; 
import org.hibernate.Transaction;
import java.util.List;


public class OrdersDao {
    
    private SessionFactory factory;

    public OrdersDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public List<Orders> getOrders(){
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Orders");
        List<Orders> list = query.list();
        return list;
    }
    
    public Orders getOrdersByName(String name){
        Orders orders = null;
        try {
            String query="from Orders where name =: n";
            Session session = this.factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("n", name);
            orders =(Orders) q.uniqueResult();
        } catch (Exception e) {
           e.printStackTrace();
        }
        return orders;
    }
    public Orders getOrdersByLocation(String location){
        
        Orders orders = null;
            try {
            String query="from Orders where locations =: n and status= 'Not Approved'";
            Session session = this.factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("n", location);
            orders =(Orders) q.uniqueResult();
        } catch (Exception e) {
           e.printStackTrace();
        }
        
        return orders;
        
    }

}
