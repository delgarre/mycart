/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.mail;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author garre
 */
public class ForgotPassword {
    public static void sendMail(String recepient) throws Exception{
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
        
        Message message = prepareMessage(session, myAccountEmail, recepient);
        Transport.send(message);
        System.out.println("Message sent successfully");
    }
        private static Message prepareMessage(Session session, String myAccountEmail, String recepient){
            
        try{
            Message message = new MimeMessage(session);
           
            message.setFrom(new InternetAddress(myAccountEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
            message.setSubject("Password Reset Request");
            
            message.setContent(
                    "<p>"
                   + "Please click the link below or copy and paste it into your browser to reset your password on the ordering portal. \n" +
                    " \n" +
                    "Should you have any issues please call Diane Beckley.  Thank you<br><br>"
                   + "<a href=http://172.20.29.68:8080/mycart/forgot_password.jsp?id="+recepient+">Reset Password <a/>"
                   
                   
                   + "</p>","text/html"
           );
            return message;
        }catch (Exception ex){
            Logger.getLogger(JavaMailUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
