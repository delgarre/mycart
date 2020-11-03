
package com.learn.mycart.entities;

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
public class Company {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int companyId;
    private String companyName;
    private String type;
    private String typeLocation; 
    @OneToMany(mappedBy = "companies")
    private List<User> user = new ArrayList<>();
    
    

    public Company() {
    }

    public Company(String companyName, String type, String typeLocation, List<User> user) {
        this.companyName = companyName;
        this.type = type;
        this.typeLocation = typeLocation;
        this.user = user;
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

    @Override
    public String toString() {
        return "Company{" + "companyId=" + companyId + ", companyName=" + companyName + ", type=" + type + ", typeLocation=" + typeLocation + '}';
    }
    
    
}
