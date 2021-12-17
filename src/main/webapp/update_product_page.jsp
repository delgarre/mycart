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

String driver6 = "com.mysql.jdbc.Driver";
String connectionUrl6 = "jdbc:mysql://172.20.29.70:3306/";
String database6 = "mycart";
String userid6 = "admin";
String password6 = "ordering";
try {
Class.forName(driver6);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection6 = null;
Statement statement6 = null;
ResultSet resultSet6 = null;
%>
<%
try{
connection6 = DriverManager.getConnection(connectionUrl6+database6, userid6, password6);
statement6=connection6.createStatement();


%>

<%
    String search = request.getParameter("name");
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
String itemNumber = resultSet.getString("itemNumber");
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
             <input type="hidden" name="id" value="<%=search %>">
        <h1>MANAGE INVENTORY:</h1>
        <a href="item_list.jsp?itemNumber=<%=itemNumber%>">
        <button class="btn btn-warning">Go Back</button>
       
        </a>
        <a href="update_sds.jsp?id=<%=id%>">
        <button class="btn btn-info">CHANGE SDS</button>
       
        </a>
        <a href="update_photo.jsp?id=<%=id%>">
        <button class="btn btn-primary">CHANGE IMAGE</button>
       
        </a>
         <form action="UpdateItem" method="post" enctype="multipart/form-data">
             <input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
             <input type="hidden" name="stat" value="<%=resultSet.getString("stat") %>">
<input type="hidden" name="date">
                  
                    <!--product Item number -->
                    <div>
                        <h6>ENTER ITEM NUMBER</h6>
                        <input type="text" class="form-control" placeholder="Enter Item Number" name="itemNumber" value="<%=itemNumber%>"/>
                    </div>
                    
                    
                    <!--product description-->
                    <div class="form-group">
                        <h6>ENTER DESCRIPTION</h6>
                        <textarea  type="text" class="form-control" placeholder="Enter item description" name="pDesc" value="<%=resultSet.getString("pDesc")%>" spellcheck="true"><%=resultSet.getString("pDesc")%></textarea>
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
                    
                                        <!-- sds 
                    <div class="form-group">
                        <label for="sds">Select SDS:</label>
                        <input type="text" class="form-control" value="<%=resultSet.getString("sds")%>"/>
                    </div>
                        <div class="form-group">
                        <input type="file" id="sds" name="sds" />
                    </div>
                    -->
                    
                     <!--photo 
                    <div class="form-group">
                        <label for="file">SELECT PICTURE OF ITEM</label>
                        <input class="form-control" type="text" value="<%=resultSet.getString("photo")%>"/>
                        <input type="file" id="file" name="file" />
                        
                    </div>
                        -->
                <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

            <%

String ltype = request.getParameter("ltype");
String drivers5 = "com.mysql.jdbc.Driver";
String connectionUrls5 = "jdbc:mysql://172.20.29.70:3306/";
String databases5 = "mycart";
String userids5 = "admin";
String passwords5 = "ordering";
 String sql6 ="Select locationType, LocationType from Types "
         + "Where not exists ( "
         + "Select LocationType from LocationType "
         + "where FIND_IN_SET(locationType, '"+ltype+"') > 0 "
         + "and LocationType.LocationType = Types.LocationType) order by locationType";
resultSet6 = statement6.executeQuery(sql6);
try {
Class.forName(drivers5);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connections5 = null;
Statement statements5 = null;
ResultSet resultSets5 = null;

try{
connections5 = DriverManager.getConnection(connectionUrls5+databases5, userids5, passwords5);
statements5=connections5.createStatement();
String sqls ="SELECT distinct locationType FROM LocationType WHERE FIND_IN_SET(locationType,'"+ltype+"')";
resultSets5 = statements5.executeQuery(sqls);
                    
%>

                            <div class="form-group">
                                <h6>ENTER LOCATION TYPE</h6>
                                
                                <%
                                while(resultSets5.next()){
                                %>
                                
                                <input type="checkbox"  name="locationType" value="<%=resultSets5.getString("locationType")%>" id="locationType" checked/><%=resultSets5.getString("locationType")%><br>
                                
                                <%
                                    }
                                    while(resultSet6.next()){
                                %>
                                
                                <input type="checkbox" name="locationType" value="<%=resultSet6.getString("locationType")%>" id="locationType" /><%=resultSet6.getString("locationType")%><br>
                                
                                <%
                                    }
                                %>
                            </div>
<%

connections5.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
<!--product uom  -->
                                       <%
String uom = request.getParameter("uom");
String drivers4 = "com.mysql.jdbc.Driver";
String connectionUrls4 = "jdbc:mysql://172.20.29.70:3306/";
String databases4 = "mycart";
String userids4 = "admin";
String passwords4 = "ordering";
try {
Class.forName(drivers4);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connections4 = null;
Statement statements4 = null;
ResultSet resultSets4 = null;

try{
connections4 = DriverManager.getConnection(connectionUrls4+databases4, userids4, passwords4);
statements4=connections4.createStatement();
String sql ="SELECT ID,val,CASE WHEN val='" + uom + "' THEN 1	ELSE 2 END AS SortOrder FROM UOM ORDER BY SortOrder, val";
resultSets4 = statements4.executeQuery(sql);
              
%>
                    <div>
                        <h6>SELECT UOM</h6>
                                <select name="pMeasure" id="pMeasure" class="form-control">
                                    <%
                                    while(resultSets4.next()){
                                    %>
                                    <option value="<%=resultSets4.getString("val")%>"><%=resultSets4.getString("val")%></option>
                                <%
                                    }
                                %>
                                </select>
                    </div>
 
<%

connections4.close();
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
String sql ="SELECT ID,name,CASE WHEN name='" + man + "' THEN 1	ELSE 2 END AS SortOrder FROM Manufacturers ORDER BY SortOrder, name";
resultSets1 = statements1.executeQuery(sql);
                    
%>
                    <div>
                        <h6>SELECT MANUFACTURER</h6>
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
String sql ="SELECT ID,codes,CASE WHEN codes='" + code + "' THEN 1 ELSE 2 END AS SortOrder FROM CPT ORDER BY SortOrder, codes";
resultSets = statements.executeQuery(sql);
                    
%>
                    <div>
                        <h6>SELECT CPT</h6>
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
String sql ="SELECT categoryId,categoryTitle,CASE WHEN categoryTitle='" + categoryTitle + "' THEN 1	ELSE 2 END AS SortOrder FROM Category ORDER BY SortOrder, categoryTitle";
resultSets2 = statements2.executeQuery(sql);
                    
%>
                    <div class="form-group">
                        <h6>SELECT CATEGORY</h6>
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
String sqls ="SELECT vendorId,vendorName,CASE WHEN vendorName='" + vendorName + "' THEN 1	ELSE 2 END AS SortOrder FROM Vendor ORDER BY SortOrder, vendorName";
resultSets3 = statements3.executeQuery(sqls);
                    
%>
                        <div class="form-group">
                            <h6>SELECT VENDOR</h6>
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
                        
                        
                <div class="form-group">
                        <h6>REQUEST CONTACT INFO</h6>
                        <select name="contactInfo" class="form-control" id="contactInfo">
                <option value="No">No</option>
                <option value="Yes">Yes</option>
            </select>
                    </div>
                    
                    
                   
                    <!--submit button-->
                    <div class="container text-center">
                        <button onclick="return confirm('Are you sure?');" class="btn btn-outline-success">SAVE CHANGES</button>
                        
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
