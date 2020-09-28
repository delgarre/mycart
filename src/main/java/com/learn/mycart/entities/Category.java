
package com.learn.mycart.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryId;
    private String categoryTitle;
    private String categoryDesc;
    @OneToMany(mappedBy = "category")
    private List<Product> products = new ArrayList<>();
    
    @OneToMany(mappedBy = "category")
    private List<Vendor> vendors = new ArrayList<>();
    
    public Category(){
        
    }

    public Category(int categoryId, String categoryTitle, String categoryDesc) {
        this.categoryId = categoryId;
        this.categoryTitle = categoryTitle;
        this.categoryDesc = categoryDesc;
    }

    public Category(String categoryTitle, String categoryDesc, List<Product> products, List<Vendor> vendors) {
        this.categoryTitle = categoryTitle;
        this.categoryDesc = categoryDesc;
        this.products = products;
        this.vendors = vendors;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryTitle() {
        return categoryTitle;
    }

    public void setCategoryTitle(String categoryTitle) {
        this.categoryTitle = categoryTitle;
    }

    public String getCategoryDesc() {
        return categoryDesc;
    }

    public void setCategoryDesc(String categoryDesc) {
        this.categoryDesc = categoryDesc;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public List<Vendor> getVendor() {
        return vendors;
    }

    public void setVendor(List<Vendor> vendors) {
        this.vendors = vendors;
    }
    
    

    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", categoryTitle=" + categoryTitle + ", categoryDesc=" + categoryDesc + '}';
    }
    
    
}
