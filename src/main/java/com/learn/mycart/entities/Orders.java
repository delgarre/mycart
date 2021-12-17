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

@Entity
public class Orders implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
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
    
    private String editedBy;
    
    private String editTime;
    
    private String orderId;
    
      @Column(length = 10, name = "address1")
    private String address1;
    
    @Column(length = 10, name = "address2")
    private String address2;
    
    @Column(length = 10, name = "city")
    private String city;
    
    @Column(length = 10, name = "phone")
    private String phone;
    
    @Column(length = 10, name = "postalcode")
    private String postalcode;
    
    @Column(length = 10, name = "state")
    private String state;
    
    @Column(length = 10, name = "fax")
    private String fax;
    
    @ManyToOne(fetch = FetchType.LAZY)
    
    @JoinColumn(name="user_name", referencedColumnName="user_name")
    private User users;

    private String status;
    
    private String department;
    
    @Column(length = 100, name = "first_name")
    private String firstName;
    @Column(length = 100, name = "last_name")
    private String lastName;
    
    private int active;

    public Orders() {
    }

    public Orders(int id, double aPPrice, int quantity, String name, String date, String locations, 
            User users, String status, String itemNumber, String photo, String cTitle, String vTitle
            , String unitOfMeasure, String manufacturer, String manufacturerNum, String alternateItem, String pDesc
            ,String editedBy, String editTime, String orderId, String department, String fax,
            String address1, String address2, String phone, String postalcode, String city, String firstName, String lastName,
                int active) {
        this.id = id;
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
        this.editedBy = editedBy;
        this.editTime = editTime;
        this.orderId = orderId;
        this.department = department;
        this.city = city;
        this.state = state;
        this.address1 = address1;
        this.address2 = address2;
        this.fax = fax;
        this.phone = phone;
        this.postalcode = postalcode;
        this.firstName = firstName;
        this.lastName = lastName;
        this.active = active;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getEditedBy() {
        return editedBy;
    }

    public void setEditedBy(String editedBy) {
        this.editedBy = editedBy;
    }

    public String getEditTime() {
        return editTime;
    }

    public void setEditTime(String editTime) {
        this.editTime = editTime;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
    
    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPostalcode() {
        return postalcode;
    }

    public void setPostalcode(String postalcode) {
        this.postalcode = postalcode;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }
    
     public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }
    
    
    
}
