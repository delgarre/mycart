<%@page import="java.sql.*,java.util.*" %>


<%@page import ="javax.servlet.http.Part" %>

<%
                String name = request.getParameter("pName");
                String pDesc = request.getParameter("pDesc");
                String price = request.getParameter("pPrice");
                
                String quantity = request.getParameter("pQuantity");
                String unitOfMeasure = request.getParameter("pMeasure");
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
int i=st.executeUpdate("insert into Item(name,photo ,price, quantity, locationType, cpt, itemNumber, manufacturer, manufacturerNum, ndc,pDesc , unitOfMeasure, cTitle, vTitle)values('"+name+"','"+fileName+"','"+price+"','"+quantity+"','"+locationType+"', '"+cpt+"', '"+itemNumber+"', '"+manufacturer+"', '"+manufacturerNum+"', '"+ndc+"', '"+pDesc+"', '"+unitOfMeasure+"','"+catId+"', '"+vendor+"')");
session.setAttribute("message", "Item added successfully!");
response.sendRedirect("admin.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>




