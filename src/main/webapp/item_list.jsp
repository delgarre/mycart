
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ItemDao"%>
<%@page import="com.learn.mycart.entities.Item"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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

<%

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
String sql ="select * from Item";
resultSet = statement.executeQuery(sql);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Items List</title>
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

    <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search Item Number" onkeyup="searchFunction()" aria-label="Search" id="myInput">
    </form>

        <h1>List of Items</h1>
        <div class="col-md-8">
        <table class="table table-bordered" id="myTable">
            <tr>
                        
                        
                        
                        <th>QTY Per UOM</th>

                        <th>Price</th>
                        <th>Item Number</th>
                        <th>Unit of Measure</th>
                        <th>Description</th>
                        <th>Vendor</th>
                        <th>Category</th>
                        <th>Manufacturer</th>
                        <th>Manufacturer Number</th>
                        <th>CPT</th>
                        <th>NDC</th>
                        <th>Location</th>
                        <th>Location Type</th>
                        <th>Status</th>
                        <th>Discontinued</th>
                        <th>SDS</th>
                        <th>Actions</th>
            </tr>
            <%
            while(resultSet.next()){
            Integer id = resultSet.getInt("id");        
            String price = resultSet.getString("price");
            String quantity = resultSet.getString("quantity");
            String photo = request.getParameter("photo");
            String itemNumber = resultSet.getString("ItemNumber");
            String vendor = resultSet.getString("vTitle");
            String desc = resultSet.getString("pDesc");
            String unit = resultSet.getString("unitOfMeasure");
            String man = resultSet.getString("manufacturer");
            String manNum = resultSet.getString("manufacturerNum");
            String cpt = resultSet.getString("cpt");
            String ndc = resultSet.getString("ndc");
            String stat = resultSet.getString("stat");
            String location = resultSet.getString("location");
            String locationType = resultSet.getString("locationType");
            String disc = request.getParameter("discontinued");
            String cat = request.getParameter("cTitle");
            String sds = request.getParameter("sds");
            %>
            
            <tr>



                <td><%=quantity%></td>
               
                <td><%=price%></td>
                <td><%=itemNumber%></td>
                <td><%=unit%></td>
                <td><%=desc%></td>
                <td><%=vendor%></td>
                <td><%=cat%></td>
                <td><%=man%></td>
                <td><%=manNum%></td>
                <td><%=cpt%></td>
                <td><%=ndc%></td>
                <td><%=location%></td>
                <td><%=locationType%></td>
                <td><%=stat%></td>
                <td><%=disc%></td>
                <td><%=sds%></td>
                <td>
                    <a href="update_product_page.jsp?id=<%= id%>">
                        <button>Edit</button>
                    </a>
                    <a href="delete_prod.jsp?id=<%=id %>">
                        <button>Delete</button>
                    </a>
                </td>
                
            </tr>
            <%
                }
            %>
        </table>
        </div>
        
<%

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
    </body>
</html>
