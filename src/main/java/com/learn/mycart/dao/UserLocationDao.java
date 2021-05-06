
package com.learn.mycart.dao;


import com.learn.mycart.entities.Company;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.learn.mycart.entities.UserLocation;

public class UserLocationDao {
    
    private SessionFactory factory;

    public UserLocationDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public List<UserLocation> getAllProductsById(String cname, int uid)
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from UserLocation as t where t.comp.name =: cname and t.user.id =: uid");
        query.setParameter("cname", cname);
        query.setParameter("uid", uid);
        List<UserLocation> list = query.list();
        return list;
    }
    public UserLocation getLocationByName(String name){
        UserLocation test = null;
        try {
            String query="from UserLocation where comp.name =: n";
            Session session = this.factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("n", name);
            test =(UserLocation) q.uniqueResult();
        } catch (Exception e) {
           e.printStackTrace();
        }
        return test;
    }
}
