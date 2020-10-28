/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.uploadcontroller;

/**
 *
 * @author garre
 */
public class Info {
    
    public String id;
    public String name;
    public String photo;

    public Info() {
    }

    public Info(String id, String name, String photo) {
        this.id = id;
        this.name = name;
        this.photo = photo;
    }
    
    
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
    
    
}
