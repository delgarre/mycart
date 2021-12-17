
package com.learn.mycart.entities;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;


@Entity
public class User implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 10, name = "user_id")
    private int userId;
    @Column(length = 100, name = "user_name")
    private String userName;
    @Column(length = 100, name = "first_name")
    private String firstName;
    @Column(length = 100, name = "last_name")
    private String lastName;
    @Column(length = 100, name = "user_email")
    private String userEmail;
    @Column(length = 100, name = "user_password")
    private String userPassword;
    @Column(length = 12, name = "user_phone")
    private String userPhone;
    @Column(length = 1500, name = "user_pic")
    private String userPic;
    @Column(length = 1500, name = "user_address")
    private String userAddress;
    @Column(name="user_type")
    private String userType;
    @Column(name="locations")
    private String locations;
    @ManyToOne
    private Company companies;
    @OneToMany(mappedBy = "user")
    private List<CompanyUser> cTie = new ArrayList<>();
    
    @OneToMany(mappedBy = "users")
    private List<UserLocation> test = new ArrayList<>();
    
    private String department;
    
    @OneToMany(mappedBy = "users")
    private List<Orders> orders = new ArrayList<>();
    
    @OneToMany(mappedBy = "users")
    private List<Approve> a = new ArrayList<>();
    
    private String status;
   

    public User(int userId, String userName, String userEmail, String userPassword, String userPhone, String userPic, 
            String userAddress, String userType, String locations, List<UserLocation> test, 
            List<Orders> orders, List<Approve> a, String department, String status, String firstName, String lastName) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userPic = userPic;
        this.userAddress = userAddress;
        this.userType = userType;
        this.locations = locations;
        this.test = test;
        this.orders = orders;
        this.a = a;
        this.department = department;
        this.status = status;
        this.firstName = firstName;
        this.lastName = lastName;
       
    }

    public User(String userName, String userEmail, String userPassword, String userPhone, String userPic, String userAddress, 
            String userType, Company companies, String locations, List<UserLocation> test, 
            List<Orders> orders, List<Approve> a) {
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userPic = userPic;
        this.userAddress = userAddress;
        this.userType = userType;
        this.companies = companies;
        this.locations = locations;
        this.test = test;
        this.orders = orders;
        this.a = a;
        
        
    }
    
    public User(){
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserPic() {
        return userPic;
    }

    public void setUserPic(String userPic) {
        this.userPic = userPic;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }
    
      public Company getCompanies() {
        return companies;
    }

    public void setCompanies(Company companies) {
        this.companies = companies;
    }

    public String getLocations() {
        return locations;
    }

    public void setLocations(String locations) {
        this.locations = locations;
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

    public List<Orders> getOrders() {
        return orders;
    }

    public void setOrders(List<Orders> orders) {
        this.orders = orders;
    }

    public List<Approve> getA() {
        return a;
    }

    public void setA(List<Approve> a) {
        this.a = a;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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
    
    
    

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword=" + userPassword + ", userPhone=" + userPhone + ", userPic=" + userPic + ", userAddress=" + userAddress + '}';
    }
    
}
