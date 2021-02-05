/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.servlets;

import com.learn.mycart.dao.CompanyDao;
import com.learn.mycart.dao.LocationTypeDao;
import com.learn.mycart.dao.TestDao;
import com.learn.mycart.entities.Company;
import com.learn.mycart.entities.LocationType;
import com.learn.mycart.entities.Test;
import java.io.IOException;
import com.learn.mycart.helper.FactoryProvider;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author garre
 */
public class CDropDownServlet extends HttpServlet {

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
            String name = request.getParameter("comId");
           
            LocationTypeDao lDao = new LocationTypeDao(FactoryProvider.getFactory());
           // LocationType locationType = lDao.getByLocation(location);
            
            CompanyDao cdao  = new CompanyDao(FactoryProvider.getFactory());
            Company company = cdao.getCompanyByName(name);
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("location", company);
            
                httpSession.setAttribute("message","Location selected ");
            //response.sendRedirect("home.jsp");
            response.sendRedirect("l_pending_orders.jsp");
            return;
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
