/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


/**
 *
 * @author Delenis Garrett
 */
@MultipartConfig
public class AddItemServlet extends HttpServlet {

  
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            String op = request.getParameter("operation");

            {
            
                
                String pDesc = request.getParameter("pDesc");
                String price = request.getParameter("pPrice");
                
                String quantity = request.getParameter("pQuantity");
                String unitOfMeasure = request.getParameter("pMeasure");
                String catId = request.getParameter("catId");
                String vendor = request.getParameter("vendorId");
                String cpt = request.getParameter("cpt");
                String ndc = request.getParameter("ndc");
                String itemNumber = request.getParameter("itemNumber");
                String manufacturer = request.getParameter("manufacturer");
                String manufacturerNum = request.getParameter("manufacturerNum");
                Part part = request.getPart("file");
                String fileName = part.getSubmittedFileName();
                String alt = "";
                String contactInfo = request.getParameter("contactInfo");
                String notes = request.getParameter("notes");
                if(notes.equals("null")){
                  
                    notes = "No notes available";
                }else{
                    notes = request.getParameter("notes");
                }
                
                Date now = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss.SSS");
                String createDate = sdf.format(now);
                
                String stat = "1";
                
                String chooselocations="";
                Part parts = request.getPart("sds");
                String sds = parts.getSubmittedFileName();
                String location[]=request.getParameterValues("location");
                for(int i=0;i < location.length; i++){
                chooselocations += location[i] + ","; 
                }
                String alts[]=request.getParameterValues("new");
                if(alts == null){
                    
                    alt = "N/A";
                }else{
                for(int s=0;s < alts.length; s++){
                alt += alts[s] + ","; 
                } 
                }
                String query ="insert into Item(price, quantity, locationType, cpt, itemNumber, manufacturer, manufacturerNum, ndc,pDesc , unitOfMeasure, cTitle, vTitle, stat, alternateItem, sds, photo, notes, createDate, contactInfo)values('"+price+"','"+quantity+"','"+chooselocations+"', upper('"+cpt+"'), upper('"+itemNumber+"'), upper('"+manufacturer+"'), upper('"+manufacturerNum+"'), '"+ndc+"', upper('"+pDesc+"'), '"+unitOfMeasure+"','"+catId+"', '"+vendor+"','"+stat+"',upper('"+alt+"'),'"+sds+"','"+fileName+"', upper('"+notes+"'), '"+createDate+"', '"+contactInfo+"')";

                try
                {

                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
                Statement st=conn.createStatement();
                HttpSession httpSession = request.getSession();
                String strQuery = "SELECT COUNT(*) FROM Item where itemNumber='"+itemNumber+"'";
                ResultSet rs = st.executeQuery(strQuery);
                rs.next();
                String Countrow = rs.getString(1);
                out.println(Countrow);

                if(Countrow.equals("0")){
    
                int s=st.executeUpdate(query);
                

                    System.out.println(query);
                httpSession.setAttribute("message","Item added successfully... ");
                response.sendRedirect("replace_space.jsp?itemNumber="+itemNumber);
                httpSession.setAttribute("number", itemNumber);
                }
            else{
                    response.sendRedirect("add_item_page.jsp");
                    httpSession.setAttribute("message", "Item already exist!");
                    System.out.println(query);
                }
                }
                catch(Exception e)
                {
                out.print(e);
                e.printStackTrace();
                System.out.println(query);
                }
}
                
                
                
                
                
               
              
              


      
          
                return;
        }
        }
    

    public void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, java.io.IOException {

         throw new ServletException("GET method used with " +
            getClass( ).getName( )+": POST method required.");
      }
    
}