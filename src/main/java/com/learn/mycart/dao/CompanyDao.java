
package com.learn.mycart.dao;

import com.learn.mycart.entities.Company;
import com.learn.mycart.entities.User;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;


public class CompanyDao {
    private SessionFactory factory;

    public CompanyDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public List<Company> getCompanies(){
        Session s= this.factory.openSession();
        Query query = s.createQuery("from Company");
        List<Company> list= query.list();
        return list;
    }
    public Company getCompanyById(int cpid)
    {
        Company company = null;
        try {
            
            Session session = this.factory.openSession();
            company = session.get(Company.class, cpid);
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return company;
    }
}
