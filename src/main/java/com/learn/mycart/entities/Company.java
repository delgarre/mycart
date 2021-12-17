
package com.learn.mycart.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import javax.persistence.OneToMany;

@Entity
public class Company implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int companyId;
    private String companyName;
    private String type;
    private String status;
    private String companyCode;
    @OneToMany(mappedBy = "companies")
    private List<User> user = new ArrayList<>();
   
    @OneToMany(mappedBy = "companies")
    private List<CompanyUser> cTie = new ArrayList<>();
    
    @OneToMany(mappedBy = "companies")
    private List<UserLocation> test = new ArrayList<>();
    
    private String address1;
    
    private String address2;
    
    private String city;
    
    private String states;
    
    private String zip;
    
    private String phone;
    
    private String account_id;
    
    private String postal_code;
    
    private String province_code;
    
    private String country_code;

    public Company() {
    }

    public Company(String companyName, String type, List<User> user, List<UserLocation> test, String status
                ,String companyCode, String address1, String address2, String city, 
                String states, String zip, String phone, String account_id, String postal_code,
                String province_code, String country_code) {
        this.companyName = companyName;
        this.type = type;
        this.user = user;
        this.test = test;
        this.status = status;
        this.companyCode = companyCode;
        this.address1 = address1;
        this.address2 = address2;
        this.city = city;
        this.states = states;
        this.zip = zip;
        this.phone = phone;
        this.account_id = account_id;
        this.postal_code = postal_code;
        this.province_code = province_code;
        this.country_code = country_code;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    public List<User> getUser(){
        return user;
    }
    
    public void setUser(List<User> user){
        this.user = user;
    }

    public List<CompanyUser> getcTie() {
        return cTie;
    }

    public void setcTie(List<CompanyUser> cTie) {
        this.cTie = cTie;
    }

    public List<UserLocation> getTest() {
        return test;
    }

    public void setTest(List<UserLocation> test) {
        this.test = test;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCompanyCode() {
        return companyCode;
    }

    public void setCompanyCode(String companyCode) {
        this.companyCode = companyCode;
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

    public String getStates() {
        return states;
    }

    public void setStates(String states) {
        this.states = states;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAccount_id() {
        return account_id;
    }

    public void setAccount_id(String account_id) {
        this.account_id = account_id;
    }

    public String getPostal_code() {
        return postal_code;
    }

    public void setPostal_code(String postal_code) {
        this.postal_code = postal_code;
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
    
    

    @Override
    public String toString() {
        return "Company{" + "companyId=" + companyId + ", companyName=" + companyName + ", type=" + type + '}';
    }
    
    
}
