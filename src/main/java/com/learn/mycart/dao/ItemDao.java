/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.dao;

import com.learn.mycart.entities.Item;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author garre
 */
public class ItemDao {
    private SessionFactory factory;

    public ItemDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    
    public List<Item> pagination(){
    Session s = this.factory.openSession();
    Query query = s.createQuery("From Item");
    query.setFirstResult(0);
    query.setMaxResults(10);
    List<Item> list = list = query.list();
    return list;
}
    
    public List<Item> getItems(){
    Session s = this.factory.openSession();
    Query query = s.createQuery("From Item");
    
    List<Item> list = list = query.list();
    return list;
}
    
    public List<Item> getAllItemsByName(String name)
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Item as i inner join  location as LT on LT.locationType = i.locationType where LT.location =: name");
        query.setParameter("name", name);
        List<Item> list = query.list();
        return list;
    }
    
    public List<Item> getAllItemsById(int cid)
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Item as i where i.category.categoryId =: id");
        query.setParameter("id", cid);
        List<Item> list = query.list();
        return list;
    }
    public List<Item> getAllItemsByIdandName(int cid, String name)
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Item as i where i.category.categoryId =: id and i.location.location =: name");
        query.setParameter("id", cid);
        query.setParameter("name", name);
        List<Item> list = query.list();
        return list;
    }
}
