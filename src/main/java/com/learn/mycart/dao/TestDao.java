
package com.learn.mycart.dao;


import com.learn.mycart.entities.Company;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.learn.mycart.entities.Test;

public class TestDao {
    
    private SessionFactory factory;

    public TestDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public List<Test> getAllProductsById(String cname, int uid)
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Test as t where t.comp.name =: cname and t.user.id =: uid");
        query.setParameter("cname", cname);
        query.setParameter("uid", uid);
        List<Test> list = query.list();
        return list;
    }
    public Test getLocationByName(String name){
        Test test = null;
        try {
            String query="from Test where comp.name =: n";
            Session session = this.factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("n", name);
            test =(Test) q.uniqueResult();
        } catch (Exception e) {
           e.printStackTrace();
        }
        return test;
    }
}
