package com.learn.mycart.dao;


import com.learn.mycart.entities.L_Company;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author garre
 */
public class L_CompanyDao {
    
    private SessionFactory factory;

    public L_CompanyDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public List<L_Company> getCompanies(){
        Session s= this.factory.openSession();
        Query query = s.createQuery("from L_Company ORDER BY company");
        List<L_Company> list= query.list();
        return list;
    }
}
