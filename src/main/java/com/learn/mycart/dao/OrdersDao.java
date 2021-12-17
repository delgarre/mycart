
package com.learn.mycart.dao;

import com.learn.mycart.entities.Orders;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.query.Query; 
import org.hibernate.Transaction;
import java.util.List;


public class OrdersDao {
    
    private SessionFactory factory;

    public OrdersDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public List<Orders> getOrders(){
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Orders");
        List<Orders> list = query.list();
        return list;
    }
    
    public Orders getOrdersByName(String name){
        Orders orders = null;
        try {
            String query="from Orders where name =: n";
            Session session = this.factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("n", name);
            orders =(Orders) q.uniqueResult();
        } catch (Exception e) {
           e.printStackTrace();
        }
        return orders;
    }
    public Orders getOrdersByLocation(String location){
        
        Orders orders = null;
            try {
            String query="from Orders where locations =: n and status= 'Not Approved'";
            Session session = this.factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("n", location);
            orders =(Orders) q.uniqueResult();
        } catch (Exception e) {
           e.printStackTrace();
        }
        
        return orders;
        
    }

    public static void updateStatus(String location){
try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate("UPDATE Orders SET status = 'approved' WHERE locations = '"+location+"'");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
    }

}
