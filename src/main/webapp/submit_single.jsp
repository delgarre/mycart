<%@page import="com.learn.mycart.mail.SingleSubmit"%>
<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="com.learn.mycart.mail.JavaMailUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.util.Date"%>
<%@include file="components/message.jsp" %>
<%
Integer id= Integer.parseInt(request.getParameter("id"));



try
{

    
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into OrderHistory(itemNumber, aPrice, date, locations, cName, quantity, photo, cTitle, pDesc, manufacturer, manufacturerNum, unitOfMeasure, vTitle) select itemNumber, aPPrice, curdate(), locations, name, quantity, photo, cTitle, pDesc, manufacturer, manufacturerNum, unitOfMeasure, vTitle from Orders where id = '"+id+"'");

//SingleSubmit.sendMail("diane.madonna@dseincorporated.com", id);
response.sendRedirect("n.jsp?id="+id);
session.setAttribute("message", "Item approved!");
}
catch(Exception e)
{
out.print(e);
e.printStackTrace();
}
%>
