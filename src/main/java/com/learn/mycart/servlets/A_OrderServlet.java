/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.servlets;

import com.learn.mycart.mail.JavaMailUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author garre
 */
public class A_OrderServlet extends HttpServlet {

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
          
            
            String location = request.getParameter("loc");
            
            double o = Math.random()*200;

            double orderId = Math.random() + (o * 500);

            int x = (int) orderId;
            String code = request.getParameter("code");
            String oid = code+x;
            int active = 1;
            
            if(location != null){
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
                    Statement st=conn.createStatement();   
                    HttpSession httpSession=request.getSession();
                    int i = st.executeUpdate("insert into Orders(itemNumber, aPPrice, date, locations, name, quantity, user_id, photo, status, cTitle, pDesc, manufacturer, manufacturerNum, unitOfMeasure, vTitle, orderId, alternateItem, department, address1, address2, city, state, postalcode, fax, phone, active) select itemNumber, price, date, locations, name, quantity, user_id, photo, stat, cTitle, pDesc, manufacturer, manufacturerNum, unitOfMeasure, vTitle, '"+oid+"', alternateItem, department, address1, address2, city, state, postalcode, fax, phone, "+active+" from Approve where locations = '"+location+"'");
                    
                
                    response.sendRedirect("q.jsp?id="+location);
                    httpSession.setAttribute("message", "Order submitted successfully!");
                } catch (Exception e) {
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
