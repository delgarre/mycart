/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;

@Entity
public class Orders implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    private String aPName;
    
    private double aPPrice;
    
    private int quantity;
    
    private String name;
    
    private Date date;
    
    private String locations;
    
    private String itemNumber;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumns({
    @JoinColumn(name="user_id", referencedColumnName="user_id"),
    @JoinColumn(name="user_name", referencedColumnName="user_name")
    })
    private User users;

    private String status;

    public Orders() {
    }

    public Orders(int id, String aPName, double aPPrice, int quantity, String name, Date date, String locations, User users, String status, String itemNumber) {
        this.id = id;
        this.aPName = aPName;
        this.aPPrice = aPPrice;
        this.quantity = quantity;
        this.name = name;
        this.date = date;
        this.locations = locations;
        this.users = users;
        this.status = status;
        this.itemNumber = itemNumber;
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

    public User getUsers() {
        return users;
    }

    public void setUsers(User users) {
        this.users = users;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getItemNumber() {
        return itemNumber;
    }

    public void setItemNumber(String itemNumber) {
        this.itemNumber = itemNumber;
    }
    
    
}
