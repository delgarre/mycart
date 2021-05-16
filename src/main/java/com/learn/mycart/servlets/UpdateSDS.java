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
public class UpdateSDS extends HttpServlet {

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
                Part parts = request.getPart("sds");
                String sds = parts.getSubmittedFileName();
                
if(id != null)
{

PreparedStatement ps = null;

int personID = Integer.parseInt(id);
try
{
                Connection con = DB.getConnection();
String sql="Update Item set id=?, sds=? where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1, id);
ps.setString(2, sds);


int i = ps.executeUpdate();
if(i > 0)
{
    HttpSession httpSession = request.getSession();
httpSession.setAttribute("message", "Item edited successfully!");
response.sendRedirect("update_sds.jsp?id="+id);
}
else
{
    HttpSession httpSession = request.getSession();
httpSession.setAttribute("message", "There was a problem editing the item.");
response.sendRedirect("update_sds.jsp?id="+id);
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
