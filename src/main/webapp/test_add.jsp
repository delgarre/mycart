<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.entities.Vendor"%>
<%@page import="com.learn.mycart.dao.VendorDao"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>Hello World!</h1>
        <form method="post" action="add_item.jsp">
            <h6>Enter Item Title</h6><br>
              <input type="text" class="form-control" placeholder="Enter Title of item" name="pName"/>
              <br>
              <h6>Enter Description</h6><br>
              <textarea style="height: 100px" class="form-control" placeholder="Enter product description" name="pDesc"></textarea>
              <br>
              <h6>Enter Item Price</h6>
              <input type="number" step="any" class="form-control" placeholder="Enter price of product" name="pPrice" required/><br>
              <br>
              <h6>Enter Quantity</h6>
              <input type="number" class="form-control" placeholder="Enter product quantity" name="pQuantity" required/><br>
              <br>
              <h6>Enter Unit of Measure</h6><br>
              <input type="text" class="form-control" placeholder="Enter product unit of measure" name="pMeasure" required/>
              <br>
              <h6>Enter CPT</h6><br>
              <input type="text" class="form-control" placeholder="Enter CPT" name="cpt" required/>
              <br>
              <h6>Enter NDC</h6><br>
              <input type="text" class="form-control" placeholder="Enter NDC" name="ndc" required/>
              <br>
              <h6>Enter Item Number</h6><br>
              <input type="text" class="form-control" placeholder="Enter Item Number" name="itemNumber" required/>
              <br>
              <h6>Enter Manufacturer</h6><br>
              <input type="text" class="form-control" placeholder="Enter Manufacturer" name="manufacturer" required/>
              <br>
              <h6>Enter Manufacturer #</h6><br>
              <input type="text" class="form-control" placeholder="Enter Manufacturer Number" name="manufacturerNum" required/>
              <br>   
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
                                <select name="location" class="form-control" id="location">
                                    <option value="OFFICE">OFFICE</option>
                                    <option value="JACKSONVILLE ONLY">JACKSONVILLE ONLY</option>
                                    <option value="OFFICE-ADMIN">OFFICE-ADMIN</option>
                                    <option value="DIVERSIFIED SERVICE ENTERPRISES">DIVERSIFIED SERVICE ENTERPRISES</option>
                                    <option value="PHYSICIANS GROUP INC">PHYSICIANS GROUP INC</option>
                                    <option value="FROG HOP">FROG HOP</option>
                                    <option value="HOTELS">HOTELS</option>
                                    <option value="PHARMACY">PHARMACY</option>
                                    <option value="WEST COAST LAW">WEST COAST LAW</option>
                                </select>
                            </div>
                            <!--photos -->
                            <div class="form-group">
                        <label for="file">Select picture of product:</label>
                        <br>
                        <input type="file" id="file" name="file"/>
                        <!--
                        <input type="file" id="file" name="file"/>
                        -->
                    </div>
                        </div>
              <input type="submit" value="Add Product">
        </form>
    </body>
</html>
