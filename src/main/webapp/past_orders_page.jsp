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
String sql ="select * from OrderHistory where locations = '"+id+"' order by date desc";
resultSet = statement.executeQuery(sql);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pending Orders</title>
        <%@include file="components/common_css_js.jsp" %>
        
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});


          
    function exportTableToExcel(tableID, filename = ''){
    var downloadLink;
    var dataType = 'application/vnd.ms-excel';
    var tableSelect = document.getElementById(tableID);
    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
    
    // Specify file name
    filename = filename?filename+'.xls':'excel_data.xls';
    
    // Create download link element
    downloadLink = document.createElement("a");
    
    document.body.appendChild(downloadLink);
    
    if(navigator.msSaveOrOpenBlob){
        var blob = new Blob(['\ufeff', tableHTML], {
            type: dataType
        });
        navigator.msSaveOrOpenBlob( blob, filename);
    }else{
        // Create a link to the file
        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
    
        // Setting the file name
        downloadLink.download = filename;
        
        //triggering the function
        downloadLink.click();
    }
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
    <%
    Date today = new Date();
    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
    String ddMMyyyyToday = DATE_FORMAT.format(today);
    %>
    <body>
           <%@include file="components/navbar.jsp" %>
        <h1>Locations Waiting Approval:</h1>
        <div class="center">
            <form method="post" action="v.jsp">
             <input id="myInput"  name="ven" type="text" placeholder="Search and create report">

            <input type="submit" value="Generate Report for Vendor Only">
            </form>
            <form method="post" action="#">
           
           
             

            <input type="submit" value="Generate Report for dates">
            </form>
            <table id="tblData" class="table table-bordered ">
                <thead>  
                <tr>
                    <th>Order Number</th>
                   
                    <th>Photo</th>
                    
                    <th>Approval Date</th>
                    <th>Item Number</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Unit Of Measure</th>
                    <th>Vendor</th>
                    <th>Category</th>
                    <th>Manufacturer</th>
                    <th>Manufacturer Number</th>
                    
                </tr>
                </thead>
                <tbody id="myTable">
                <tr>
                   <%
                    while(resultSet.next()){
                        ;
                        String oId = resultSet.getString("id");
                        
                        String photo = resultSet.getString("photo");
                        String itemNumber = resultSet.getString("ItemNumber");
                        String date = resultSet.getString("date");
                        String quantity = resultSet.getString("quantity");
                        String uom = resultSet.getString("unitOfMeasure");
                        String pDesc = resultSet.getString("pDesc");
                        String vTitle = resultSet.getString("vTitle");
                        String cTitle = resultSet.getString("cTitle");
                        String man = resultSet.getString("manufacturer");
                        String manNum = resultSet.getString("manufacturerNum");
                        String price = resultSet.getString("aPrice");
                        
                    %>
                    

                    <td><%=oId%></td>
                    <td>
                        <img style="max-width: 125px" src="image/<%=photo%>" alt="user_icon">
                           
                    </td>
                    
                    <td><%=date%></td>
                    <td><%=itemNumber%></td>
                    <td><%=pDesc%></td>
                    <td><%=price%></td>
                    <td><%=quantity%></td>
                    <td><%=uom%></td>
                    <td><%=vTitle%></td>
                    <td><%=cTitle%></td>
                    <td><%=man%></td>
                    <td><%=manNum%></td>
                    
                    
                </tr>
                <%
                    }
                    
            session.setAttribute("loc", id);
            
                %>
                </tbody>
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
