<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
String contactInfo = request.getParameter("contactInfo");
String quantity = request.getParameter("quantity");
String id = request.getParameter("id");
String price = request.getParameter("price");
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
String pDesc = request.getParameter("pDesc");

if(contactInfo.equals("Yes")){
    response.sendRedirect("user_contact_info_pharm.jsp?id="+id+"&name="+name+"&user_id="+user_id+"&itemNumber="+itemNumber+"&locations="+locations+"&stat="+stat+"&quantity="+quantity+"&pDesc="+pDesc);
    session.setAttribute("message", "Cart Item needs extra info");
}
else{
    response.sendRedirect("save_o_order_pharm.jsp?id="+id+"&name="+name+"&user_id="+user_id+"&itemNumber="+itemNumber+"&locations="+locations+"&stat="+stat+"&quantity="+quantity+"&pDesc="+pDesc+"&price="+price);
}
%>
