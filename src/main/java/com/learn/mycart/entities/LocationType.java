
package com.learn.mycart.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class LocationType implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    private String location;
    
    private String locationType;
    


    public LocationType() {
    }
    
    
    

    public LocationType(int id, String location, String locationType) {
        this.id = id;
        this.location = location;
        this.locationType = locationType;
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getLocationType() {
        return locationType;
    }

    public void setLocationType(String locationType) {
        this.locationType = locationType;
    }



    
    
    @Override
    public String toString() {
        return "LocationType{" + "id=" + id + ", location=" + location + ", locationType=" + locationType + '}';
    }

    
    
    
}
