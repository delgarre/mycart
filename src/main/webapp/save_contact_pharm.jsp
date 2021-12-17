<%@page import="com.learn.mycart.mail.JavaMailUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.util.Date"%>
<%@page import= "java.time.LocalDate"%>
<%@page import= "java.time.LocalDateTime"%>
<%@page import= "java.time.format.DateTimeFormatter"%>
<%@include file="components/message.jsp" %>
<%

String iid = request.getParameter("id");
String department = request.getParameter("department");
String quantity=request.getParameter("quantity");
String name = request.getParameter("name");
int user_id = Integer.parseInt(request.getParameter("user_id"));
String itemNumber = request.getParameter("itemNumber");
String locations = request.getParameter("locations");
Date today = new Date();
SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
String ddMMyyyyToday = DATE_FORMAT.format(today);
LocalDateTime ldt = LocalDateTime.now();
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy");
String date = dtf.format(ldt);
String stat = "Not Approved";
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String city = request.getParameter("city");
String postalcode = request.getParameter("postalcode");
String state = request.getParameter("state");
String phone = request.getParameter("phone");
String fax = request.getParameter("fax");

if(fax.equals("null")){
                  
                    fax = "";
                }else{
                    fax = request.getParameter("fax");
                }

String query = "insert into Approve(itemNumber, price, date, locations, name, quantity, user_id, photo, stat, cTitle, pDesc, manufacturer, manufacturerNum, unitOfMeasure, vTitle, alternateItem, department, address1, address2, city, state, postalcode, fax, phone) select '"+itemNumber+"', price, '"+date+"', '"+locations+"', '"+name+"', "+quantity+", "+user_id+", photo, 'Not Approved', cTitle, pDesc, manufacturer, manufacturerNum, unitOfMeasure, vTitle, alternateItem, '"+department+"', '"+address1+"', '"+address2+"', '"+city+"', '"+state+"', '"+postalcode+"', '"+fax+"', '"+phone+"' from Item where id ="+iid;


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
response.sendRedirect("null_check.jsp");
session.setAttribute("message", "Cart Item added!");
System.out.println(query);
}

else{
response.sendRedirect("items.jsp");
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
