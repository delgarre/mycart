
package com.learn.mycart.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import javax.persistence.OneToMany;

@Entity
public class Company implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int companyId;
    private String companyName;
    private String type;
    private String typeLocation; 
    @OneToMany(mappedBy = "companies")
    private List<User> user = new ArrayList<>();
   
    @OneToMany(mappedBy = "companies")
    private List<CompanyUser> cTie = new ArrayList<>();
    
    @OneToMany(mappedBy = "companies")
    private List<Test> test = new ArrayList<>();
    
    
    
    @OneToMany(mappedBy = "companies")
    private List<Category> category = new ArrayList<>();
    
    @OneToMany(mappedBy = "companies")
    private List<Product> products = new ArrayList<>();
    



    public Company() {
    }

    public Company(String companyName, String type, String typeLocation, List<User> user, List<Test> test, List<Category> catgeory, List<Product> products) {
        this.companyName = companyName;
        this.type = type;
        this.typeLocation = typeLocation;
        this.user = user;
        this.test = test;
        
        this.category = catgeory;
        this.products = products;
        
        
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTypeLocation() {
        return typeLocation;
    }

    public void setTypeLocation(String typeLocation) {
        this.typeLocation = typeLocation;
    }
    
    public List<User> getUser(){
        return user;
    }
    
    public void setUser(List<User> user){
        this.user = user;
    }

    public List<CompanyUser> getcTie() {
        return cTie;
    }

    public void setcTie(List<CompanyUser> cTie) {
        this.cTie = cTie;
    }

    public List<Test> getTest() {
        return test;
    }

    public void setTest(List<Test> test) {
        this.test = test;
    }

    public List<Category> getCategory() {
        return category;
    }

    public void setCategory(List<Category> category) {
        this.category = category;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }


    
    

    @Override
    public String toString() {
        return "Company{" + "companyId=" + companyId + ", companyName=" + companyName + ", type=" + type + ", typeLocation=" + typeLocation + '}';
    }
    
    
}
