
package com.learn.mycart.servlets;

import com.learn.mycart.entities.Category;
import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.dao.VendorDao;
import com.learn.mycart.entities.Product;
import com.learn.mycart.entities.Vendor;
import com.learn.mycart.helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            
            //servlet 2:
            //add category
            //add product
            
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
                //add product
                //work
                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDesc");
                double pPrice = Double.parseDouble(request.getParameter("pPrice"));
                
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                String pMeasure = request.getParameter("pMeasure");
                int catId = Integer.parseInt(request.getParameter("catId"));
                int vendorId = Integer.parseInt(request.getParameter("vendorId"));
                //String cpt = request.getParameter("cpt");
                //String ndc = request.getParameter("ndc");
                Part part = request.getPart("pPhoto");
                String fileName = part.getSubmittedFileName();
                
                
                
                Product p = new Product();
                p.setpName(pName);
                p.setpDesc(pDesc);
                p.setpPrice(pPrice);
                p.setUnitOfMeasure(pMeasure);
                p.setpQuanity(pQuantity);
                //p.setCpt(cpt);
                //p.setNdc(ndc);
                p.setpPhoto(part.getSubmittedFileName());
                
                
                //get category
                CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
                Category category= cDao.getCategoryById(catId);
                p.setCategory(category);
                
                //get vendor
                VendorDao vDao = new VendorDao(FactoryProvider.getFactory());
                Vendor vendor = vDao.getVendorById(vendorId);
                p.setVendor(vendor);
                
                //product save...
                ProductDao pDao =  new ProductDao(FactoryProvider.getFactory());
                pDao.saveProduct(p);
                
                
                //pic upload
                //find out the path to upload photo
                String path = request.getRealPath("img") +File.separator+ "products" + File.separator +part.getSubmittedFileName();
                //String path = getServletContext().getRealPath("/"+"img"+File.separator+fileName);
                System.out.println(path);
                
                
                //uploading code
                
                try {
                    
                
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
                
                out.println("Product save sucess...");
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message","Product added successfully... ");
                response.sendRedirect("admin.jsp");
                return;
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
