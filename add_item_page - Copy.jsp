
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
String sql ="select * from Types order by locationType";
resultSet = statement.executeQuery(sql);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Item</title>
        <%@include file="components/common_css_js.jsp" %>
        <script>
            
            $('.add').on('click', add);
$('.remove').on('click', remove);

function add() {
  var new_chq_no = parseInt($('#total_chq').val()) + 1;
  var new_input = "<input type='text' id='new_" + new_chq_no + "' name='new'>";

  $('#new_chq').append(new_input);

  $('#total_chq').val(new_chq_no);
}

function remove() {
  var last_chq_no = $('#total_chq').val();

  if (last_chq_no > 1) {
    $('#new_' + last_chq_no).remove();
    $('#total_chq').val(last_chq_no - 1);
  }
}
        </script>  
        
<script>
    function goBack(){
        window.history.back();
    } 
</script>
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
        <h1>ADD ITEM:</h1>
        <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
        </div>
         <a href="item_list.jsp">
        <button class="btn btn-outline-info">ITEMS LIST</button>
       
         </a><br>
        <br>
        <a href="add_man_item.jsp">
            <button class="btn btn-outline-warning">ADD MANUFACTURER</button>
        </a><br>
        <br>
        <a href="add_cat_item.jsp">
            <button class="btn btn-outline-warning">ADD CATEGORY</button>
        </a><br>
        <br>
        <a href="add_ven_item.jsp">
            <button class="btn btn-outline-warning">ADD VENDOR</button>
        </a><br>
        <br>
        <button class="btn btn-success" onclick="add()">ADD ALT</button>
        <button class="btn btn-danger" onclick="remove()">REMOVE ALT</button><br>
        <br>
         <form action="AddItemServlet" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="operation" value="addproduct"/>
                    <!--product Item number -->
                    <div>
                        <h6>ENTER ITEM NUMBER</h6>
                        <input type="text" placeholder="Enter Item Number" class="form-control" name="itemNumber" required spellcheck="true"/>
                    </div>
                    
                    
                    <!--product description-->
                    <div class="form-group">
                        <h6>ENTER DESCRIPTION</h6>
                        <textarea style="height: 100px" class="form-control" placeholder="Enter product description" name="pDesc" required spellcheck="true"></textarea>
                    </div>
                     <!--alternate Item-->
                    <div class="form-group">
                        <h6>ENTER ALTERNATE ITEM</h6>
                        <div id="new_chq"></div>
                        <input type="hidden" value="1" id="total_chq" name="total_chq">
                    </div>
                    <!--product price-->
                    <div class="form-group">
                        <h6>ENTER ITEM COST($)</h6>
                        <input type="number" step="any" class="form-control" placeholder="Enter price of product" name="pPrice" required/>
                    </div>
                    <!--product quantity-->
                    <div class="form-group">
                        <h6>ENTER QUANTITY PER UOM</h6>
                        <input type="number" placeholder="Enter product quantity" class="form-control" name="pQuantity" required/>
                    </div>
                    <%
                    UOMDao uDao = new UOMDao(FactoryProvider.getFactory());
                    List<UOM> uList = uDao.getMeasurements();
                    

                    %>
                    <!--product uOfMeasure-->
                    <div class="form-group">
                        <h6>SELECT UNIT OF MEASURE</h6>
                <select name="pMeasure" id="pMeasure" class="form-control">
                    
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
                        <h6>SELECT CPT CODE</h6>
                      
               <select name="cpt" id="cpt" class="form-control">
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
                        <h6>ENTER NDC NUMBER</h6>
                        <input type="text" class="form-control" placeholder="Enter NDC Number" name="ndc" id="ndc"/>
                       
                    </div>
                    
                   
                    
                    <!--product manufacturer  -->
                    <%
                    ManDAO mDao = new ManDAO(FactoryProvider.getFactory());
                    List<Manufacturers> mlist = mDao.getManufacturers();
                    %>
                    <div>
                        <h6>SELECT MANUFACTURER</h6>
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
                        <input type="text" class="form-control" placeholder="Enter Manufacturer Number" name="manufacturerNum" required/>
                    </div>
                    
                    <!-- contactInfo -->
                    <div class="form-group">
                        <h6>REQUEST CONTACT INFO</h6>
                        <select class="form-control" name="contactInfo" id="contactInfo">
                <option value="No">No</option>
                <option value="Yes">Yes</option>
            </select>
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
                            
                            <div class="form-group">
                                <h6>SELECT LOCATION TYPE</h6>
                                <input type="checkbox" name="location" value="ADMINISTRATOR" checked>ADMINISTRATOR<br>  
                <%
                    while(resultSet.next()){
                        
                        String company = resultSet.getString("locationType");
                        
                    %>
                              
                    <input type="checkbox" name="location" value="<%=company%>"><%=company%><br>
                               
                            
                                <%
                                    }
                                %>
                            </div>
                        </div>
                            
                            
                        
                  
                    <div class="form-group">
                        <label for="file">SELECT PICTURE OF ITEM</label>
                        <br>
                        <input type="file" id="file" name="file" size="50"/>
                        
                        
                        
                        
                    </div>
                    
                    <!--product notes-->
                    <div class="form-group">
                        <h6>SPECIAL INSTRUCTIONS</h6>
                        <textarea style="height: 100px" placeholder="Enter product notes" class="form-control" name="notes" spellcheck="true"></textarea>
                    </div>
                        <!-- sds -->
                    <div class="form-group">
                        <label for="sds">Select SDS:</label>
                        <br>
                        <input type="file" id="sds" name="sds" size="50"/>
                    </div>
                    
                    
                   
                    <!--submit button-->
                    <div class="container text-center">
                        <button class="btn btn-outline-success">SAVE NEW ITEM</button>
                        
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
