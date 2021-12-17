<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
String sql ="select * from VendorReport";
resultSet = statement.executeQuery(sql);

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
           
            <br>
            <button class="btn btn-warning" onclick="goBack()">GO BACK</button><br>
            <br>
            <a href="add_meyer_dc.jsp">
                <button class="btn btn-primary">ADD INFO</button>
            </a><br>
            <br>
            <a href="meyer_dc.jsp">
                <button class="btn btn-success">REPORT</button>
            </a><br>
            <br>
            <table id="my_id_table_to_export" class="table table-bordered ">
                <tr>
                    <th>ACCOUNT ID</th>
                    <th>ID</th>
                    <th>SHIPPING METHOD</th>
                    <th>ORDER LINE ID</th>
                    <th>QUANTITY</th>
                    <th>SKU</th>
                    <th>OPERATIONS CONFIRM ORDER</th>
                    <th>OPERATIONS EMAIL CONFIRMATION</th>
                    <th>FIRST NAME</th>
                    <th>LAST NAME</th>
                    <th>ADDRESS 1</th>
                    <th>ADDRESS 2</th>
                    <th>PHONE</th>
                    <th>CITY</th>
                    <th>POSTAL CODE</th>
                    <th>PROVINCE CODE</th>
                    <th>COUNTRY CODE</th>
                </tr>
                <tr>
                    <%
                    while(resultSet.next()){
                        String account_id = resultSet.getString("account_id");
                        String ids = resultSet.getString("id");
                        
                        String report_id = resultSet.getString("report_id");
                        String shipping_method = resultSet.getString("shipping_method");
                        String order_line_id = resultSet.getString("order_line_id");
                        String quantity = resultSet.getString("quantity");
                        String sku = resultSet.getString("sku");
                        String operations_confirm_order = resultSet.getString("operations_confirm_order");
                        String operations_email_confirmation = resultSet.getString("operations_email_confirmation");
                        String first_name = resultSet.getString("first_name");
                        String last_name = resultSet.getString("last_name");
                        String address1 = resultSet.getString("address1");
                        String address2 = resultSet.getString("address2");
                        String city = resultSet.getString("city");
                        String phone = resultSet.getString("phone");
                        String postalcode = resultSet.getString("postalcode");
                        String province_code = resultSet.getString("province_code");
                        String country_code = resultSet.getString("country_code");
                    %>
                    <td><%=account_id%></td>
                    <td><%=report_id%></td>
                    <td><%=shipping_method%></td>
                    <td><%=order_line_id%></td>
                    <td><%=quantity%></td>
                    <td><%=sku%></td>
                    <td><%=operations_confirm_order%></td>
                    <td><%=operations_email_confirmation%></td>
                    <td><%=first_name%></td>
                    <td><%=last_name%></td>
                    <td><%=address1%></td>
                    <td><%=address2%></td>
                    <td><%=phone%></td>
                    <td><%=city%></td>
                    <td><%=postalcode%></td>
                    <td><%=province_code%></td>
                    <td><%=country_code%></td>
                    <td>
                        <a href="update_meyer_dc_page.jsp?id=<%=ids%>">
                            <button class="btn btn-warning">EDIT</button>
                        </a>
                        <a href="delete_meyer_dc_page.jsp?id=<%=ids%>" onclick="return confirm('Are you sure?');">
                            <button class="btn btn-danger">DELETE</button>
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
