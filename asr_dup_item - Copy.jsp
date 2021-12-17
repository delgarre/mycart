


<%@page import="com.learn.mycart.entities.User"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.util.Date"%>
<%@page import= "java.time.LocalDate"%>
<%@page import= "java.time.LocalDateTime"%>
<%@page import= "java.time.format.DateTimeFormatter"%>
<%@include file="components/message.jsp" %>
<%

String itemNumber = request.getParameter("itemNumber");
String stat = "Not Approved";
String id = request.getParameter("id");

 User user1 = (User)session.getAttribute("current-user");
 String email = user1.getUserEmail();
 String department = user1.getDepartment();
 String inventory = "";
 if(department.equals("ASR")){
     inventory = "asr_items.jsp";
 }else{
     inventory = "items.jsp";
 }


try
{

    
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();

String strQuery = "SELECT COUNT(*) FROM Approve where itemNumber='"+itemNumber+"' and stat ='"+stat+"' and name='"+user1.getUserName()+"'";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1);
out.println(Countrow);

if(Countrow.equals("0")){
    

response.sendRedirect("asr.jsp?id="+id);
session.setAttribute("message", "Item number: "+itemNumber);

}

else{

//session.setAttribute("message", "Cart Item already exist! Please update quantity");
//response.sendRedirect("update_order_page.jsp?id="+id);
response.sendRedirect("asr_items.jsp");
    session.setAttribute("message", "Cart Item already exist! Please update quantity");
}


}
catch(Exception e)
{
    response.sendRedirect("asr_items.jsp");
    session.setAttribute("message", "Cart Item already exist! Please update quantity");
System.out.print(e);
e.printStackTrace();
}
%>

%>
