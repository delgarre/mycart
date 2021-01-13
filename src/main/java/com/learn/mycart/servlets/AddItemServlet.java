/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.servlets;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ItemDao;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Item;
import com.learn.mycart.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Delenis Garrett
 */
@MultipartConfig
public class AddItemServlet extends HttpServlet {

   private boolean isMultipart;
   private String filePath;
   private int maxFileSize = 100 * 1024;
   private int maxMemSize = 4 * 1024;
   private File file ;
   
   public void init( ){
      // Get the file location where it would be stored.
      filePath = getServletContext().getInitParameter("file-upload"); 
   }
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        isMultipart = ServletFileUpload.isMultipartContent(request);
        try (PrintWriter out = response.getWriter()) {
            String op = request.getParameter("operation");
            
            if(op.trim().equals("addcategory"))
            {
                //add category
                //fetching category data
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");
                
                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDesc(description);
                
                //category save data:
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                
                int catId=categoryDao.saveCategory(category);
                
                //out.println("Category saved");
                HttpSession httpSession=request.getSession();
                httpSession.setAttribute("message", "Category added sucessfully! Item number: "+catId);
                response.sendRedirect("admin.jsp");
                return;
            }
            else if(op.trim().equals("addproduct"))
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
                
                String stat = "Active";
                String chooselocations="";

                String location[]=request.getParameterValues("location");
                for(int i=0;i < location.length; i++){
                chooselocations += location[i] + ","; 
                
                try
                {

                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
                Statement st=conn.createStatement();
                int s=st.executeUpdate("insert into Item(photo ,price, quantity, locationType, cpt, itemNumber, manufacturer, manufacturerNum, ndc,pDesc , unitOfMeasure, cTitle, vTitle, stat)values('"+fileName+"','"+price+"','"+quantity+"','"+chooselocations+"', '"+cpt+"', '"+itemNumber+"', '"+manufacturer+"', '"+manufacturerNum+"', '"+ndc+"', '"+pDesc+"', '"+unitOfMeasure+"','"+catId+"', '"+vendor+"','"+stat+"')");
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message","Product added successfully... ");
                
                }
                catch(Exception e)
                {
                System.out.print(e);
                e.printStackTrace();
                }
}
                
                
                
                
                
               
              
              


      
          HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message","Item added successfully... ");
                response.sendRedirect("admin.jsp");
                return;
        }
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, java.io.IOException {

         throw new ServletException("GET method used with " +
            getClass( ).getName( )+": POST method required.");
      }
    
}