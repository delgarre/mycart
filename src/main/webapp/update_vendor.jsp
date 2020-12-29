
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
String vendorId = request.getParameter("vendorId");
String vendorName=request.getParameter("vendorName");

if(vendorId != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(vendorId);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update Vendor set vendorId=?, vendorName=? where vendorId="+vendorId;
ps = con.prepareStatement(sql);
ps.setString(1,vendorId);
ps.setString(2, vendorName);

int i = ps.executeUpdate();
if(i > 0)
{
session.setAttribute("message", "Vendor info changed successfully!");
response.sendRedirect("vendors.jsp");
}
else
{
session.setAttribute("message", "There was a problem updating the user.");
response.sendRedirect("users.jsp");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
