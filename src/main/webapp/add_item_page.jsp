
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </body>
</html>
