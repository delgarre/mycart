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
    String itemsList="";
String items[]=request.getParameterValues("new");
if(items == null){
    response.sendRedirect("a_locations_item_desc_report.jsp");
    session.setAttribute("message", "Item Number required!");
}
        for(int i=0;i < items.length; i++){
            itemsList += items[i] + ","; 
                }
    
    String pDescs = request.getParameter("pDesc");
String date1 = request.getParameter("date1");
String date2 = request.getParameter("date2");
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
String sql ="select * from OrderHistory where date between '"+date1+"' and '"+date2+"' and pDesc like '%"+pDescs+"%' and FIND_IN_SET(itemNumber,'"+itemsList+"' )";
System.out.println(sql);
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
    var filename = 'export_' + 'order' + '_' + 'report' + new Date().toLocaleDateString() + '.csv';
    var link = document.createElement('a');
    link.style.display = 'none';
    link.setAttribute('target', '_blank');
    link.setAttribute('href', 'data:text/csv;charset=utf-8,' + encodeURIComponent(csv_string));
    link.setAttribute('download', filename);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

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
    <%
    Date today = new Date();
    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
    String ddMMyyyyToday = DATE_FORMAT.format(today);
    %>
    <body>
           <%@include file="components/navbar.jsp" %>
           
        <div class="center">
            <h1>REPORT:</h1>
            <a href="#" onclick="download_table_as_csv('my_id_table_to_export');">
                    <button class="btn btn-info">
                    DOWNLOAD AS CSV
                    </button>
            </a><br>
            <br>
            <button class="btn btn-warning" onclick="goBack()">GO BACK</button><br>
            <table id="my_id_table_to_export" class="table table-bordered ">
              
                 <tr>
                    <th>APPROVAL DATE</th>
                    <th>ITEM NUMBER</th>
                    <th>DESCRIPTION</th>
                    <th>COST</th>
                    <th>QUANTITY</th>
                    <th>LOCATION</th>
                    <th>VENDOR</th>
                    <th>CATEGORY</th>
                </tr>
                
                  <tr>
                   <%
                    while(resultSet.next()){
                        
                        
                        String itemNumber = resultSet.getString("itemNumber");
                        String date = resultSet.getString("date");
                        String quantity = resultSet.getString("quantity");
                        String pDesc = resultSet.getString("pDesc");
                        String vTitle = resultSet.getString("vTitle");
                        String cTitle = resultSet.getString("cTitle");
                        String price = resultSet.getString("aPrice"); 
                        String locations = resultSet.getString("locations");
                    %>
                    

                    <td><%=date%></td>
                    <td><%=itemNumber%></td>
                    <td><%=pDesc%></td>
                    <td><span>$<%=price%></span></td>
                    <td><%=quantity%></td>
                    <td><%=locations%></td>
                    <td><%=vTitle%></td>
                    <td><%=cTitle%></td>
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
