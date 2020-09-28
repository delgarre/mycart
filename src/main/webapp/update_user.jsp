
<%@ page import="java.sql.*" %>
<%@include file="components/message.jsp" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/mycart";%>
<%!String user = "root";%>
<%!String psw = "antoine567";%>

<%
String id = request.getParameter("user_id");
String user_name=request.getParameter("user_name");
String authority=request.getParameter("user_type");
String password=request.getParameter("user_password");
String email=request.getParameter("user_email");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update user set user_id=?,user_name=?,user_type=?,user_password=?,user_email=? where user_id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, user_name);
ps.setString(3, authority);
ps.setString(4, password);
ps.setString(5, email);
int i = ps.executeUpdate();
if(i > 0)
{
session.setAttribute("message", "User updated successfully!");
response.sendRedirect("users.jsp");
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
