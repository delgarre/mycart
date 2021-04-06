/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.dao;

import com.learn.mycart.entities.Manufacturers;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author garre
 */
public class ManDAO {
    
        private SessionFactory factory;

    public ManDAO(SessionFactory factory) {
        this.factory = factory;
    }
    
     public List<Manufacturers> getManufacturers(){
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Manufacturers ORDER BY name");
        List<Manufacturers> list = query.list();
        return list;
    }
}
