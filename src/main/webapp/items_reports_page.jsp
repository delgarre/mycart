
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

String itemNumber1 = request.getParameter("itemNumber1");
String itemNumber2 = request.getParameter("itemNumber2");

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
String sql ="select * from Item where (vTitle Like '"+vendor1+"' or vTitle Like '"+vendor2+"') or (itemNumber Like '"+itemNumber1+"' or itemNumber Like '"+itemNumber2+"')";
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
        <form method="post" action="ItemReportServlet">
        <button class="btn btn-outline-warning">Download Excel Report</button>
        </form>
        <div class="container-fluid">
        <table id="tblData" class="table table-bordered">
            <tr>
               
                <th>Item Number</th>
                <th>Description</th> 
                <th>Vendor</th>
                <th>Unit Of Measure</th>
                <th>QTY/UOM</th>
                <th>Price</th>

                
                <th>Manufacturer</th>
                <th>Manufacturer Number</th>
                <th>CPT</th>
                <th>NDC</th>
            </tr>
            <%
            while(resultSet.next()){
                String item = resultSet.getString("itemNumber");
                String quantity = resultSet.getString("quantity");
                String uom = resultSet.getString("unitOfMeasure");
                String price = resultSet.getString("price");
                String vendor = resultSet.getString("vTitle");
                String man = resultSet.getString("manufacturer");
                String cpt = resultSet.getString("cpt");
                String ndc = resultSet.getString("ndc");
                String desc = resultSet.getString("pDesc");
                String manNum = resultSet.getString("manufacturerNum");
            %>
            <tr>
              
                <td><%=item%></td>
                <td><%=desc%></td> 
                <td><%=vendor%></td>
                <td><%=uom%></td>
                <td><%=quantity%></td>
                <td><%=price%></td>
              
                
                <td><%=man%></td>
                <td><%=manNum%></td>
                <td><%=cpt%></td>
                <td><%=ndc%></td>
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
