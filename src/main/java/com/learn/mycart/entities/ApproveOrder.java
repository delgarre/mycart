
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
    
    private int aPPrice;
    
    private int quantity;

    public ApproveOrder() {
    }

    public ApproveOrder(int id, String aPName, int aPPrice, int quantity) {
        this.id = id;
        this.aPName = aPName;
        this.aPPrice = aPPrice;
        this.quantity = quantity;
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

    public int getaPPrice() {
        return aPPrice;
    }

    public void setaPPrice(int aPPrice) {
        this.aPPrice = aPPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "ApproveOrder{" + "id=" + id + ", aPName=" + aPName + ", aPPrice=" + aPPrice + ", quantity=" + quantity + '}';
    }
    
    
}
