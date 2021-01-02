
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
String id = request.getParameter("catId");
String categoryTitle=request.getParameter("catTitle");

if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update Category set categoryId=?,categoryTitle=? where categoryId="+id;

ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, categoryTitle);
int i = ps.executeUpdate();
if(i > 0)
{
session.setAttribute("message", "Category updated successfully!");
response.sendRedirect("categories.jsp");
}
else
{
session.setAttribute("message", "There was a problem updating the cateory.");
response.sendRedirect("categories.jsp");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
