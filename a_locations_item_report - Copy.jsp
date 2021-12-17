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

$('.add').on('click', add);
$('.remove').on('click', remove);

function add() {
  var new_chq_no = parseInt($('#total_chq').val()) + 1;
  var new_input = "<input type='text' id='new_" + new_chq_no + "' name='new' required>";

  $('#new_chq').append(new_input);

  $('#total_chq').val(new_chq_no);
}

function remove() {
  var last_chq_no = $('#total_chq').val();

  if (last_chq_no > 1) {
    $('#new_' + last_chq_no).remove();
    $('#total_chq').val(last_chq_no - 1);
  }
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
      
        <div class="container">
            <div class="row">
                <br>
                <div class="col-md-6 offset-md-3">
                    <button class="btn btn-warning" onclick="goBack()">GO BACK</button>
                 <br>
                 
                    <div class="card-header custom-bg text-white">
                            <h3>REPORT INFO:</h3>
                    </div>
                    
                    <div class="card-body">
                        <%@include file="components/message.jsp" %>
                        <div class="dropdown show">
                            <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                SEARCH OPTIONS
                            </button>
                             <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="just_locations_report.jsp">ADD LOCATIONS</a>
                            </div>
                        </div><br>
                        
                        <a href="a_locations_item_desc_report.jsp">
                                    <button class="btn btn-secondary">ADD DESCRIPTION</button>
                                </a>
                                <br>
                        <br>
                            <button class="btn btn-success" onclick="add()">ADD ITEM</button>
                            <button class="btn btn-danger" onclick="remove()">REMOVE ITEM</button>
                            <form action="a_locations_item_report_page.jsp" method="post">
                                
                                <div id="new_chq"></div>
                                <input type="hidden" value="1" id="total_chq" name="total_chq" required>
                                
                                <div class="form-group">
                                  <label for="date1">DATE 1:</label>
                                  <input name="date1" type="text" class="form-control" id="date1" placeholder="Enter start date Ex. 01/01/2021" required>
                                </div>
                                
                                <div class="form-group">
                                  <label for="date2">DATE 2:</label>
                                  <input name="date2" type="text" class="form-control" id="date2" placeholder="Enter end date Ex.02/01/2021" required>
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
