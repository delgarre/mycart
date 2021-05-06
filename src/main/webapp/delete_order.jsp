
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.mail.CartDelete"%>
<%@page import="com.learn.mycart.entities.Company"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%
    User user = (User)session.getAttribute("current-user");
    String email = user.getUserEmail();
    String id = request.getParameter("id");
    String itemNumber = request.getParameter("itemNumber");
     String location = request.getParameter("location");
   
    try{
        
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
    
    Statement st = conn.createStatement();
    
    int i = st.executeUpdate("DELETE FROM Approve WHERE id="+id);
    
    response.sendRedirect("l_pending_orders.jsp");
    CartDelete.sendMail(email, itemNumber, location);
    session.setAttribute("message", "Item deleted successfully!");
    }
    catch(Exception e)
    {
        System.out.println();
        e.printStackTrace();
        response.sendRedirect("l_pending_orders.jsp");
        session.setAttribute("message", "error deleted item!");
    }
    %>
