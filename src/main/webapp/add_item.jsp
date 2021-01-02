<%@page import="java.sql.*,java.util.*" %>

<%
                String name = request.getParameter("name");
                String pDesc = request.getParameter("pDesc");
                String price = request.getParameter("price");
                
                String quantity = request.getParameter("quantity");
                String unitOfMeasure = request.getParameter("unitOfMeasure");
                String catId = request.getParameter("catId");
                String vendor = request.getParameter("vendorId");
                String cpt = request.getParameter("cpt");
                String ndc = request.getParameter("ndc");
                String itemNumber = request.getParameter("itemNumber");
                String manufacturer = request.getParameter("manufacturer");
                String manufacturerNum = request.getParameter("manufacturerNum");
                Part part = request.getPart("file");
                String fileName = part.getSubmittedFileName();
                String locationType = request.getParameter("location");
                
                


try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into Item(name,fileName,price, quantity,catId, locationType, vendor, cpt, itemNumber, manufacturer, manufacturerNum, ndc,pDesc , unitOfMeasure)values('"+name+"','"+fileName+"','"+price+"','"+quantity+"','"+catId+"','"+locationType+"', '"+vendor+"', '"+cpt+"', '"+itemNumber+"', '"+manufacturer+"', '"+manufacturerNum+"', '"+ndc+"', '"+pDesc+"', '"+unitOfMeasure+"')");
session.setAttribute("message", "Item added successfully!");
response.sendRedirect("admin.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>




