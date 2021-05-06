
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


String comp_name = request.getParameter("comp_name");
String locationType = request.getParameter("locationType");

if(comp_name != null)
{
Connection con = null;
PreparedStatement ps = null;

try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
Statement st = con.createStatement();
    
    int i = st.executeUpdate("Update LocationType set locationType=upper('"+comp_name+"') where locationType='"+locationType+"'");
response.sendRedirect("type.jsp");
 }
    catch(Exception e)
    {
        System.out.println();
        e.printStackTrace();
        //session.setAttribute("message", "error deleted user!");
    response.sendRedirect("type.jsp");
    }
}
%>
