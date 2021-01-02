
package com.learn.mycart.dao;

import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.LocationType;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;



public class LocationTypeDao {
    
    private SessionFactory factory;

    public LocationTypeDao(SessionFactory factory) {
        this.factory = factory;
    }

    public LocationType getByLocation(String location){
        LocationType locationType = null;
        try {
            String query="from LocationType where location =: l";
            Session session = this.factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("l", location);
            locationType =(LocationType) q.uniqueResult();
        } catch (Exception e) {
           e.printStackTrace();
        }
        return locationType;
    }
    public LocationType getLocationTypeByName(String name)
    {
        LocationType lot = null;
        try {
            
            Session session = this.factory.openSession();
            lot = session.get(LocationType.class, name);
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lot;
    }
    public List<LocationType> LocationTypes()
    {
        Session s= this.factory.openSession();
        Query query = s.createQuery("from LocationType");
        List<LocationType> list= query.list();
        return list;
    }
}
