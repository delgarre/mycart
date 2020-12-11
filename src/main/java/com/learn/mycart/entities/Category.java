
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
public class Category implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryId;
    private String categoryTitle;
    private String categoryDesc;
    @OneToMany(mappedBy = "category")
    private List<Product> products = new ArrayList<>();
    
    @OneToMany(mappedBy = "category")
    private List<Vendor> vendors = new ArrayList<>();
    
    @OneToMany(mappedBy = "category")
    private List<Item> items = new ArrayList<>();
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumns({
    @JoinColumn(name="companyName", referencedColumnName="companyName"),
    @JoinColumn(name="locationType", referencedColumnName="type")
    })
    private Company companies;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumns({
    @JoinColumn(name="location", referencedColumnName="location"),
    @JoinColumn(name="type", referencedColumnName="locationType")
    })
    private LocationType locationType;
    
    public Category(){
        
    }

    public Category(int categoryId, String categoryTitle, String categoryDesc) {
        this.categoryId = categoryId;
        this.categoryTitle = categoryTitle;
        this.categoryDesc = categoryDesc;
    }

    public Category(String categoryTitle, String categoryDesc, List<Product> products, List<Vendor> vendors, List<Item> items, Company companies, LocationType locationType) {
        this.categoryTitle = categoryTitle;
        this.categoryDesc = categoryDesc;
        this.products = products;
        this.vendors = vendors;
        this.items = items;
        this.companies = companies;
        this.locationType = locationType;
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

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public Company getCompanies() {
        return companies;
    }

    public void setCompanies(Company companies) {
        this.companies = companies;
    }

    public LocationType getLocationType() {
        return locationType;
    }

    public void setLocationType(LocationType locationType) {
        this.locationType = locationType;
    }
    
    

    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", categoryTitle=" + categoryTitle + ", categoryDesc=" + categoryDesc + '}';
    }
    
    
}
