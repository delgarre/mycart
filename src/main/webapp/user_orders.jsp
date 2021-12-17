<%@page import="com.learn.mycart.helper.FactoryProvider"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.OrderHistoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.OrderHistory"%>
<%
    User user = (User)session.getAttribute("current-user");
    
    
    
    if(user==null){
        session.setAttribute("message", "You are not logged in!");
        response.sendRedirect("index.jsp");
        return;
    }
%>
<%
String id = request.getParameter("id");
String name = user.getUserName();
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
ResultSet resultSet2 = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from OrderHistory where locations = '"+id+"' and date = '"+session.getAttribute("date")+"'";

resultSet = statement.executeQuery(sql);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
        <%@include file="components/common_css_js.jsp" %>
        
<script>
   // Quick and simple export target #table_id into a csv
function download_table_as_csv(table_id, separator = ',') {
    // Select rows from table_id
    var rows = document.querySelectorAll('table#' + table_id + ' tr');
    // Construct csv
    var csv = [];
    for (var i = 0; i < rows.length; i++) {
        var row = [], cols = rows[i].querySelectorAll('td, th');
        for (var j = 0; j < cols.length; j++) {
            // Clean innertext to remove multiple spaces and jumpline (break csv)
            var data = cols[j].innerText.replace(/(\r\n|\n|\r)/gm, '').replace(/(\s\s)/gm, ' ')
            // Escape double-quote with double-double-quote (see https://stackoverflow.com/questions/17808511/properly-escape-a-double-quote-in-csv)
            data = data.replace(/"/g, '""');
            // Push escaped string
            row.push('"' + data + '"');
        }
        csv.push(row.join(separator));
    }
    var csv_string = csv.join('\n');
    // Download it
    var filename = 'approved_' + '' + 'order_' + new Date().toLocaleDateString() + '.csv';
    var link = document.createElement('a');
    link.style.display = 'none';
    link.setAttribute('target', '_blank');
    link.setAttribute('href', 'data:text/csv;charset=utf-8,' + encodeURIComponent(csv_string));
    link.setAttribute('download', filename);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
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
        <%@include file="components/orders_navbar.jsp" %>
        <div class="center">
            <div class="table-responsive-sm mt-3">
                <h2>ORDER FOR <%=id%></h2>
                <br>
                <h2>Report:</h2>
                <a href="#" onclick="download_table_as_csv('my_id_table_to_export');">
                    <button class="btn btn-info">
                    DOWNLOAD AS CSV
                    </button>
                </a>
                <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
                </div>
                <table id="my_id_table_to_export" class="table table-bordered " >
                    <tr>
                     
                        <th>ITEM</th>
                        <th>DESCRIPTION</th>
                        <th>VENDOR</th>
                        <th>COST</th>
                        <th>ORDERED BY</th>
                        <th>DEPARTMENT</th>
                        <th>LOCATION</th>
                        
                        <th>QTY ORDERED</th>
                    
                    </tr>
                    <%
                     
                     while(resultSet.next()){
                         
                  
                     String names = resultSet.getString("itemNumber");
                     String price = resultSet.getString("aPrice");
                     String quantity = resultSet.getString("quantity");
                     String date = resultSet.getString("date");
                     String desc = resultSet.getString("pDesc");
                     String locations = resultSet.getString("locations");
                     String cName = resultSet.getString("cName");
                     String vendor = resultSet.getString("vTitle");
                     String department = resultSet.getString("department");
                    %>
                    
                    
                    
                    <tr>
                 
                        <td><%= names%></td>
                        <td><%=desc%></td>
                        <td><%=vendor%></td>
                        <td><span>$<%= price%></span></td>
                        <td><%=cName%></td>
                        <td><%=department%></td>
                        <td><%= locations%></td>
                        
                        <td><%=quantity%></td>
                       
                        
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        </div>
                

<%

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
    </body>
</html>
