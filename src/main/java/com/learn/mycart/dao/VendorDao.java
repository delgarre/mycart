
package com.learn.mycart.dao;

import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.learn.mycart.entities.Vendor;
import org.hibernate.query.Query;
import java.util.List;

public class VendorDao {
    
    private SessionFactory factory;

    public VendorDao(SessionFactory factory) {
        this.factory = factory;
    }
    
     public int saveVendor(Vendor ven)
    {
        Session session = this.factory.openSession();
        Transaction tx= session.beginTransaction();
        int vendorId = (int)session.save(ven);
        tx.commit();
        session.close();
        return vendorId;
    }
    public List<Vendor> getVendors()
    {
        Session s= this.factory.openSession();
        Query query = s.createQuery("from Vendor");
        List<Vendor> list= query.list();
        return list;
    }
   
    public Vendor getVendorById(int vid)
    {
        Vendor ven = null;
        try {
            
            Session session = this.factory.openSession();
            ven = session.get(Vendor.class, vid);
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ven;
    }
    public int deleteVendor(Vendor ven)
    {
        Session session = this.factory.openSession();
        Transaction tx= session.beginTransaction();
        int vendorId = (int)session.save(ven);
        tx.commit();
        session.close();
        return vendorId;
    }
    public Vendor getVendorByNmae(String name)
    {
        Vendor ven = null;
        try {
            
            Session session = this.factory.openSession();
            ven = session.get(Vendor.class, name);
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ven;
    }

}
