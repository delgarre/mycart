<%@page import="com.learn.mycart.mail.JavaMailUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.util.Date"%>
<%@include file="components/message.jsp" %>
<%

String price=request.getParameter("price");
String quantity=request.getParameter("quantity");
String name = request.getParameter("name");
int user_id = Integer.parseInt(request.getParameter("user_id"));
String itemNumber = request.getParameter("itemNumber");
String locations = request.getParameter("locations");
Date today = new Date();
SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
String ddMMyyyyToday = DATE_FORMAT.format(today);
String stat = "Not Approved";
String photo = request.getParameter("photo");
String man = request.getParameter("man");
String mannum = request.getParameter("mannum");
String vTitle = request.getParameter("vTitle");
String cTitle = request.getParameter("cTitle");
String pDesc = request.getParameter("pDesc");
String uom = request.getParameter("uom");
String alt = request.getParameter("alt");
LocalDateTime ldt = LocalDateTime.now();
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy");
String date = dtf.format(ldt);
String department = request.getParameter("department");
String address1 = "";
String address2 = "";
String city = "";
String postalcode = "";
String state = "";
String phone = "";
String fax = "";
String query = "insert into Approve(date,locations, itemNumber,price, quantity, user_id, stat, name, photo, unitOfMeasure, manufacturer, manufacturerNum, cTitle, vTitle, pDesc, alternateItem, department, address1, address2, city, state, postalcode, fax, phone)values('"+date+"','"+locations+"','"+itemNumber+"','"+price+"','"+quantity+"', '"+user_id+"', '"+stat+"', '"+name+"', '"+photo+"', '"+uom+"', '"+man+"', '"+mannum+"','"+cTitle+"', '"+vTitle+"', '"+pDesc+"', '"+alt+"', '"+department+"', '"+address1+"', '"+address2+"', '"+city+"', '"+state+"', '"+postalcode+"', '"+fax+"', '"+phone+"')";
try
{

    
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
String strQuery = "SELECT COUNT(*) FROM Approve where itemNumber='"+itemNumber+"' and stat ='"+stat+"' and locations='"+locations+"'";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1);
out.println(Countrow);

if(Countrow.equals("0")){
int i=st.executeUpdate(query);
response.sendRedirect("admin_null_check.jsp");
session.setAttribute("message", "Cart Item added!");
System.out.println(query);
}
else{
response.sendRedirect("a_items.jsp");
session.setAttribute("message", "Cart Item already exist!");
System.out.println(query);
}


}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
System.out.println(query);
}
%>
