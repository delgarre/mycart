
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
String uId = request.getParameter("uId");
String val=request.getParameter("measurement");
String uom = request.getParameter("uom");

if(uId != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(uId);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update UOM set id=?, val=upper(?) where id="+uId;
ps = con.prepareStatement(sql);
ps.setString(1,uId);
ps.setString(2, val);

int i = ps.executeUpdate();
if(i > 0)
{
session.setAttribute("message", "Measurement info changed successfully!");
response.sendRedirect("update_uom_item.jsp?val="+val+"&uom="+uom);
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
