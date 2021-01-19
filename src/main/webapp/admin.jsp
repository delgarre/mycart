<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.entities.Vendor"%>
<%@page import="com.learn.mycart.dao.VendorDao"%>
<%@page import="com.learn.mycart.entities.LocationType"%>
<%@page import="com.learn.mycart.dao.LocationTypeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="com.learn.mycart.dao.CompanyDao"%>
<%

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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <%@include file="components/common_css_js.jsp" %>
        
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container admin">
           
            
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            
            
            <div class="row mt-3">
                
                <!--first column-->
                <div class="col-md-3">
                   
                    <!--first box-->
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon">
                                
                            </div>
                            
                            <a href="users.jsp" class="card-link">Click me!</a>
                            <h3 class="text-muted">Users</h3>
                        </div>
                    </div>
                </div>
                <!--second column-->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/list.png" alt="user_icon">
                            </div>
                            <a href="categories.jsp" class="card-link">Click me!</a>
                            <h3 class="text-muted">Categories</h3>
                        </div>
                    </div>
                </div>
                <!--third column-->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/product.png" alt="user_icon">
                            </div>
                            <a href="item_list.jsp" class="card-link">Click me!</a>
                            <h3 class="text-muted">Items</h3>
                        </div>
                    </div>
                </div>
                <!--fourth box-->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/location.png" alt="user_icon">
                            </div>
                            <a href="companies.jsp" class="card-link">Click me!</a>
                            <h3 class="text-muted">Locations</h3>
                        </div>
                    </div>
                </div>
                <!--fifth row -->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/orders.png" alt="user_icon">
                            </div>
                            <a href="orders.jsp" class="card-link">Click me!</a>
                            <h3 class="text-muted">Pending Orders</h3>
                        </div>
                    </div>
                </div>
                <!--sixth row -->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/message.png" alt="user_icon">
                            </div>
                            <a href="notice.jsp" class="card-link">Click me!</a>
                            <h3 class="text-muted">Admin Notice</h3>
                        </div>
                    </div>
                </div>
                <!--seventh row -->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/vendor.png" alt="user_icon">
                            </div>
                            <a href="vendors.jsp" class="card-link">Click me!</a>
                            <h3 class="text-muted"> Vendors</h3>
                        </div>
                    </div>
                </div>
                                <!--eighth row -->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/vendor.png" alt="user_icon">
                            </div>
                            <a href="past_orders.jsp" class="card-link">Click me!</a>
                            <h3 class="text-muted"> Order History</h3>
                        </div>
                    </div>
                </div>
                
            </div>
            
            <!--second row-->
            
            <div class="row mt-3">
                <!--second row: first column-->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/category.png" alt="user_icon">
                            </div>
                            <p class="mt-2">Click here to add new category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>
                    
                </div>
                <!--second row:second column-->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/add-product-837051.png" alt="user_icon">
                            </div>
                            <p class="mt-2">Click here to add new product</p>
                            <h1 class="text-uppercase text-muted">Add Product</h1>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
        
        <!--add category modal-->
        

<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category details.</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
          <form action="ProductOperationServlet" method="post">
              
              <input type="hidden" name="operation" value="addcategory">
              
              <div class="form-group">
                  <h6>Enter Category Title</h6>
                  <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required/>                    
              </div>
                            <div class="container text-center">
                  
                  <button class="btn btn-outline-success">Add Category</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  
              </div>
              
          </form>
          
          
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>       
        
        <!--end category modal-->
        <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
        <!--product modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <!--form-->
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
                        <input type="text" class="form-control" placeholder="Enter product unit of measure" name="pMeasure" required/>
                    </div>
                    <!--product cpt -->
                    <div>
                        <h6>Enter CPT</h6>
                        <input type="text" class="form-control" placeholder="Enter CPT" name="cpt" />
                    </div>
                    <div>
                        <h6>Enter NDC</h6>
                        <input type="text" class="form-control" placeholder="Enter NDC" name="ndc"/>
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
                    
                  <form/>
                 <!--end of form--> 
              </div>
              
            </div>
          </div>
        </div>
    
  
        
        <!--End product modal-->
    </body>
</html>
