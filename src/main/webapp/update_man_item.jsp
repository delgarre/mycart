
<%@page import="com.learn.mycart.entities.UOM"%>
<%@ page import="java.sql.*" %>

<%@page import="com.learn.mycart.entities.User"%>
<%@include file="components/message.jsp" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>

<%
User user1 = (User)session.getAttribute("current-user");
   
    
    if(user1==null){
        session.setAttribute("message", "You are not logged in!");
        response.sendRedirect("index.jsp");
        return;
    }
    
        
    else 
    {
        if(user1.getUserType().equals("normal"))
        {
            session.setAttribute("message", "Admin level required!");
            response.sendRedirect("index.jsp");
            return;
        }
    }
%>

<%

String name=request.getParameter("name");
String original = request.getParameter("original");


if(name != null)
{


try
{
Class.forName(driverName);
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i = st.executeUpdate("UPDATE `mycart`.`Item` SET `manufacturer` = '"+name+"' WHERE (`manufacturer` = '"+original+"')"); 

session.setAttribute("message", "Manufacturer Item info changed successfully!");
response.sendRedirect("manufacturers.jsp");

}
catch(SQLException sql)
{
session.setAttribute("message", "There was a problem updating the manufacturer or the item.");
response.sendRedirect("manufacturers.jsp");
}
}
%>
