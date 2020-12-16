<%@page import="com.learn.mycart.mail.JavaMailUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.util.Date"%>
<%
String location = request.getParameter("location");
String user = request.getParameter("user");



try
{

    
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();   
HttpSession httpSession=request.getSession();
int i = st.executeUpdate("insert into Test(comp_name, user_id) values('"+location+"','"+user+"')");
                    
response.sendRedirect("company_user.jsp?id="+user);
httpSession.setAttribute("message", "Location added successfully!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>