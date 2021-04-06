/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.dao;

import com.learn.mycart.entities.UOM;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author garre
 */
public class UOMDao {
    private SessionFactory factory;

    public UOMDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public List<UOM> getMeasurements(){
        Session s = this.factory.openSession();
        Query query = s.createQuery("from UOM ORDER BY val");
        List<UOM> list = query.list();
        return list;
    }
}
