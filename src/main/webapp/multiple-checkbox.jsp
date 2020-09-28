<%@page import="java.sql.*,java.util.*" %>

<%
//String choosecompanies="";
String company_name[]=request.getParameterValues("company");
for(int i=0; i < company_name.length; i++);
    


try{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mycart", "root", "antoine567");
Statement st=con.createStatement();
int i=st.executeUpdate("insert into orderhistory(company_name) values('"+company_name+"')");
out.println("Data is successfully inserted into database.");
}
catch(Exception e){
System.out.println(e);
}
%>