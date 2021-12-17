
package com.learn.mycart.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class OrderHistory implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
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
    
    private String log;
    
    private String orderId;
    
    private String department;
    
    private int order_table_id;
    
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
    
    @Column(length = 100, name = "first_name")
    private String firstName;
    @Column(length = 100, name = "last_name")
    private String lastName;

    public OrderHistory() {
    }

    public OrderHistory(int id, double aPrice, String cName, int quantity, 
            String date, String locations, String itemNumber, String photo, String cTitle, String vTitle
            , String unitOfMeasure, String manufacturer, String manufacturerNum, String alternateItem, 
            String pDesc, String log,String orderId, String department, String fax,
            String address1, String address2, String phone, String postalcode, String city, String firstName, String lastName,
            int order_table_id) {
        this.id = id;
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
        this.log = log;
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
        this.order_table_id = order_table_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getLog() {
        return log;
    }

    public void setLog(String log) {
        this.log = log;
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

    public int getOrder_table_id() {
        return order_table_id;
    }

    public void setOrder_table_id(int order_table_id) {
        this.order_table_id = order_table_id;
    }
    
    
    
}
