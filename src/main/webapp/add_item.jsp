<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="java.sql.*,java.util.*" %>


<%@page import ="javax.servlet.http.Part" %>

<%
    
    User user = (User)session.getAttribute("current-user");
    Company companys = (Company)session.getAttribute("location");
    String com1 = companys.getCompanyName();
    String name = user.getUserName();
               
                
                
                String quantity = request.getParameter("quantity");
                
                
             
                String id = request.getParameter("id");
                String stat = "Active";
                
                


try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into Approve(name,photo ,price, quantity, locations, itemNumber, manufacturer, manufacturerNum, pDesc , unitOfMeasure, cTitle, vTitle, stat, date)select "+name+", photo, price, "+quantity+", "+com1+", cpt, itemNumber, manufacturer, manufacturerNum, pDesc , unitOfMeasure, cTitle, vTitle, "+stat+", curdate() from Item where id="+id+"");
response.sendRedirect("items.jsp");
session.setAttribute("message", "Cart Item added!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>




