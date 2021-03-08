
package com.learn.mycart.dao;

import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.learn.mycart.entities.Category;
import org.hibernate.query.Query;
import java.util.List;


public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    //save category to database
    public int saveCategory(Category cat)
    {
        Session session = this.factory.openSession();
        Transaction tx= session.beginTransaction();
        int catId = (int)session.save(cat);
        tx.commit();
        session.close();
        return catId;
    }
    public List<Category> getCategories()
    {
        Session s= this.factory.openSession();
        Query query = s.createQuery("from Category ORDER BY categoryTitle");
        List<Category> list= query.list();
        return list;
    }
   
    public Category getCategoryById(int cid)
    {
        Category cat = null;
        try {
            
            Session session = this.factory.openSession();
            cat = session.get(Category.class, cid);
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }
    public int deleteCategory(Category cat)
    {
        Session session = this.factory.openSession();
        Transaction tx= session.beginTransaction();
        int catId = (int)session.save(cat);
        tx.commit();
        session.close();
        return catId;
    }
    public List<Category> getAllItemsByName(String name)
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Category as c where c.companies.companyName =: name");
        query.setParameter("name", name);
        List<Category> list = query.list();
        return list;
    }
     public Category getName(String name)
    {
        Category cat = null;
        try {
            
            Session session = this.factory.openSession();
            cat = session.get(Category.class, name);
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }

}
