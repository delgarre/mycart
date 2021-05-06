/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.entities;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author garre
 */

@Entity
public class SubmitDate {
    
     @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
     
    private String submitDate;

    public SubmitDate() {
    }

    public SubmitDate(int id, String submitDate) {
        this.id = id;
        this.submitDate = submitDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSubmitDate() {
        return submitDate;
    }

    public void setSubmitDate(String submitDate) {
        this.submitDate = submitDate;
    }
    
    
}
