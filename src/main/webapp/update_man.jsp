
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
String mId = request.getParameter("mId");
String name=request.getParameter("name");
String original = request.getParameter("original");

if(mId != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(mId);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update Manufacturers set id=?, name=upper(?) where id="+mId;
ps = con.prepareStatement(sql);
ps.setString(1,mId);
ps.setString(2, name);

int i = ps.executeUpdate();
if(i > 0)
{
session.setAttribute("message", "Manufacturer info changed successfully!");
response.sendRedirect("update_man_item.jsp?name="+name+"&original="+original);
}
else
{
session.setAttribute("message", "There was a problem updating the manufacturer.");
response.sendRedirect("manufacturers.jsp");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
