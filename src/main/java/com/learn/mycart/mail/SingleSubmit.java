
package com.learn.mycart.mail;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class SingleSubmit {
    public static void sendMail(String recepient, int id) throws Exception{
        System.out.println("Preparing to send email");
        Properties properties = new Properties();
        
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "east.EXCH092.serverdata.net");
        properties.put("mail.smtp.port", "587");
        
        
        final String myAccountEmail = "ordering.portal@dseincorporated.com";
        final String myAccountPassword = "Rackspace123!!";
       
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(myAccountEmail, myAccountPassword);
            }
        });
        
        Message message = prepareMessage(session, myAccountEmail, recepient, id);
        Transport.send(message);
        System.out.println("Message sent successfully");
    }
        private static Message prepareMessage(Session session, String myAccountEmail, String recepient,
               int id){
            
        try{
            
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://172.20.29.70:3306/";
String database = "mycart";
String userid = "admin";
String password = "ordering";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;


connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="Select * from Orders where id = "+id;

resultSet = statement.executeQuery(sql);
String location = resultSet.getString("locations");
            
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myAccountEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
            message.setSubject("Submitted For Approval");
            message.setText("Order for "+location+" submitted for approval!");
            return message;
        }catch (Exception ex){
            Logger.getLogger(JavaMailUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
