
package com.learn.mycart.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ApproveOrder {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    private String aPName;
    
    private double aPPrice;
    
    private int quantity;
    
    private String name;

    public ApproveOrder() {
    }

    public ApproveOrder(int id, String aPName, double aPPrice, int quantity, String name) {
        this.id = id;
        this.aPName = aPName;
        this.aPPrice = aPPrice;
        this.quantity = quantity;
        this.name = name;
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

    @Override
    public String toString() {
        return "ApproveOrder{" + "id=" + id + ", aPName=" + aPName + ", aPPrice=" + aPPrice + ", quantity=" + quantity + '}';
    }
    
    
}
