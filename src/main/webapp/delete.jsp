
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%
    String id = request.getParameter("id");
    
    try{
        
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "root", "antoine567");
    
    Statement st = conn.createStatement();
    
    int i = st.executeUpdate("DELETE FROM User WHERE user_id="+id);
    session.setAttribute("message", "User deleted successfully!");
    response.sendRedirect("users.jsp");
    }
    catch(Exception e)
    {
        System.out.println();
        e.printStackTrace();
    }
    %>