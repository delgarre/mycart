
package com.learn.mycart.dao;

import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.query.Query; 
import org.hibernate.Transaction;

import com.learn.mycart.entities.ApproveOrder;
import java.util.List;

public class ApproveOrderDao {
    private SessionFactory factory;

    public ApproveOrderDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public List<ApproveOrder> getOrders(){
        Session s = this.factory.openSession();
        Query query = s.createQuery("from ApproveOrder");
        List<ApproveOrder> list = query.list();
        return list;
    }
}
