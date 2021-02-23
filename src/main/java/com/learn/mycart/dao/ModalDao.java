/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.dao;

import com.learn.mycart.entities.Item;
import com.learn.mycart.entities.Modal;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author garre
 */
public class ModalDao {
    
    private SessionFactory factory;

    public ModalDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public List<Modal> getAllItemsByName(String name)
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Modal as m where i.name =: nam");
        query.setParameter("nam", name);
        List<Modal> list = query.list();
        return list;
    }
    
        public List<Modal> getItems(){
    Session s = this.factory.openSession();
    Query query = s.createQuery("From Modal");
    
    List<Modal> list = list = query.list();
    return list;
}
    
}
