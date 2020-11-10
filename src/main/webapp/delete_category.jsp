<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%
    String id = request.getParameter("id");
    
    try{
        
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
    
    Statement st = conn.createStatement();
    
    int i = st.executeUpdate("DELETE FROM Category WHERE categoryId="+id);
    session.setAttribute("message", "Category deleted successfully!");
    response.sendRedirect("categories.jsp");
    }
    catch(Exception e)
    {
        System.out.println();
        e.printStackTrace();
    }
    %>