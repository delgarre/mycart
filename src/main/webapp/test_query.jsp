<%-- 
    Document   : test_query
    Created on : Jul 15, 2021, 8:44:02 PM
    Author     : garre
--%><%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<
<%
String id = request.getParameter("locations");
String orderId = request.getParameter("orderId");
LocalDateTime ldt = LocalDateTime.now();
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy");
String date = dtf.format(ldt);

Date now = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss.SSS");
    String loginTime = sdf.format(now);



try
{

    
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
String strQuery = "SELECT COUNT(*) FROM OrderHistory WHERE date='"+date+"' and locations = '"+id+"'";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1);
out.println(Countrow);
    String count = Countrow;
String sql = count;
if(Countrow.equals("0")){

}
else{
    //String count = Countrow;
response.sendRedirect("a_orders.jsp?id="+id);
session.setAttribute("message", "order already exist for this month!");
//out.println(count);
//out.println(ddMMyyyyToday);
//out.println(date);
//out.println(user_id);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <input type="text" value="<%=sql%>">
        <input type="text" value="<%=id%>"><%=id%><br>
    </body>
    
    
    <%
    }
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
    %>
</html>
