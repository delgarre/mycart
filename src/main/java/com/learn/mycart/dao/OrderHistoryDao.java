
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
}
