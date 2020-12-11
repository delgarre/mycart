
package com.learn.mycart.dao;

import com.learn.mycart.entities.LocationType;
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
}
