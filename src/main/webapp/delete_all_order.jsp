
<%@page import="com.learn.mycart.entities.Company"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%
   
    String loc = request.getParameter("location");
    try{
        
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
    
    Statement st = conn.createStatement();
    
    int i = st.executeUpdate("DELETE FROM Orders WHERE locations='"+loc+"' and status = 'Not Approved'");
    session.setAttribute("message", "Order deleted successfully!");
    response.sendRedirect("orders.jsp");
    
    }
    catch(Exception e)
    {
        System.out.println();
        e.printStackTrace();
        session.setAttribute("message", "error deleted order item!");
    response.sendRedirect("a_orders.jsp?id="+loc);
    }
    %>