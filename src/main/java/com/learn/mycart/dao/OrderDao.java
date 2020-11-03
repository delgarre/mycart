
package com.learn.mycart.dao;

import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import java.util.List;

public class OrderDao {
    private SessionFactory factory;

    public OrderDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public void addToBatch(){
        Session session = factory.openSession();
 
        Transaction transaction = session.beginTransaction();
    }
}
