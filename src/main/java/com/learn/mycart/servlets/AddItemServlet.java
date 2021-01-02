/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.servlets;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ItemDao;
import com.learn.mycart.dao.LocationTypeDao;
import com.learn.mycart.dao.VendorDao;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Item;
import com.learn.mycart.entities.LocationType;
import com.learn.mycart.entities.Vendor;
import com.learn.mycart.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
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
 * @author garre
 */
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
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        isMultipart = ServletFileUpload.isMultipartContent(request);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
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
            
                String name = request.getParameter("name");
                String pDesc = request.getParameter("pDesc");
                String price = request.getParameter("price");
                
                String quantity = request.getParameter("quantity");
                String unitOfMeasure = request.getParameter("unitOfMeasure");
                String catId = request.getParameter("catId");
                String vendor = request.getParameter("vendorId");
                String cpt = request.getParameter("cpt");
                String ndc = request.getParameter("ndc");
                String itemNumber = request.getParameter("itemNumber");
                String manufacturer = request.getParameter("manufacturer");
                String manufacturerNum = request.getParameter("manufacturerNum");
                Part part = request.getPart("file");
                String fileName = part.getSubmittedFileName();
                String locationType = request.getParameter("location");
                
                
                
                
                Item i = new Item();
                i.setName(name);
                i.setpDesc(pDesc);
                i.setManufacturer(manufacturer);
                i.setItemNumber(itemNumber);
                i.setCpt(cpt);
                i.setNdc(ndc);
                i.setManufacturerNum(manufacturerNum);
                i.setPrice(price);
                i.setQuantity(quantity);
                i.setUnitOfMeasure(unitOfMeasure);
                i.setPhoto(fileName);
              

                
                LocationTypeDao ldao = new LocationTypeDao(FactoryProvider.getFactory());
                LocationType location = ldao.getLocationTypeByName(locationType);
                i.setLocation(location);
                
                VendorDao vDao = new VendorDao(FactoryProvider.getFactory());
                Vendor vendors = vDao.getVendorByNmae(vendor);
                i.setVendors(vendors);
                
                CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
                Category category= cDao.getName(catId);
                i.setCategory(category);
                ItemDao idao = new ItemDao(FactoryProvider.getFactory());
                idao.saveProduct(i);
                try {
                    
                    String path = request.getRealPath("img") +File.separator+ "products" + File.separator +part.getSubmittedFileName();
                
                FileOutputStream fos = new FileOutputStream(path);
                
                InputStream is = part.getInputStream();
                
                
                //reading data
                byte []data = new byte[is.available()];
                
                is.read(data);
                
                //write the data
                fos.write(data);
                
                fos.close();
                
                } catch (Exception e) {
                    e.printStackTrace();
                }
                
                DiskFileItemFactory factory = new DiskFileItemFactory();
   
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
   
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
   
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );

      try { 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);
	
         // Process the uploaded file items
         Iterator it = fileItems.iterator();
         
          while ( it.hasNext () ) {
            FileItem fi = (FileItem)it.next();
            if ( !fi.isFormField () ) {
               // Get the uploaded file parameters
               String fieldName = fi.getFieldName();
               String fileNames = fi.getName();
               String contentType = fi.getContentType();
               boolean isInMemory = fi.isInMemory();
               long sizeInBytes = fi.getSize();
            
               // Write the file
               if( fileNames.lastIndexOf("\\") >= 0 ) {
                  file = new File( filePath + fileNames.substring( fileNames.lastIndexOf("\\"))) ;
               } else {
                  file = new File( filePath + fileNames.substring(fileNames.lastIndexOf("\\")+1)) ;
               }
               fi.write( file ) ;
               out.println("Uploaded Filename: " + fileNames + "<br>");
            }
         }
          } catch(Exception ex) {
            System.out.println(ex);
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}