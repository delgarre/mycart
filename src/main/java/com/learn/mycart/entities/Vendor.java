
package com.learn.mycart.entities;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Vendor implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int vendorId;
    
    private String vendorName;
    
    @ManyToOne
    private Category category;

    public Vendor() {
    }

    public Vendor(int vendorId, String vendorName) {
        this.vendorId = vendorId;
        this.vendorName = vendorName;
    }

    public Vendor(int vendorId, String vendorName, Category category) {
        this.vendorId = vendorId;
        this.vendorName = vendorName;
        this.category = category;
    }
    
    

    public Vendor(String vendorName) {
        this.vendorName = vendorName;
    }

    public int getVendorId() {
        return vendorId;
    }

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

    public String getVendorName() {
        return vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    
    
}
