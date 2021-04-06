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
    
    private String date;
    
    private String locations;
    
    private String itemNumber;
    
    private String photo;
    
    private String manufacturer;
    
    private String manufacturerNum;
    
    private String alternateItem;
    
    private String pDesc;
    
    private String cTitle;
    
    private String vTitle;
    
    private String unitOfMeasure;
    
    
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumns({
    @JoinColumn(name="user_id", referencedColumnName="user_id"),
    @JoinColumn(name="user_name", referencedColumnName="user_name")
    })
    private User users;

    private String status;

    public Orders() {
    }

    public Orders(int id, String aPName, double aPPrice, int quantity, String name, String date, String locations, 
            User users, String status, String itemNumber, String photo, String cTitle, String vTitle
            , String unitOfMeasure, String manufacturer, String manufacturerNum, String alternateItem, String pDesc) {
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
        this.photo = photo;
        this.cTitle = cTitle;
        this.vTitle = vTitle;
        this.unitOfMeasure = unitOfMeasure;
        this.manufacturer = manufacturer;
        this.manufacturerNum = manufacturerNum;
        this.alternateItem = alternateItem;
        this.pDesc = pDesc;
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
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

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getManufacturerNum() {
        return manufacturerNum;
    }

    public void setManufacturerNum(String manufacturerNum) {
        this.manufacturerNum = manufacturerNum;
    }

    public String getAlternateItem() {
        return alternateItem;
    }

    public void setAlternateItem(String alternateItem) {
        this.alternateItem = alternateItem;
    }

    public String getpDesc() {
        return pDesc;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public String getcTitle() {
        return cTitle;
    }

    public void setcTitle(String cTitle) {
        this.cTitle = cTitle;
    }

    public String getvTitle() {
        return vTitle;
    }

    public void setvTitle(String vTitle) {
        this.vTitle = vTitle;
    }

    public String getUnitOfMeasure() {
        return unitOfMeasure;
    }

    public void setUnitOfMeasure(String unitOfMeasure) {
        this.unitOfMeasure = unitOfMeasure;
    }
    
    
}
