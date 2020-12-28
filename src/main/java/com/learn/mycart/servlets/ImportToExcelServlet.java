/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.servlets;

import com.learn.mycart.excel.ImportToExcel;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author garre
 */
public class ImportToExcelServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String id = request.getParameter("id");
            if(id !=null){
            String jdbcURL = "jdbc:mysql://172.20.29.70:3306/mycart";
        String username = "admin";
        String password = "ordering";
            
    	String excelFilePath="C:/Users/garre/OneDrive/Desktop/excel/Details.xlsx";
    	int batchSize = 20;
 
        Connection connection = null;
 
        try {
            long start = System.currentTimeMillis();
             
            FileInputStream inputStream = new FileInputStream(excelFilePath);
 
            Workbook workbook = new XSSFWorkbook(inputStream);
 
            Sheet firstSheet = workbook.getSheetAt(0);
            Iterator<Row> rowIterator = firstSheet.iterator();
 
            connection = DriverManager.getConnection(jdbcURL, username, password);
            connection.setAutoCommit(false);
  
            String sql = "INSERT INTO Details (name, photo, price, quantity) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);    
             
            int count = 0;
             
            rowIterator.next(); // skip the header row
             
            while (rowIterator.hasNext()) {
                Row nextRow = rowIterator.next();
                Iterator<Cell> cellIterator = nextRow.cellIterator();
 
                while (cellIterator.hasNext()) {
                    Cell nextCell = cellIterator.next();
 
                    int columnIndex = nextCell.getColumnIndex();
 
                    switch (columnIndex) {
                    case 0:
                        String name = nextCell.getStringCellValue();
                        statement.setString(1, name);
                        break;
                    case 1:
                        String photo = nextCell.getStringCellValue();
                        statement.setString(2, photo);
                    case 2:
                        
                        String price = nextCell.getStringCellValue();
                        statement.setString(3, price);
                        
                        //int price = (int) nextCell.getNumericCellValue();
                        //statement.setInt(3, price);
                        
                        
                    case 3:
                        
                        String quantity = nextCell.getStringCellValue();
                        statement.setString(4, quantity);
                        
                        //int quantity = (int) nextCell.getNumericCellValue();
                        //statement.setInt(4, quantity);
                     /*   
                    case 4:
                        
                        //String category = nextCell.getStringCellValue();
                        //statement.setString(5, category);
                        
                        int category = (int) nextCell.getNumericCellValue();
                        statement.setInt(5, category);
                        
                    */
                        
                    }
 
                }
                 
                statement.addBatch();
                 
                if (count % batchSize == 0) {
                    statement.executeBatch();
                }              
 
            }
 
            workbook.close();
             
            // execute the remaining queries
            statement.executeBatch();
  
            connection.commit();
            connection.close();
             
            long end = System.currentTimeMillis();
            System.out.printf("Import done in %d ms\n", (end - start));
             
        } catch (IOException ex1) {
            System.out.println("Error reading file");
            ex1.printStackTrace();
        } catch (SQLException ex2) {
            System.out.println("Database error");
            ex2.printStackTrace();
        }
 
            response.sendRedirect("excel_test.jsp");
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
