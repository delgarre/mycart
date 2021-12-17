
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%
    String id = request.getParameter("id");
    String user = request.getParameter("user");
    String name = request.getParameter("name");
    try{
        
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
    
    Statement st = conn.createStatement();
    
    int i = st.executeUpdate("DELETE FROM UserLocation WHERE id="+id);
    session.setAttribute("message", "Location deleted successfully!");
    response.sendRedirect("company_user.jsp?id="+user+"&name="+name);
    }
    catch(Exception e)
    {
        System.out.println();
        e.printStackTrace();
        session.setAttribute("message", "error deleted location!");
        response.sendRedirect("company_user.jsp?id="+user+"&name="+name);
    }
    %>