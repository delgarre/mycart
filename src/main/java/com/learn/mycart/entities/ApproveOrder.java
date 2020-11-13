
package com.learn.mycart.entities;

import java.time.LocalDateTime;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class ApproveOrder {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    private String aPName;
    
    private double aPPrice;
    
    private int quantity;
    
    private String name;
    
    private Date date;
    
    private String locations;

    public ApproveOrder() {
    }

    public ApproveOrder(int id, String aPName, double aPPrice, int quantity, String name, Date date, String locations) {
        this.id = id;
        this.aPName = aPName;
        this.aPPrice = aPPrice;
        this.quantity = quantity;
        this.name = name;
        this.date = date;
        this.locations = locations;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getaPName() {
        return aPName;
    }

    public void setaPName(String aPName) {
        this.aPName = aPName;
    }

    public double getaPPrice() {
        return aPPrice;
    }

    public void setaPPrice(double aPPrice) {
        this.aPPrice = aPPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getLocations() {
        return locations;
    }

    public void setLocations(String locations) {
        this.locations = locations;
    }
    
    

    @Override
    public String toString() {
        return "ApproveOrder{" + "id=" + id + ", aPName=" + aPName + ", aPPrice=" + aPPrice + ", quantity=" + quantity + '}';
    }
    
    
}
