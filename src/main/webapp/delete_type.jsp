

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%
    String id = request.getParameter("id");
    
    try{
        
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
    
    Statement st = conn.createStatement();
    
    int i = st.executeUpdate("DELETE FROM LocationType WHERE id="+id);
    session.setAttribute("message", "Location tie deleted successfully!");
    response.sendRedirect("types.jsp");
    }
    catch(Exception e)
    {
        System.out.println();
        e.printStackTrace();
        session.setAttribute("message", "error deleting location tie!");
        response.sendRedirect("types.jsp");
    }
    %>
