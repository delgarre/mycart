
package com.learn.mycart.entities;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;

@Entity
public class UserLocation implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @ManyToOne
    @JoinColumn(name="comp_name", referencedColumnName="companyName")
    private Company companies;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumns({
    @JoinColumn(name="user_id", referencedColumnName="user_id"),
    @JoinColumn(name="user_name", referencedColumnName="user_name")
    })
    private User users;
    
    private String type;

    public UserLocation() {
    }

    public UserLocation(int id, Company companies, User users, String type) {
        this.id = id;
        this.companies = companies;
        this.users = users;
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Company getCompanies() {
        return companies;
    }

    public void setCompanies(Company companies) {
        this.companies = companies;
    }

    public User getUsers() {
        return users;
    }

    public void setUsers(User users) {
        this.users = users;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    
}
