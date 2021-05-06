
<%@page import="com.learn.mycart.entities.UOM"%>
<%@ page import="java.sql.*" %>

<%@page import="com.learn.mycart.entities.User"%>
<%@include file="components/message.jsp" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://172.20.29.70:3306/mycart";%>
<%!String user = "admin";%>
<%!String psw = "ordering";%>
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

String val=request.getParameter("val");
String uom = request.getParameter("uom");


if(val != null)
{
Connection con = null;
PreparedStatement ps = null;

try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update Item set unitOfMeasure=upper(?) where unitOfMeasure='"+uom+"'";

ps = con.prepareStatement(sql);

ps.setString(1, val);

int i = ps.executeUpdate();
if(i > 0)
{
session.setAttribute("message", "Measurement, Item info changed successfully!");
response.sendRedirect("uom.jsp");
}
else
{
session.setAttribute("message", "There was a problem updating the measurement.");
response.sendRedirect("uom.jsp");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
