/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.entities;

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
public class Item {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private String price;
    private String photo;
    private String quantity;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumns({
    @JoinColumn(name="categoryId", referencedColumnName="categoryId"),
    @JoinColumn(name="categoryTitle", referencedColumnName="categoryTitle")
    })
    private Category category;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumns({
    @JoinColumn(name="location", referencedColumnName="location"),
    @JoinColumn(name="locationType", referencedColumnName="locationType")
    })
    private LocationType location;

    public Item() {
    }

    public Item(int id, String name, String price, String photo, String quantity, Category category, LocationType location) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.photo = photo;
        this.quantity = quantity;
        this.category = category;
        this.location = location;
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

    public LocationType getLocation() {
        return location;
    }

    public void setLocation(LocationType location) {
        this.location = location;
    }

    

    
    
    @Override
    public String toString() {
        return "Item{" + "id=" + id + ", name=" + name + ", price=" + price + ", photo=" + photo + ", quantity=" + quantity + '}';
    }
    
    
    
}
