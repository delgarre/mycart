
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
    public ApproveOrder getOrderByName(String name){
        ApproveOrder ap = null;
        try {
            String query="from ApproveOrder where name =: n";
            Session session = this.factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("n", name);
            ap =(ApproveOrder) q.uniqueResult();
        } catch (Exception e) {
           e.printStackTrace();
        }
        return ap;
    }

    //get all products of given category
    public List<ApproveOrder> getAllProductsById(int uid)
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from ApproveOrder as a where a.user.id =: id");
        query.setParameter("id", uid);
        List<ApproveOrder> list = query.list();
        return list;
    }
}
