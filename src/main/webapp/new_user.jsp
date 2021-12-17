<%@page import="java.sql.*,java.util.*" %>
<%@include file="components/message.jsp" %>

<%
String user_name = request.getParameter("user_name");

String user_password = request.getParameter("user_password");
String user_type = request.getParameter("user_type");
String user_email = request.getParameter("user_email");
String department = request.getParameter("department");
                if(department.equals("null")){
                  
                    department = "GENERAL";
                }else{
                    department = request.getParameter("department");
                }
String query = "insert into User(user_name,user_password,user_type, user_email, department)values(upper('"+user_name+"'),'"+user_password+"','"+user_type+"','"+user_email+"','"+department+"')";          

try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate(query);
session.setAttribute("message", "User added successfully!");
response.sendRedirect("users.jsp");
System.out.println(query);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
System.out.println(query);
}
%>



