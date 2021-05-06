

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%
    String id = request.getParameter("id");
    String answer = request.getParameter("answer");
    try{
        
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
    
    
    
    Statement st = conn.createStatement();
    int i = st.executeUpdate("DELETE FROM Company WHERE companyId="+id);
    session.setAttribute("message", "Company deleted successfully!");
    response.sendRedirect("companies.jsp");
    
    
    
    
    }
    catch(Exception e)
    {
         session.setAttribute("message", "error deleted company!");
    response.sendRedirect("companies.jsp");
    }
    %>
