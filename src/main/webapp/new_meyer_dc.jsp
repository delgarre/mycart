<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>

<%
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
                if(address1.equals("null")){
                  
                    address1 = " ";
                }else{
                    address1 = request.getParameter("address1");
                }
                if(address2.equals("null")){
                  
                    address2 = " ";
                }else{
                    address2 = request.getParameter("address2");
                }
                if(postalcode.equals("null")){
                  
                    postalcode = " ";
                }else{
                    postalcode = request.getParameter("postalcode");
                }
                if(province_code.equals("null")){
                  
                    province_code = " ";
                }else{
                    province_code = request.getParameter("province_code");
                }
                if(country_code.equals("null")){
                  
                    country_code = " ";
                }else{
                    country_code = request.getParameter("country_code");
                }
                 if(phone.equals("null")){
                  
                    phone = " ";
                }else{
                    phone = request.getParameter("phone");
                }
                  if(city.equals("null")){
                  
                    city = " ";
                }else{
                    city = request.getParameter("city");
                }
String query = "insert into VendorReport(report_id,account_id,shipping_method, sku, order_line_id,quantity, operations_confirm_order,operations_email_confirmation, address1, address2, city, postalcode, province_code, country_code, phone, first_name, last_name)values(upper('"+request_id+"'),'"+account_id+"','"+shipping_method+"','"+sku+"','"+order_line_id+"','"+quantity+"','"+operations_confirm_order+"','"+operations_email_confirmation+"','"+address1+"','"+address2+"','"+city+"','"+postalcode+"','"+province_code+"','"+country_code+"','"+phone+"','"+first_name+"','"+last_name+"')";          

try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate(query);
session.setAttribute("message", "Info added successfully!");
response.sendRedirect("meyer_dc.jsp");
System.out.println(query);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
System.out.println(query);
}
%>



