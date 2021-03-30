/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.entities;

import java.io.Serializable;
import java.sql.Blob;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


/**
 *
 * @author garre
 */
@Entity
public class Item implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
  
    private String price;
    private String photo;
    private String quantity;
    private String unitOfMeasure;
    private String cpt;
    private String ndc;
    private String itemNumber;
    private String manufacturer;
    private String manufacturerNum;
    private String alternateItem;
    @Column(length = 3000)
    private String pDesc;
    private String stat;
    private String cTitle;
    private String vTitle;
    private String discontinued;
    private String sds;
    
    private String locationType;
    private Blob image;
    private String notes;
    


    public Item() {
    }

    public Item(int id,  String price, String photo, String quantity, String unitOfMeasure, String cpt, String ndc, String manufacturer, String manufacturerNum, 
            String itemNumber, String alternateItem, String stat, 
            String cTitle, String vTitle, String locationType,String discontinued, String sds, 
            String pDesc, Blob image, String notes) {
        this.id = id;
        
        this.price = price;
        this.photo = photo;
        this.quantity = quantity;
        this.unitOfMeasure = unitOfMeasure;
        this.cpt = cpt;
        this.ndc = ndc;
        this.itemNumber = itemNumber;
        this.alternateItem = this.alternateItem;
        this.manufacturer = manufacturer;
        this.pDesc = pDesc;
        this.manufacturerNum = manufacturerNum;
        this.stat = stat;
        this.cTitle = cTitle;
        this.vTitle = vTitle;
        this.locationType = locationType;
        this.discontinued = discontinued;
        this.sds = sds;
        this.image = image;
        this.notes = notes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getUnitOfMeasure() {
        return unitOfMeasure;
    }

    public void setUnitOfMeasure(String unitOfMeasure) {
        this.unitOfMeasure = unitOfMeasure;
    }

    public String getCpt() {
        return cpt;
    }

    public void setCpt(String cpt) {
        this.cpt = cpt;
    }

    public String getNdc() {
        return ndc;
    }

    public void setNdc(String ndc) {
        this.ndc = ndc;
    }

    public String getItemNumber() {
        return itemNumber;
    }

    public void setItemNumber(String itemNumber) {
        this.itemNumber = itemNumber;
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

    public String getStat() {
        return stat;
    }

    public void setStat(String stat) {
        this.stat = stat;
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

    public String getLocationType() {
        return locationType;
    }

    public void setLocationType(String locationType) {
        this.locationType = locationType;
    }

    public String getDiscontinued() {
        return discontinued;
    }

    public void setDiscontinued(String discontinued) {
        this.discontinued = discontinued;
    }

    public String getSds() {
        return sds;
    }

    public void setSds(String sds) {
        this.sds = sds;
    }

    public Blob getImage() {
        return image;
    }

    public void setImage(Blob image) {
        this.image = image;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    
    
    
    @Override
    public String toString() {
        return "Item{" + "id=" + id + ",  price=" + price + ", photo=" + photo + ", quantity=" + quantity + '}';
    }
    
    
    
}
