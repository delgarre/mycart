
package com.learn.mycart.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Vendor implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int vendorId;
    
    private String vendorName;
    
    @OneToMany(mappedBy = "vendor")
    private List<Product> products = new ArrayList<>();
    
    @OneToMany(mappedBy = "vendors")
    private List<Item> item = new ArrayList<>();
    
    @ManyToOne
    private Category category;

    public Vendor() {
    }

    public Vendor(int vendorId, String vendorName) {
        this.vendorId = vendorId;
        this.vendorName = vendorName;
    }

    public Vendor(int vendorId, String vendorName, Category category, List<Product> products, List<Item> item) {
        this.vendorId = vendorId;
        this.vendorName = vendorName;
        this.category = category;
        this.products = products;
        this.item = item;
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

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public List<Item> getItem() {
        return item;
    }

    public void setItem(List<Item> item) {
        this.item = item;
    }
    
    
    
}
