
<%@page import="com.learn.mycart.entities.Company"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%
    String id = request.getParameter("id");
    String loc = request.getParameter("loc");
    try{
        
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
    
    Statement st = conn.createStatement();
    
    int i = st.executeUpdate("DELETE FROM Orders WHERE id="+id);
    session.setAttribute("message", "Order Item deleted successfully!");
    response.sendRedirect("orders.jsp");
    
    }
    catch(Exception e)
    {
        System.out.println();
        e.printStackTrace();
    }
    %>