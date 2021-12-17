<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String date1 = request.getParameter("date1");
String date2 = request.getParameter("date2");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://172.20.29.70:3306/";
String database = "mycart";
String userid = "admin";
String password = "ordering";
String query = "select OrderHistory.id, OrderHistory.cName, Company.companyName, OrderHistory.locations,"
        + " Company.states, Company.zip, Company.address1, Company.address2, Company.city, Company.states, Company.zip, Company.account_id, Company.phone, Company.country_code, OrderHistory.vTitle, OrderHistory.quantity, OrderHistory.orderId, OrderHistory.first_name, OrderHistory.last_name, OrderHistory.itemNumber"
        + " from OrderHistory inner join Company on OrderHistory.locations = Company.companyName where date between '"+date1+"' and '"+date2+"' and vTitle = 'MEYER DC'";
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
String sql =query;
resultSet = statement.executeQuery(sql);
System.out.println(query);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MEYER DC</title>
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
    var filename = 'meyer_dc' + '_' + new Date().toLocaleDateString() + '.csv';
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
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>REPORT:</h1>
        <div class="center">
            <div id="error" class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <a href="#" onclick="download_table_as_csv('my_id_table_to_export');">
                    <button class="btn btn-info">
                    DOWNLOAD AS CSV
                    </button>
            </a><br>
            <br>
            <button class="btn btn-warning" onclick="goBack()">GO BACK</button><br>
            <br>
            <a href="edit_meyer_dc.jsp">
                <button class="btn btn-secondary">EDIT REPORT</button>
            </a>
            <table id="my_id_table_to_export" class="table table-bordered ">
                <tr>
                    <th>Account_id</th>
                    <th>Id</th>
                    <th>shipping_method</th>
                    <th>order_line_id</th>
                    <th>quantity</th>
                    <th>sku</th>
                    
                    <th>operations_confirm_order</th>
                    <th>operations_email_confirmation</th>
                    <th>first_name</th>
                    <th>last_name</th>
                    <th>address1</th>
                    <th>address2</th>
                    <th>phone</th>
                    <th>city</th>
                    <th>postalcode</th>
                    
                    <th>province_code</th>
                    <th>country_code</th>
                </tr>
                <tr>
                    <%
                    while(resultSet.next()){
                        String quantity = resultSet.getString("quantity");
                      
                        String itemNumber = resultSet.getString("itemNumber");
                        String orderId = resultSet.getString("orderId");
                     
                        String account_id = resultSet.getString("account_id");
                        
                        String address1 = resultSet.getString("address1");
                        String address2 = resultSet.getString("address2");
                        String city = resultSet.getString("city");
                        String cName = resultSet.getString("cName");
                        String first_name = resultSet.getString("first_name");
                        String last_name = resultSet.getString("last_name");
                        String zip = resultSet.getString("zip");
                        String states = resultSet.getString("states");
                        
                        String phone = resultSet.getString("phone");
                        String country_code = resultSet.getString("country_code");
                     
                    %>
                    <td><%=account_id%></td>
                    <td><%=orderId%></td>
                    <td>Standard</td>
                    <td></td>
                    <td><%=quantity%></td>
                    <td><%=itemNumber%></td>
                   
                    <td>True</td>
                    <td>diane.madonna@dseincorporated.com</td>
                    <td><%=first_name%></td>
                    <td><%=last_name%> </td>
                    <td><%=address1%></td>
                    <td><%=address2%></td>
                    <td><%=phone%></td>
                    <td><%=city%></td>
             
                    
                    <td><%=zip%></td>
                    <td><%=states%></td>
                    <td><%=country_code%></td>
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
