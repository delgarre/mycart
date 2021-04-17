
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
String cId = request.getParameter("cId");
String company=request.getParameter("company");

if(cId != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(cId);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update L_Company set id=?, company=upper(?) where id="+cId;
ps = con.prepareStatement(sql);
ps.setString(1,cId);
ps.setString(2, company);

int i = ps.executeUpdate();
if(i > 0)
{
session.setAttribute("message", "Company changed successfully!");
response.sendRedirect("l_company.jsp");
}
else
{
session.setAttribute("message", "There was a problem updating the company.");
response.sendRedirect("l_company.jsp");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
