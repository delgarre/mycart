
<%@page import="java.sql.DriverManager"%>

<%@page import="com.learn.mycart.entities.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
String vendor1 = request.getParameter("vendor1");
String vendor2 = request.getParameter("vendor2");

String location1 = request.getParameter("location1");
String location2 = request.getParameter("location2");

String itemNumber1 = request.getParameter("itemNumber1");
String itemNumber2 = request.getParameter("itemNumber2");

String begin = request.getParameter("date1");
String end = request.getParameter("date2");

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
String sql ="select * from OrderHistory where (date BETWEEN '"+begin+"' AND '"+end+"') or  (locations Like '"+location1+"' or locations Like '"+location2+"') or (vTitle Like '"+vendor1+"' or vTitle Like '"+vendor2+"') or (itemNumber Like '"+itemNumber1+"' or itemNumber Like '"+itemNumber2+"') order by date desc";
resultSet = statement.executeQuery(sql);

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excel Report</title>
        <%@include file="components/common_css_js.jsp" %>
        
<script>
            
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
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h2>Report:</h2>
    <button onclick="exportTableToExcel('tblData')">Download Excel Report</button>
        <div class="container-fluid">
        <table id="tblData" class="table table-bordered">
            <tr>
                <th>Date</th>
                <th>Item Number</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Vendor</th>
                <th>Manufacturer</th>
            </tr>
            <%
            while(resultSet.next()){
                String item = resultSet.getString("itemNumber");
                String quantity = resultSet.getString("quantity");
                String date = resultSet.getString("date");
                String price = resultSet.getString("aPrice");
                String vendor = resultSet.getString("vTitle");
                String man = resultSet.getString("manufacturer");
            %>
            <tr>
                <td><%=date%></td>
                <td><%=item%></td>
                <td><%=quantity%></td>
                <td><%=price%></td>
                <td><%=vendor%></td>
                <td><%=man%></td>
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
