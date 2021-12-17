
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
String id = request.getParameter("id");
String request_id=request.getParameter("report_id");
String account_id = request.getParameter("account_id");

String sku = request.getParameter("sku");
String shipping_method=request.getParameter("shipping_method");
String order_line_id = request.getParameter("order_line_id");

String quantity = request.getParameter("quantity");

String operations_confirm_order = request.getParameter("operations_confirm_order");
String operations_email_confirmation=request.getParameter("operations_email_confirmation");
String address1 = request.getParameter("address1");

String address2 = request.getParameter("address2");
String city =request.getParameter("city");
String postalcode = request.getParameter("postalcode");
String province_code = request.getParameter("province_code");
String country_code = request.getParameter("country_code");
String phone = request.getParameter("phone");
String first_name = request.getParameter("first_name");
String last_name = request.getParameter("last_name");

if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update VendorReport set id=?, report_id=?, account_id=?, sku=?, shipping_method=?, order_line_id=?, quantity=?, operations_confirm_order=?, operations_email_confirmation=?, address1=?, address2=?, city=?, postalcode=?, province_code=?, country_code=?, phone=?, last_name=?, first_name=? where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, request_id);
ps.setString(3, account_id);
ps.setString(4, sku);
ps.setString(5, shipping_method);
ps.setString(6, order_line_id);
ps.setString(7, quantity);
ps.setString(8, operations_confirm_order);
ps.setString(9, operations_email_confirmation);
ps.setString(10, address1);
ps.setString(11, address2);
ps.setString(12, city);
ps.setString(13, postalcode);
ps.setString(14, province_code);
ps.setString(15, country_code);
ps.setString(16, phone);
ps.setString(17, last_name);
ps.setString(18, first_name);

int i = ps.executeUpdate();
if(i > 0)
{
session.setAttribute("message", "Line info changed successfully!");
response.sendRedirect("meyer_dc.jsp");
}
else
{
session.setAttribute("message", "There was a problem updating the line.");
response.sendRedirect("meyer_dc.jsp");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
System.out.println(sql);
}
}
%>
