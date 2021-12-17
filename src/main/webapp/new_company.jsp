<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>

<%
String companyName = request.getParameter("companyName");
String account_id = request.getParameter("account_id");
String phone = request.getParameter("phone");

String type = request.getParameter("type");

String code = request.getParameter("code");

String address1 = request.getParameter("address1");

String address2 = request.getParameter("address2");
    if(address2.equals("null")){
        address2 = " ";
    }else{
        address2 = request.getParameter("address2");
    }
    
    
    if(phone.equals("null")){
        phone = " ";
    }else{
        phone = request.getParameter("phone");
    }

String city = request.getParameter("city");

String zip = request.getParameter("zip");

String states = request.getParameter("states");

String status = "ACTIVE";

String query = "insert into Company(companyName,type, status, companyCode, address1, address2, city, states, zip, account_id, phone)values(upper('"+companyName+"'),upper('"+type+"'), '"+status+"', upper('"+code+"'), upper('"+address1+"'), upper('"+address2+"'), upper('"+city+"')"
        + ", upper('"+states+"'), upper('"+zip+"'), '"+account_id+"', '"+phone+"')";

try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate(query);
session.setAttribute("message", "Location added successfully!");
response.sendRedirect("companies.jsp");
System.out.println(query);
}
catch(Exception e)
{
session.setAttribute("message", "error adding location");
response.sendRedirect("companies.jsp");
System.out.print(e);
e.printStackTrace();
System.out.println(query);
}
%>



