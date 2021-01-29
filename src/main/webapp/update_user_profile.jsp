
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
    
        

%>

<%
String id = request.getParameter("user_id");
String user_name=request.getParameter("user_name");

String password=request.getParameter("user_password");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update User set user_id=?,user_name=?,user_password=? where user_id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, user_name);
ps.setString(3, password);

int i = ps.executeUpdate();
if(i > 0)
{
session.setAttribute("message", "Password edited successfully!");
response.sendRedirect("profile.jsp");
}
else
{
session.setAttribute("message", "There was a problem editing your profile.");
response.sendRedirect("profle.jsp");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
