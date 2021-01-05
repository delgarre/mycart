
package com.learn.mycart.dao;

import com.learn.mycart.entities.OrderHistory;
import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.query.Query; 
import org.hibernate.Transaction;
import java.util.List;

public class OrderHistoryDao {
    
    private SessionFactory factory;

    public OrderHistoryDao(SessionFactory factory) {
        this.factory = factory;
    }

    public List<OrderHistory> getOrders(){
        Session s = this.factory.openSession();
        Query query = s.createQuery("from OrderHistory");
        List<OrderHistory> list = query.list();
        return list;
    }
    public OrderHistory getOrdersByName(String name){
        OrderHistory orders = null;
        try {
            String query="from OrderHistory where name =: n";
            Session session = this.factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("n", name);
            orders =(OrderHistory) q.uniqueResult();
        } catch (Exception e) {
           e.printStackTrace();
        }
        return orders;
    }
}
