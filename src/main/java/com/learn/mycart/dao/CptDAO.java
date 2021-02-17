/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.dao;

import com.learn.mycart.entities.CPT;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author garre
 */
public class CptDAO {
    
        private SessionFactory factory;

    public CptDAO(SessionFactory factory) {
        this.factory = factory;
    }
    
     public List<CPT> getCodes(){
        Session s = this.factory.openSession();
        Query query = s.createQuery("from CPT");
        List<CPT> list = query.list();
        return list;
    }
}
