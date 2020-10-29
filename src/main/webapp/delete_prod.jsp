<%@page import="java.sql.*,java.util.*" %>

<%
    String id = request.getParameter("id");
    
    try{
        
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
    
    Statement st = conn.createStatement();
    
    int i = st.executeUpdate("DELETE FROM Product WHERE pId="+id);
    session.setAttribute("message", "User deleted successfully!");
    response.sendRedirect("products.jsp");
    }
    catch(Exception e)
    {
        System.out.println();
        e.printStackTrace();
    }
    %>
