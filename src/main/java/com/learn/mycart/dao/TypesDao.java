/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.dao;

import com.learn.mycart.entities.Types;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author garre
 */
public class TypesDao {
    
    private SessionFactory factory;

    public TypesDao(SessionFactory factory) {
        this.factory = factory;
    }
    
     public List<Types> getTypes(){
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Types ORDER BY locationType");
        List<Types> list = query.list();
        return list;
    }
}
