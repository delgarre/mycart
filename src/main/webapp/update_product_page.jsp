<%-- 
    Document   : add_item_page
    Created on : Jan 19, 2021, 2:11:52 PM
    Author     : garre
--%>

<%@page import="com.learn.mycart.entities.UOM"%>
<%@page import="com.learn.mycart.dao.UOMDao"%>
<%@page import="com.learn.mycart.entities.CPT"%>
<%@page import="com.learn.mycart.dao.CptDAO"%>
<%@page import="com.learn.mycart.entities.Manufacturers"%>
<%@page import="com.learn.mycart.dao.ManDAO"%>
<%@page import="com.learn.mycart.entities.Vendor"%>
<%@page import="com.learn.mycart.dao.VendorDao"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.dao.CompanyDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.Company"%>

<%
    Company company1 = (Company)session.getAttribute("location");
    
    
    User user = (User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message", "You are not logged in!");
        response.sendRedirect("index.jsp");
        return;
    }
    else
    {
        if(user.getUserType().equals("normal"))
        {
            session.setAttribute("message", "Admin level required!");
            response.sendRedirect("index.jsp");
            return;
        }
    }
%>

<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://172.20.29.70:3306/";
String database = "mycart";
String userid = "admin";
String password = "ordering";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from Item where id = "+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Item</title>
        <%@include file="components/common_css_js.jsp" %>
        
<style>
.center {
  margin: auto;
  width: 60%;
  border: navy;
  padding: 10px;
}
</style>
    </head>
    <body>
         <%@include file="components/navbar.jsp" %>
         <div class="center">
             <%@include file="components/message.jsp" %>
        <h1>MANAGE INVENTORY:</h1>
        
         <input type="hidden" name="operation" value="addcategory">
         
         <form action="update_product.jsp" method="post">
             <input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
<input type="hidden" name="date">
                  
                    <!--product Item number -->
                    <div>
                        <h6>ENTER ITEM NUMBER</h6>
                        <input type="text" class="form-control" placeholder="Enter Item Number" name="itemNumber" value="<%=resultSet.getString("itemNumber")%>" readonly/>
                    </div>
                    
                    
                    <!--product description-->
                    <div class="form-group">
                        <h6>ENTER DESCRIPTION</h6>
                        <input  type="text" class="form-control" placeholder="Enter product description" name="pDesc" value="<%=resultSet.getString("pDesc")%>" spellcheck="true"></textarea>
                    </div>
                    <!--product price-->
                    <div class="form-group">
                        <h6>ENTER ITEM COST</h6>
                        <input type="number" step="any" class="form-control" placeholder="Enter price of product" name="pPrice"value="<%=resultSet.getString("price")%>"/>
                    </div>
                    <!--product quantity-->
                    <div class="form-group">
                        <h6>ENTER QUANTITY PER UOM</h6>
                        <input type="number" class="form-control" placeholder="Enter product quantity" name="pQuantity" value="<%=resultSet.getString("quantity")%>"/>
                    </div>
                     <%
                    UOMDao uDao = new UOMDao(FactoryProvider.getFactory());
                    List<UOM> uList = uDao.getMeasurements();
                    %>
                    <!--product uOfMeasure-->
                    <div class="form-group">
                        <h6>SELECT UNIT OF MEASURE</h6>
                <select name="pMeasure" id="pMeasure">
                    
                    <%
                    for(UOM u: uList){
                    %>
                <option value="<%=u.getVal()%>"><%=u.getVal()%></option>
                
           <%
               }
           %>
                
            </select>
                    </div>
                    <!--product cpt -->
                    <%
                    CptDAO cpDao = new CptDAO(FactoryProvider.getFactory());
                    
                    List<CPT> cplist = cpDao.getCodes();
                    
                    %>
                    
                    
                    <div>
                        <h6>ENTER CPT</h6>
                      
               <select name="cpt" id="cpt">
                   <%
                   for(CPT cp: cplist){
                   %>
                <option value="<%=cp.getCodes()%>"><%=cp.getCodes()%></option>


                    <%
                        }
                    %>
           
                
            </select>
                    </div>
                    <div>
                        <h6>ENTER NDC</h6>
                    
                            <input type="text" name="ndc" value="<%=resultSet.getString("ndc")%>">
                        
                    </div>
                    
                    <!--alternate Item-->
                    <div>
                        <h6>ENTER ALTERNATE ITEM</h6>
                        <input type="text" class="form-control" placeholder="Enter Alternate Item" name="alt" value="<%=resultSet.getString("alternateItem")%>"/>
                    </div>
                    
                    <!--product manufacturer  -->
                    <%
                    ManDAO mDao = new ManDAO(FactoryProvider.getFactory());
                    List<Manufacturers> mlist = mDao.getManufacturers();
                    %>
                    <div>
                        <h6>ENTER MANUFACTURER</h6>
                        <select name="manufacturer" class="form-control" id="manufacturer">
                            <%
                            for(Manufacturers m: mlist){
                            %>
                            <option value="<%=m.getName()%>"><%=m.getName()%></option>
                            <%
                                }
                            %>
                        </select>
                       
                    </div>
                    <!--product manufacturerNum -->
                    <div>
                        <h6>ENTER MANUFACTURER #</h6>
                        <input type="text" class="form-control" placeholder="Enter Manufacturer Number" name="manufacturerNum" value="<%=resultSet.getString("manufacturerNum")%>"/>
                    </div>
                    <!--product category-->
                    <%
                        
                    CategoryDao cDao=new CategoryDao(FactoryProvider.getFactory());
                    List<Category> list = cDao.getCategories();

                    %>
                    <div class="form-group">
                        <h6>SELECT CATEGORY</h6>
                        <select name="catId" class="form-control" id="catId">
                            
                            <%
                                for(Category c: list){
                            %>
                            <option value="<%= c.getCategoryTitle() %>"><%= c.getCategoryTitle() %> </option>
                            
                            <%
                                }
                            %>
                        </select>
                    </div>
                        <!--product vendor-->
                        <%
                            VendorDao vDao = new VendorDao(FactoryProvider.getFactory());
                            List<Vendor> vList = vDao.getVendors();
                        %>
                        <div class="form-group">
                            <h6>SELECT VENDOR</h6>
                            <select name="vendorId" class="form-control" id="vendorId">
                                <%
                                for(Vendor v: vList){
                                %>
                                <option value="<%=v.getVendorName()%>"> <%= v.getVendorName()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                            <!--
                            <div class="form-group">
                                <h6>Select Location Type</h6>
               
                                <input type="checkbox" name="location" value="OFFICE">OFFICE<br>
                                <input type="checkbox" name="location" value="JACKSONVILLE ONLY">JACKSONVILLE ONLY<br>
                                <input type="checkbox" name="location" value="OFFICE-ADMIN">OFFICE-ADMIN<br>
                                <input type="checkbox" name="location" value="DIVERSIFIED SERVICE ENTERPRISES INC">DIVERSIFIED SERVICE ENTERPRISES INC<br>
                                <input type="checkbox" name="location" value="FROG HOP">FROG HOP<br>
                                <input type="checkbox" name="location" value="HOTELS">HOTELS<br>
                                <input type="checkbox" name="location" value="PHARMACY">PHARMACY<br>
                                <input type="checkbox" name="location" value="WEST COAST LAW">WEST COAST LAW<br>
                                <input type="checkbox" name="location" value="1ST HEALTH INC">1ST HEALTH INC<br>
                                <input type="checkbox" name="location" value="PHYSICIANS GROUP LLC">PHYSICIANS GROUP LLC<br>
                                <input type="checkbox" name="location" value="PHYSICIANS GROUP(MN)LLC">PHYSICIANS GROUP(MN)LLC<br>
                                <input type="checkbox" name="location" value="IT-SUPPLIES">IT-SUPPLIES<br>
                                <input type="checkbox" name="location" value="HIMES-ONLY">HIMES-ONLY<br>
                                <input type="checkbox" name="location" value="PHYSICIANS GROUP LLC-HAND SANITIZER">PHYSICIANS GROUP LLC-HAND SANITIZER<br>
                                <input type="checkbox" name="location" value="PAIN MANAGEMENT">PAIN MANAGEMENT<br>
                                <input type="checkbox" name="location" value="PALM INSURE">PALM INSURE<br>
                                <input type="checkbox" name="location" value="ORTHOPEDIC">ORTHOPEDIC<br>
                                <input type="checkbox" name="location" value="LUCKY SPOT">LUCKY SPOT<br>
                            </div>
                            -->
                        
                            
                            
                            
                  
                    <div class="form-group">
                        <label for="stat">ACTIVE/DISCONTINUED</label>
                        <select name="stat" id="stat" class="form-control">
                            <option value="1">Active</option>
                            <option value="2">Discontinued</option>
                        </select>
                    </div>
                    <!--product notes-->
                    <div class="form-group">
                        <h6>SPECIAL INSTRUCTIONS</h6>
                        <input class="form-control" value="<%=resultSet.getString("notes")%>" name="notes" spellcheck="true">
                    </div>
                     <!--   
                        
                    </div>
                    <div class="form-group">
                        <label for="sds">Select SDS:</label>
                        <br>
                        <input type="file" id="sds" name="sds" size="50"/>
                    </div>
                    
                    
                   -->
                    <!--submit button-->
                    <div class="container text-center">
                        <button onclick="return confirm('Are you sure?');" class="btn btn-outline-success">SAVE CHANGES</button>
                        
                    </div>
                    
                  
         </form>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
         </div>
    </body>
</html>
