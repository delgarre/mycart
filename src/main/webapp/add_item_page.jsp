
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
String sql ="select * from L_Company";
resultSet = statement.executeQuery(sql);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Item</title>
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
        <h1>Info:</h1>
        
         <input type="hidden" name="operation" value="addcategory">
         
         <form action="AddItemServlet" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="operation" value="addproduct"/>
                    <!--product Item number -->
                    <div>
                        <h6>Enter Item Number</h6>
                        <input type="text" class="form-control" placeholder="Enter Item Number" name="itemNumber" required/>
                    </div>
                    
                    
                    <!--product description-->
                    <div class="form-group">
                        <h6>Enter Description</h6>
                        <textarea style="height: 100px" class="form-control" placeholder="Enter product description" name="pDesc" required></textarea>
                    </div>
                    <!--product price-->
                    <div class="form-group">
                        <h6>Enter Item Cost</h6>
                        <input type="number" step="any" class="form-control" placeholder="Enter price of product" name="pPrice" required/>
                    </div>
                    <!--product quantity-->
                    <div class="form-group">
                        <h6>Enter Quantity Per UOM</h6>
                        <input type="number" class="form-control" placeholder="Enter product quantity" name="pQuantity" required/>
                    </div>
                    <%
                    UOMDao uDao = new UOMDao(FactoryProvider.getFactory());
                    List<UOM> uList = uDao.getMeasurements();
                    

                    %>
                    <!--product uOfMeasure-->
                    <div class="form-group">
                        <h6>Select Unit of Measure</h6>
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
                    
                    
                    <div class="form-group">
                        <h6>Select CPT Code</h6>
                      
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
                    <div class="form-group">
                        <h6>Enter NDC Number</h6>
                        <input type="text" class="form-control" placeholder="Enter NDC Number" name="ndc" id="ndc"/>
                       
                    </div>
                    
                    <!--alternate Item-->
                    <div class="form-group">
                        <h6>Enter Alternate Item</h6>
                        <input type="text" class="form-control" placeholder="Enter Alternate Item" name="alt"/>
                    </div>
                    
                    <!--product manufacturer  -->
                    <%
                    ManDAO mDao = new ManDAO(FactoryProvider.getFactory());
                    List<Manufacturers> mlist = mDao.getManufacturers();
                    %>
                    <div>
                        <h6>Select Manufacturer</h6>
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
                        <h6>Enter Manufacturer #</h6>
                        <input type="text" class="form-control" placeholder="Enter Manufacturer Number" name="manufacturerNum" required/>
                    </div>
                    <!--product category-->
                    <%
                        
                    CategoryDao cDao=new CategoryDao(FactoryProvider.getFactory());
                    List<Category> list = cDao.getCategories();

                    %>
                    <div class="form-group">
                        <h6>Select Category:</h6>
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
                            <h6>Select Vendor:</h6>
                            <select name="vendorId" class="form-control" id="vendorId">
                                <%
                                for(Vendor v: vList){
                                %>
                                <option value="<%=v.getVendorName()%>"> <%= v.getVendorName()%></option>
                                <%
                                    }
                                %>
                            </select>
                            
                            <div class="form-group">
                                <h6>Select Location Type</h6>
                <%
                    while(resultSet.next()){
                        
                        String company = resultSet.getString("company");
                        
                    %>
                                <input type="checkbox" name="location" value="<%=company%>"><%=company%><br>
                               
                            
                                <%
                                    }
                                %>
                            </div>
                        </div>
                            
                            
                        
                  
                    <div class="form-group">
                        <label for="file">Select picture of product:</label>
                        <br>
                        <input type="file" id="file" name="file" size="50"/>
                        
                        <input type="file" id="file" name="file"/>
                        
                        
                    </div>
                        <!--
                    <div class="form-group">
                        <label for="sds">Select SDS:</label>
                        <br>
                        <input type="file" id="sds" name="sds" size="50"/>
                    </div>
                    
                    
                   -->
                    <!--submit button-->
                    <div class="container text-center">
                        <button class="btn btn-outline-success">Add Item</button>
                        
                    </div>
                    
                  
         </form>
         </div>
<%

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
    </body>
</html>
