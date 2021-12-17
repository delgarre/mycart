/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author garre
 */

@MultipartConfig
public class UpdateItem extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             String driverName = "com.mysql.jdbc.Driver";
                String url = "jdbc:mysql://172.20.29.70:3306/mycart";
                String user = "admin";
                String psw = "ordering";
                
                
                String id = request.getParameter("id");




String stat=request.getParameter("stat");
String pDesc = request.getParameter("pDesc");
                String price = request.getParameter("pPrice");
                String alt = request.getParameter("alt");
                String quantity = request.getParameter("pQuantity");
                String unitOfMeasure = request.getParameter("pMeasure");
                String catId = request.getParameter("catId");
                String vendor = request.getParameter("vendorId");
                String cpt = request.getParameter("cpt");
                String ndc = request.getParameter("ndc");
                String itemNumber = request.getParameter("itemNumber");
                String manufacturer = request.getParameter("manufacturer");
                String manufacturerNum = request.getParameter("manufacturerNum");
                String notes = request.getParameter("notes");
                String contactInfo = request.getParameter("contactInfo");
                //String locationType = request.getParameter("locationType");
                String locationType = "";
                String location[]=request.getParameterValues("locationType");
                for(int i=0;i < location.length; i++){
                locationType += location[i] + ","; 
                }
                //Part parts = request.getPart("sds");
                //String sds = parts.getSubmittedFileName();
                //Part part = request.getPart("file");
                //String fileName = part.getSubmittedFileName();

if(id != null)
{

PreparedStatement ps = null;

int personID = Integer.parseInt(id);
try
{
                Connection con = DB.getConnection();
String sql="Update Item set id=?,itemNumber=upper(?),price=?,quantity=?,unitOfMeasure=upper(?), stat=?, ndc=?, cTitle=upper(?), vTitle=upper(?), manufacturer=upper(?), manufacturerNum=upper(?), pDesc=upper(?), cpt=upper(?), alternateItem=upper(?), notes=upper(?), locationType=upper(?), contactInfo=? where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, itemNumber);
ps.setString(3, price);
ps.setString(4, quantity);
ps.setString(5, unitOfMeasure);
ps.setString(6, stat);
ps.setString(7, ndc);
ps.setString(8, catId);
ps.setString(9, vendor);
ps.setString(10, manufacturer);
ps.setString(11, manufacturerNum);
ps.setString(12, pDesc);
ps.setString(13, cpt);
ps.setString(14, alt);
ps.setString(15, notes);
ps.setString(16, locationType);
ps.setString(17, contactInfo);
//ps.setString(17, sds);
//ps.setString(18, fileName);

int i = ps.executeUpdate();
if(i > 0)
{
    HttpSession httpSession = request.getSession();
httpSession.setAttribute("message", "Item edited successfully!");
response.sendRedirect("update_product_page.jsp?id="+id+"&code="+cpt+"&cTitle="+catId+"&vTitle="+vendor+"&man="+manufacturer+"&uom="+unitOfMeasure+"&ltype="+locationType);
}
else
{
    HttpSession httpSession = request.getSession();
httpSession.setAttribute("message", "There was a problem editing the item.");
response.sendRedirect("update_product_page.jsp?id="+id);
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
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
