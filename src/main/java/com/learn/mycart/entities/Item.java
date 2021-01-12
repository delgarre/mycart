/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;

/**
 *
 * @author garre
 */
@Entity
public class Item implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
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
    
    @ManyToOne
    @JoinColumn(name="categoryTitle", referencedColumnName="categoryTitle")
    private Category category;
    

    private String location;
    
    private String locationType;
    
    @ManyToOne
    @JoinColumn(name="vendorName", referencedColumnName="vendorName")
    private Vendor vendors;

    public Item() {
    }

    public Item(int id, String name, String price, String photo, String quantity, Category category, String location, Vendor vendors, String unitOfMeasure, String cpt, String ndc, String manufacturer, String manufacturerNum, String itemNumber, String alternateItem, String stat, String cTitle, String vTitle, String locationType) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.photo = photo;
        this.quantity = quantity;
        this.category = category;
        this.location = location;
        this.vendors = vendors;
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
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Vendor getVendors() {
        return vendors;
    }

    public void setVendors(Vendor vendors) {
        this.vendors = vendors;
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

    
    
    
    @Override
    public String toString() {
        return "Item{" + "id=" + id + ", name=" + name + ", price=" + price + ", photo=" + photo + ", quantity=" + quantity + '}';
    }
    
    
    
}
