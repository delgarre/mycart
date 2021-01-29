<%-- 
    Document   : add_item_page
    Created on : Jan 19, 2021, 2:11:52 PM
    Author     : garre
--%>

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
                        <h6>Enter Item Price</h6>
                        <input type="number" step="any" class="form-control" placeholder="Enter price of product" name="pPrice" required/>
                    </div>
                    <!--product quantity-->
                    <div class="form-group">
                        <h6>Enter Quantity</h6>
                        <input type="number" class="form-control" placeholder="Enter product quantity" name="pQuantity" required/>
                    </div>
                    <!--product uOfMeasure-->
                    <div>
                        <h6>Enter Unit of Measure</h6>
                <select name="pMeasure" id="pMeasure">
                <option value="BOX (BX)">BOX (BX)</option>
                <option value="PACK (PK)">PACK (PK)</option>
                <option value="EACH (EA)">EACH (EA)</option>
                <option value="PADS">PADS</option>
                <option value="CASE (CS)">CASE (CS)</option>
                <option value="SHEETS (SHT)">SHEETS (SHT)</option>
                <option value="ROLL (RL)">ROLL (RL)</option>
                <option value="EA">EA</option>
                <option value="COUNT (CT)">COUNT (CT)</option>
                <option value="DOZEN (DZ)">DOZEN (DZ)</option>
                <option value="BOTTLE (BT)">BOTTLE (BT)</option>
                <option value="GRAM (gm)">GRAM (gm)</option>
                <option value="CARTON (CTN)">CARTON (CTN)</option>
                <option value="POUNDS (lbs)">POUNDS (lbs)</option>
                <option value="GALLON (GAL)">GALLON (GAL)</option>
                <option value="PAIR (PR)">PAIR (PR)</option>
                <option value="SET">SET</option>
                <option value="BAG (bg)">BAG (bg)</option>
                <option value="REAM">REAM</option>
                <option value="WA">WA</option>
                <option value="KILOGRAM (KG)">KILOGRAM (KG)</option>
                <option value="VIAL (VL)">VIAL (VL)</option>
                <option value="MILLILITER (ml)">MILLILITER (ml)</option>
                <option value="PIECES">PIECES</option>
                <option value="KIT">KIT</option>
           
                
            </select>
                    </div>
                    <!--product cpt -->
                    <div>
                        <h6>Enter CPT</h6>
                      
               <select name="cpt" id="cpt">
                <option value="20550">20550</option>
                <option value="20551">20551</option>
                <option value="20552">20552</option>
                <option value="20553">20553</option>
                <option value="26601">26601</option>
                <option value="76942">76942</option>
                <option value="450102-06">450102-06</option>
                <option value="A4450">A4450</option>
                <option value="A4452">A4452</option>
                <option value="A4565">A4565</option>
                <option value="A4595">A4595</option>
                <option value="A4649">A4649</option>
                <option value="A6250">A6250</option>
                <option value="A6448">A6448</option>
                <option value="A6449">A6449</option>
                <option value="A6450">A6450</option>
                <option value="A9270">A9270</option>
                <option value="A9300">A9300</option>
                <option value="ASM363711">ASM363711</option>
                <option value="E0190">E0190</option>
                <option value="E0720">E0720</option>
                <option value="E1399">E1399</option>
                <option value="L0120">L0120</option>
                <option value="L0174">L0174</option>
                <option value="L0180">L0180</option>
                <option value="L0456/L0457">L0456/L0457</option>
                <option value="L0627">L0627</option>
                <option value="L0627/L0642">L0627/L0642</option>
                <option value="L0637/L0650">L0637/L0650</option>
                <option value="L1810/L1812">L1810/L1812</option>
                <option value="L1820">L1820</option>
                <option value="L1832/L1833">L1832/L1833</option>
                <option value="L1902">L1902</option>
                <option value="L2397">L2397</option>
                <option value="L2999">L2999</option>
                <option value="L3807/ L3809">L3807/ L3809</option>
                <option value="L3908">L3908</option>
                <option value="L3915/L3916">L3915/L3916</option>
                <option value="L3923/L3924">L3923/L3924</option>
                <option value="L3960">L3960</option>
                <option value="L3999">L3999</option>
                <option value="L4360/ L4361">L4360/ L4361</option>
                <option value="N/A">N/A</option>

           
           
                
            </select>
                    </div>
                    <div>
                        <h6>Enter NDC</h6>
                        <select name="ndc" id="ndc">
                            <option value="N/A">N/A</option>
                        </select>
                    </div>
                    
                    <!--alternate Item-->
                    <div>
                        <h6>Enter Alternate Item</h6>
                        <input type="text" class="form-control" placeholder="Enter Alternate Item" name="alt"/>
                    </div>
                    
                    <!--product manufacturer  -->
                    <div>
                        <h6>Enter Manufacturer</h6>
                        <input type="text" class="form-control" placeholder="Enter Manufacturer" name="manufacturer" required/>
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
                    <!--product file-->
                    <div class="form-group">
                        <label for="file">Select picture of product:</label>
                        <br>
                        <input type="file" id="file" name="file" size="50"/>
                        <!--
                        <input type="file" id="file" name="file"/>
                        -->
                        
                    </div>
                    <div class="form-group">
                        <label for="sds">Select SDS:</label>
                        <br>
                        <input type="file" id="sds" name="sds" size="50"/>
                    </div>
                    <!--submit button-->
                    <div class="container text-center">
                        <button class="btn btn-outline-success">Add product</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                    
                  
         </form>
         </div>
    </body>
</html>
