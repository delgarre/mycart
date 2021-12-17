
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%
    String id = request.getParameter("id");
    String locations = request.getParameter("locations");
    
    try{
        
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
    
    Statement st = conn.createStatement();
    
    int i = st.executeUpdate("DELETE FROM OrderHistory WHERE id="+id);
    session.setAttribute("message", "Item deleted successfully!");
    response.sendRedirect("past_orders_page.jsp?id="+locations);
    }
    catch(Exception e)
    {
        System.out.println();
        e.printStackTrace();
        session.setAttribute("message", "error deleted item!");
    response.sendRedirect("past_orders_page.jsp?id="+locations);
    }
    %>