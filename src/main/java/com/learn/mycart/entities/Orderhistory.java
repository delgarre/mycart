
package com.learn.mycart.entities;

import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

@Entity
public class Orderhistory {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int orderId;
    
    
    private String userName;
    
    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name="company_order", joinColumns={@JoinColumn(referencedColumnName="orderId")}
                                , inverseJoinColumns={@JoinColumn(referencedColumnName="companyId")})
    
    private Set<Company> companies;
    
    @Column(name="company_name")
    private String companyName;

    public Orderhistory() {
    }
    
    
}
