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
             <%@include file="components/message.jsp" %>
        <h1>MANAGE INVENTORY:</h1>
        <a href="item_list.jsp">
        <button class="btn btn-warning">Go Back</button>
         <input type="hidden" name="operation" value="addcategory">
        </a>
         <form action="update_product.jsp" method="post">
             <input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
             <input type="hidden" name="stat" value="<%=resultSet.getString("stat") %>">
<input type="hidden" name="date">
                  
                    <!--product Item number -->
                    <div>
                        <h6>ENTER ITEM NUMBER</h6>
                        <input type="text" class="form-control" placeholder="Enter Item Number" name="itemNumber" value="<%=resultSet.getString("itemNumber")%>" readonly/>
                    </div>
                    
                    
                    <!--product description-->
                    <div class="form-group">
                        <h6>ENTER DESCRIPTION</h6>
                        <input  type="text" class="form-control" placeholder="Enter item description" name="pDesc" value="<%=resultSet.getString("pDesc")%>" spellcheck="true">
                    </div>
                    <!--product qty per uom-->
                    <div class="form-group">
                        <h6>ENTER QTY PER UOM</h6>
                        <input  type="text" class="form-control" placeholder="Enter item quantity" name="pQuantity" value="<%=resultSet.getString("quantity")%>" spellcheck="true">
                    </div>
                    <!--product price-->
                    <div class="form-group">
                        <h6>ENTER ITEM COST($)</h6>
                        <input type="text" class="form-control" step="any" placeholder="Enter item of product" name="pPrice" value="<%=resultSet.getString("price")%>"/>
                    </div>


                    <!--product unitOfMeasure-->
                    <div class="form-group">
                        <h6>ENTER UNIT OF MEASURE</h6>
                <input class="form-control" value="<%=resultSet.getString("unitOfMeasure")%>" name="pMeasure" id="pMeasure"/>
                    
                    </div>
                <!-- product ndc-->
                    <div>
                        <h6>ENTER NDC</h6>
                  
                            <input class="form-control" type="text" name="ndc" value="<%=resultSet.getString("ndc")%>">      
                    </div>
                    
                    <!--alternate Item-->
                    <div>
                        <h6>ENTER ALTERNATE ITEM</h6>
                        <input class="form-control" type="text" placeholder="Enter Alternate Item" name="alt" value="<%=resultSet.getString("alternateItem")%>"/>
                    </div>
                         
                            <div class="form-group">
                                <h6>ENTER LOCATION TYPE</h6>
               
                                <input class="form-control" name="locationType" value="<%=resultSet.getString("locationType")%>" id="locationType"/>
                            </div>         
                 
                    <!--product notes-->
                    <div class="form-group">
                        <h6>SPECIAL INSTRUCTIONS</h6>
                        <input class="form-control" value="<%=resultSet.getString("notes")%>" name="notes" spellcheck="true">
                    </div>
                    
                                        <!--product manufacturerNum -->
                    <div>
                        <h6>ENTER MANUFACTURER #</h6>
                        <input class="form-control" type="text" placeholder="Enter Manufacturer Number" name="manufacturerNum" value="<%=resultSet.getString("manufacturerNum")%>"/>
                    </div>
                <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

<!--product manufacturer  -->
                                       <%
String man = request.getParameter("man");
String drivers1 = "com.mysql.jdbc.Driver";
String connectionUrls1 = "jdbc:mysql://172.20.29.70:3306/";
String databases1 = "mycart";
String userids1 = "admin";
String passwords1 = "ordering";
try {
Class.forName(drivers1);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connections1 = null;
Statement statements1 = null;
ResultSet resultSets1 = null;

try{
connections1 = DriverManager.getConnection(connectionUrls1+databases1, userids1, passwords1);
statements1=connections1.createStatement();
String sql ="select * from Manufacturers order by case when name='"+man+"' then 1  else 2 end";
resultSets1 = statements1.executeQuery(sql);
                    
%>
                    <div>
                        <h6>ENTER MANUFACTURER</h6>
                                <select name="manufacturer" id="manufacturer" class="form-control">
                                    <%
                                    while(resultSets1.next()){
                                    %>
                                    <option value="<%=resultSets1.getString("name")%>"><%=resultSets1.getString("name")%></option>
                                <%
                                    }
                                %>
                                </select>
                    </div>
 
<%

connections1.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

<!--product cpt -->
                    <%
                    String code = request.getParameter("code");
String drivers = "com.mysql.jdbc.Driver";
String connectionUrls = "jdbc:mysql://172.20.29.70:3306/";
String databases = "mycart";
String userids = "admin";
String passwords = "ordering";
try {
Class.forName(drivers);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connections = null;
Statement statements = null;
ResultSet resultSets = null;

try{
connections = DriverManager.getConnection(connectionUrls+databases, userids, passwords);
statements=connections.createStatement();
String sql ="select * from CPT order by case when codes='"+code+"' then 1  else 2 end";
resultSets = statements.executeQuery(sql);
                    
%>
                    <div>
                        <h6>ENTER CPT</h6>
                 <select name="cpt" id="cpt" class="form-control">
    <%
    while(resultSets.next()){
    %>
    
    <option value="<%=resultSets.getString("codes")%>"><%=resultSets.getString("codes")%></option>
    <%
        }
    %>
</select>
                    </div>
<%

connections.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
                    
                    
                    

                    <!--product category-->
<%
String categoryTitle = request.getParameter("cTitle");
String drivers2 = "com.mysql.jdbc.Driver";
String connectionUrls2 = "jdbc:mysql://172.20.29.70:3306/";
String databases2 = "mycart";
String userids2 = "admin";
String passwords2 = "ordering";
try {
Class.forName(drivers2);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connections2 = null;
Statement statements2 = null;
ResultSet resultSets2 = null;

try{
connections2 = DriverManager.getConnection(connectionUrls2+databases2, userids2, passwords2);
statements2=connections2.createStatement();
String sql ="select * from Category order by case when categoryTitle='"+categoryTitle+"' then 1  else 2 end";
resultSets2 = statements2.executeQuery(sql);
                    
%>
                    <div class="form-group">
                        <h6>ENTER CATEGORY</h6>
                        <select name="catId" id="catId" class="form-control">
                            <%
                            while(resultSets2.next()){
                            %>
                            <option value="<%=resultSets2.getString("categoryTitle")%>"><%=resultSets2.getString("categoryTitle")%></option>
                        <%
                            }
                        %>
                        </select>
                    </div>
                        

<%

connections2.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
                        <!--product vendor-->
<%
String vendorName = request.getParameter("vTitle");
String drivers3 = "com.mysql.jdbc.Driver";
String connectionUrls3 = "jdbc:mysql://172.20.29.70:3306/";
String databases3 = "mycart";
String userids3 = "admin";
String passwords3 = "ordering";
try {
Class.forName(drivers3);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connections3 = null;
Statement statements3 = null;
ResultSet resultSets3 = null;

try{
connections3 = DriverManager.getConnection(connectionUrls3+databases3, userids3, passwords3);
statements3=connections3.createStatement();
String sql ="select * from Vendor order by case when vendorName='"+vendorName+"' then 1  else 2 end";
resultSets3 = statements3.executeQuery(sql);
                    
%>
                        <div class="form-group">
                            <h6>ENTER VENDOR</h6>
                            <select name="vendorId" id="vendorId" class="form-control">
                                <%
                                while(resultSets3.next()){
                                %>
                                <option value="<%=resultSets3.getString("vendorName")%>"><%=resultSets3.getString("vendorName")%></option>
                            <%
                                }
                            %>
                            </select>
                        </div>

<%

connections3.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
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


         </div>
    </body>
</html>
