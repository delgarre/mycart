/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author garre
 */
public class ItemReportServlet extends HttpServlet {

    public static void export( HttpServletResponse response) throws Exception {
      Class.forName("com.mysql.jdbc.Driver");
      Connection connect = DriverManager.getConnection( 
         "jdbc:mysql://172.20.29.70:3306/mycart" , 
         "admin" , 
         "ordering"
      );
      
      Statement statement = connect.createStatement();
      ResultSet resultSet = statement.executeQuery("select * from Item");
      XSSFWorkbook workbook = new XSSFWorkbook(); 
      XSSFSheet spreadsheet = workbook.createSheet("student db");
      
      XSSFRow row = spreadsheet.createRow(1);
      XSSFCell cell;
      cell = row.createCell(1);
      cell.setCellValue("Item");
      cell = row.createCell(2);
      cell.setCellValue("Description");
      cell = row.createCell(3);
      cell.setCellValue("Vendor");
      cell = row.createCell(4);
      cell.setCellValue("QTY Per UOM");
      cell = row.createCell(5);
      cell.setCellValue("UOM");
      int i = 2;

      while(resultSet.next()) {
         row = spreadsheet.createRow(i);
         cell = row.createCell(1);
         cell.setCellValue(resultSet.getString("itemNumber"));
         cell = row.createCell(2);
         cell.setCellValue(resultSet.getString("pDesc"));
         cell = row.createCell(3);
         cell.setCellValue(resultSet.getString("vTitle"));
         cell = row.createCell(4);
         cell.setCellValue(resultSet.getString("quantity"));
         cell = row.createCell(5);
         cell.setCellValue(resultSet.getString("unitOfMeasure"));
         i++;
      }

      FileOutputStream out = new FileOutputStream(new File("exceldatabase.xlsx"));
      response.setContentType("application/vnd.ms-excel");
      response.setHeader("Content-Disposition", "attachment;filename=\"Items.xlsx");
      workbook.write(response.getOutputStream());
      out.close();
      System.out.println("exceldatabase.xlsx written successfully");
      
   }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
                try {
           export(response);
          
       } catch (Exception ex) {
           Logger.getLogger(ItemReportServlet.class.getName()).log(Level.SEVERE, null, ex);
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
