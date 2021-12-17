/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.entities;

import java.io.Serializable;
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
public class VendorReport implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 10, name = "id")
    private int id;
    
    @Column(length = 10, name = "report_id")
    private int report_id;
    
    @Column(length = 100, name = "account_id")
    private String account_id;
    
    @Column(length = 100, name = "shipping_method")
    private String shipping_method;
    
    
    private String order_line_id;
    
    
    private String quantity;
    
   
    private String sku;
    
    
    private String operations_confirm_order;
    
    private String operations_email_confirmation;
    
    
    @Column(length = 10, name = "first_name")
    private String first_name;
    
    @Column(length = 10, name = "last_name")
    private String last_name;
    
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
    
    @Column(length = 10, name = "province_code")
    private String province_code;
    
    
    @Column(length = 10, name = "country_code")
    private String country_code;

    public VendorReport() {
    }

    public VendorReport(int id, String account_id, String shipping_method, String order_line_id, String quantity, String sku, String operations_confirm_order, 
            String operations_email_confirmation, String first_name, 
            String last_name, String address1, String address2, String city, String phone, String postalcode, String province_code, String country_code,
            int report_id) {
        this.id = id;
        this.account_id = account_id;
        this.shipping_method = shipping_method;
        this.order_line_id = order_line_id;
        this.quantity = quantity;
        this.sku = sku;
        this.operations_confirm_order = operations_confirm_order;
        this.operations_email_confirmation = operations_email_confirmation;
        this.first_name = first_name;
        this.last_name = last_name;
        this.address1 = address1;
        this.address2 = address2;
        this.city = city;
        this.phone = phone;
        this.postalcode = postalcode;
        this.province_code = province_code;
        this.country_code = country_code;
        this.report_id = report_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccount_id() {
        return account_id;
    }

    public void setAccount_id(String account_id) {
        this.account_id = account_id;
    }

    public String getShipping_method() {
        return shipping_method;
    }

    public void setShipping_method(String shipping_method) {
        this.shipping_method = shipping_method;
    }

    public String getOrder_line_id() {
        return order_line_id;
    }

    public void setOrder_line_id(String order_line_id) {
        this.order_line_id = order_line_id;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getOperations_confirm_order() {
        return operations_confirm_order;
    }

    public void setOperations_confirm_order(String operations_confirm_order) {
        this.operations_confirm_order = operations_confirm_order;
    }

    public String getOperations_email_confirmation() {
        return operations_email_confirmation;
    }

    public void setOperations_email_confirmation(String operations_email_confirmation) {
        this.operations_email_confirmation = operations_email_confirmation;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
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

    public String getProvince_code() {
        return province_code;
    }

    public void setProvince_code(String province_code) {
        this.province_code = province_code;
    }

    public String getCountry_code() {
        return country_code;
    }

    public void setCountry_code(String country_code) {
        this.country_code = country_code;
    }

    public int getReport_id() {
        return report_id;
    }

    public void setReport_id(int report_id) {
        this.report_id = report_id;
    }
    
    
    
}
