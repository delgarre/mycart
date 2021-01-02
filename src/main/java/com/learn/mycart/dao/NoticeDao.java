
package com.learn.mycart.dao;


import com.learn.mycart.entities.Notice;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class NoticeDao {
    
    private SessionFactory factory;

    public NoticeDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public List<Notice> getMessage(){
        Session s= this.factory.openSession();
        Query query = s.createQuery("from Notice");
        List<Notice> list= query.list();
        return list;
    }
    public List<Notice> getStatus(){
        Session s= this.factory.openSession();
        Query query = s.createQuery("from Notice where status = 'active'");
        List<Notice> list= query.list();
        return list;
    }
    
}
