
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%
    String id = request.getParameter("id");
    
    try{
        
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
    
    Statement st = conn.createStatement();
    
    int i = st.executeUpdate("DELETE FROM Notice WHERE id="+id);
    session.setAttribute("message", "Message deleted successfully!");
    response.sendRedirect("notice.jsp");
    }
    catch(Exception e)
    {
        System.out.println();
        e.printStackTrace();
        session.setAttribute("message", "Message deleted successfully!");
    response.sendRedirect("notice.jsp");
    }
    %>
