
package com.learn.mycart.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class OrderHistory implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    private String aName;
    
    private double aPrice;
    
    private String cName;
    
    private int quantity;
    
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

    public OrderHistory() {
    }

    public OrderHistory(int id, String aName, double aPrice, String cName, int quantity, 
            String date, String locations, String itemNumber, String photo, String cTitle, String vTitle
            , String unitOfMeasure, String manufacturer, String manufacturerNum, String alternateItem, String pDesc) {
        this.id = id;
        this.aName = aName;
        this.aPrice = aPrice;
        this.cName = cName;
        this.quantity = quantity;
        this.date = date;
        this.locations = locations;
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

    public String getaName() {
        return aName;
    }

    public void setaName(String aName) {
        this.aName = aName;
    }

    public double getaPrice() {
        return aPrice;
    }

    public void setaPrice(double aPrice) {
        this.aPrice = aPrice;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
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
