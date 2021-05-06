
<%@ page import="java.sql.*" %>
<%@include file="components/message.jsp" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://172.20.29.70:3306/mycart";%>
<%!String user = "admin";%>
<%!String psw = "ordering";%>

<%
String id = request.getParameter("id");




String stat=request.getParameter("stat");
String pDesc = request.getParameter("pDesc");
                String price = request.getParameter("pPrice");
                String alt = request.getParameter("alt");
                String quantity = request.getParameter("pQuantity");
                String unitOfMeasure = request.getParameter("pMeasure");
                String catId = request.getParameter("catId");
                String vendor = request.getParameter("vendorId");
                String cpt = request.getParameter("cpt");
                String ndc = request.getParameter("ndc");
                String itemNumber = request.getParameter("itemNumber");
                String manufacturer = request.getParameter("manufacturer");
                String manufacturerNum = request.getParameter("manufacturerNum");
                String notes = request.getParameter("notes");
                String locationType = request.getParameter("locationType");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update Item set id=?,itemNumber=upper(?),price=?,quantity=?,unitOfMeasure=upper(?), stat=?, ndc=?, cTitle=upper(?), vTitle=upper(?), manufacturer=upper(?), manufacturerNum=upper(?), pDesc=upper(?), cpt=upper(?), alternateItem=upper(?), notes=upper(?), locationType=upper(?) where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, itemNumber);
ps.setString(3, price);
ps.setString(4, quantity);
ps.setString(5, unitOfMeasure);
ps.setString(6, stat);
ps.setString(7, ndc);
ps.setString(8, catId);
ps.setString(9, vendor);
ps.setString(10, manufacturer);
ps.setString(11, manufacturerNum);
ps.setString(12, pDesc);
ps.setString(13, cpt);
ps.setString(14, alt);
ps.setString(15, notes);
ps.setString(16, locationType);

int i = ps.executeUpdate();
if(i > 0)
{
session.setAttribute("message", "Item edited successfully!");
response.sendRedirect("update_product_page.jsp?id="+id+"&code="+cpt+"&cTitle="+catId+"&vTitle="+vendor+"&man="+manufacturer);
}
else
{
session.setAttribute("message", "There was a problem editing the item.");
response.sendRedirect("update_product_page.jsp?id="+id);
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
