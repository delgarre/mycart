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
String sql ="select * from Company order by companyName";
resultSet = statement.executeQuery(sql);

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reports</title>
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
      
        <div class="container">
            <div class="row">
                <br>
                <div class="col-md-6 offset-md-3">
                 <button class="btn btn-warning" onclick="goBack()">GO BACK</button>
                 <br>
                    <div class="card-header custom-bg text-white">
                            <h3>REPORT INFO:</h3>
                            <p>SEARCH BY ALL LOCATIONS AND DESCRIPTION</p>
                    </div>
                    
                    <div class="card-body">
                        <%@include file="components/message.jsp" %>
                       
                        <br>
                         <div class="dropdown show">
                            <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                SEARCH OPTIONS
                            </button>
                             <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="just_locations_report.jsp">ADD LOCATIONS</a>
                            </div>
                         </div><br>
                        <a href="order_report.jsp">
                                    <button class="btn btn-secondary">ADD ITEMS</button>
                                </a>
                                <br>
                            <form action="a_locations_desc_report_page.jsp" method="post">

                                
                                <div class="form-group">
                                  <label for="date1">DATE 1:</label>
                                  <input name="date1" type="text" class="form-control" id="date1" placeholder="Enter start date Ex. 01/01/2021" required>
                                </div>
                                
                                <div class="form-group">
                                  <label for="date2">DATE 2:</label>
                                  <input name="date2" type="text" class="form-control" id="date2" placeholder="Enter end date Ex.02/01/2021" required>
                                </div>
                                

                              
                                <div class="form-group">
                                    <h6>ENTER DESCRIPTION</h6>
                                    <input class="form-control" name="pDesc" id="pDesc" required>
                                </div>
                                
                                 <div class="container text-center">
                                    <button type="submit" class="btn btn-primary custom-bg border-0">GENERATE REPORT</button>
                                </div>
                            </form>
<%

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
