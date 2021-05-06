
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
String cId = request.getParameter("id");
String date=request.getParameter("date");

if(cId != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(cId);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update SubmitDate set id=?, submitDate=? where id="+cId;
ps = con.prepareStatement(sql);
ps.setString(1,cId);
ps.setString(2, date);

int i = ps.executeUpdate();
if(i > 0)
{
session.setAttribute("message", "Order deadline set successfully!");
response.sendRedirect("notice.jsp");
}
else
{
session.setAttribute("message", "There was a problem setting the order deadline.");
response.sendRedirect("notice.jsp");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
