
package com.learn.mycart.entities;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Product {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int pId;
    private String pName;
    @Column(length = 3000)
    private String pDesc;
    private String pPhoto;
    private double pPrice;
    private int pDiscount;
    private int pQuanity;
    private String unitOfMeasure;
    private String cpt;
    private String ndc;
    private String itemNumber;
    private String manufacturer;
    private String manufacturerNum;
    
    
    @ManyToOne 
    @JoinColumn(name="vendorName")
    private Vendor vendor;
    @ManyToOne
    private Category category;

    public Product() {
    }

    public Product(String pName, String pDesc, String pPhoto, double pPrice, int pDiscount, int pQuanity, Category categoty, String unitOfMeasure, Vendor vendor, String cpt, String ndc, String itemNumber, String manufacturer, String manufacturerNum /*byte[] pPic*/) {
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuanity = pQuanity;
        this.category = category;
        this.vendor = vendor;
        this.unitOfMeasure = unitOfMeasure;
        this.cpt = cpt;
        this.ndc = ndc;
        this.itemNumber = itemNumber;
        this.manufacturer = manufacturer;
        this.manufacturerNum = manufacturerNum;
        //this.pPic = pPic;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDesc() {
        return pDesc;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public String getpPhoto() {
        return pPhoto;
    }

    public void setpPhoto(String pPhoto) {
        this.pPhoto = pPhoto;
    }

    public double getpPrice() {
        return pPrice;
    }

    public void setpPrice(double pPrice) {
        this.pPrice = pPrice;
    }

    public int getpDiscount() {
        return pDiscount;
    }

    public void setpDiscount(int pDiscount) {
        this.pDiscount = pDiscount;
    }

    public int getpQuanity() {
        return pQuanity;
    }

    public void setpQuanity(int pQuanity) {
        this.pQuanity = pQuanity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getUnitOfMeasure() {
        return unitOfMeasure;
    }

    public void setUnitOfMeasure(String unitOfMeasure) {
        this.unitOfMeasure = unitOfMeasure;
    }

    public Vendor getVendor() {
        return vendor;
    }

    public void setVendor(Vendor vendor) {
        this.vendor = vendor;
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

   
    
    
    @Override
    public String toString() {
        return "Product{" + "pId=" + pId + ", pName=" + pName + ", pDesc=" + pDesc + ", pPhoto=" + pPhoto + ", pPrice=" + pPrice + ", pDiscount=" + pDiscount + ", pQuanity=" + pQuanity + '}';
    }
    
    
    
}
