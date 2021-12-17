<%@page import="com.learn.mycart.entities.Notice"%>
<%@page import="com.learn.mycart.dao.NoticeDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ItemDao"%>
<%@page import="com.learn.mycart.entities.Item"%>
<%@page import="com.learn.mycart.dao.LocationTypeDao"%>
<%@page import="com.learn.mycart.entities.LocationType"%>
<%@page import="com.learn.mycart.entities.Company"%>
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

%>
<%

String loc = request.getParameter("loc");
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
String sql ="Select * from Item";

resultSet = statement.executeQuery(sql);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Items</title>
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


function goBack(){
        window.history.back();
    } 
    

</script>

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
    var filename = 'export_' + table_id + '_' + new Date().toLocaleDateString() + '.csv';
    var link = document.createElement('a');
    link.style.display = 'none';
    link.setAttribute('target', '_blank');
    link.setAttribute('href', 'data:text/csv;charset=utf-8,' + encodeURIComponent(csv_string));
    link.setAttribute('download', filename);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

//this will hide message after 3 seconds
            setTimeout(function(){
            $("#error").hide();
            },3000)
</script> 
        
<style>
.center {
  margin: auto;
  width: 60%;
  border: navy;
  padding: 10px;
}

th {
  background: white;
  position: sticky;
  top: 0;
}

.currencyinput {
    border: 1px inset #ccc;
}
.currencyinput input {
    border: 0;
}

#myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: red;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
}

#myBtn:hover {
  background-color: #555;
}


* {box-sizing: border-box;}

.img-magnifier-container {
  position: relative;
}

.img-magnifier-glass {
  position: absolute;
  border: 3px solid #000;
  border-radius: 50%;
  cursor: none;
  /*Set the size of the magnifier glass:*/
  width: 100px;
  height: 100px;
}

</style>
    </head>
    <body>
          <%@include file="components/user_items_order_navbar.jsp" %>
          
          <div class="panel panel-primary">
            <div>
                <div id="error" class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
                </div>
            
                
            </div>
        </div>
                <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
        <div class="col-md-8">
            <div div class="table-responsive-sm mt-3">
        
                <div>
                 <button class="btn btn-warning" onclick="goBack()">Go Back</button>
                 <br>
          <input id="myInput" type="text" placeholder="Search..">
          <br>
                <a href="#" onclick="download_table_as_csv('my_id_table_to_export');">
                    <button class="btn btn-info">
                    Download as CSV
                    </button>
                </a>
                </div>
                <div>
                  <h3>INVENTORY ITEMS:</h3>
                </div>
             
                <div class="img-magnifier-container"> 
   
            <table class="table table-bordered" id="my_id_table_to_export"  style="width:20px">
                <thead>
                <tr>
                

                <th>IMAGE</th>
                <th>ITEM NUMBER</th>
                <th>DESCRIPTION</th>
                <th>VENDOR</th>
                <th>UOM</th>



                <th>QTY PER UOM</th>
              
                 <th>COST</th>

                <th>MANUFACTURER</th>
            
                <th>CPT</th>
           
                
                
                <th>ACTIONS</th>
                </tr>
                </thead>
                <tbody id="myTable">
                <%
                    while(resultSet.next()){
                        ;
                        String id = resultSet.getString("id");
                        
                        
                        String price = resultSet.getString("price");
                        String quantity = resultSet.getString("quantity");
                        String photo = resultSet.getString("photo");
                        String itemNumber = resultSet.getString("ItemNumber");
                        String vendor = resultSet.getString("vTitle");
                        String desc = resultSet.getString("pDesc");
                        String unit = resultSet.getString("unitOfMeasure");
                        String man = resultSet.getString("manufacturer");
                        String manNum = resultSet.getString("manufacturerNum");
                        String cTitle = resultSet.getString("cTitle");
                        String cpt = resultSet.getString("cpt");
                    
                        String alt = resultSet.getString("alternateItem");
                        String contactInfo = resultSet.getString("contactInfo");
                    %>
                
                <tr>
                    <td>
                        <img id="myimage" style="max-width: 125px" src="image/<%=photo%>" alt="user_icon">
                    </td>
                    <td><%= itemNumber%></td>
                    <td><%=desc%></td>
                    <td><%=vendor%></td>
                    <td><%=unit%></td>
                   

                    
                    
                    <td><%= quantity%></td>
                    <td><span>$<%= price%></span></td>
                    
                    
                    <td><%=man%></td>
                
                    <td><%=cpt%></td>
                  
                    
                    
                    <td>
                        
                        <a href="add_o_a_order_page.jsp?id=<%= id%>&loc=<%=loc%>&contactInfo=<%=contactInfo%>">
                    <button class="btn btn-outline-success">ADD TO ORDER</button>
                        </a>
                    
                    </td>
                   
                
                   
                </tr>

                <%
                    session.setAttribute("itemNumber", itemNumber);
                    }
                %>
                </tbody>
            </table>
                </div>
                <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
                
          <input type="number" name="quantity">
             
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <form method="post" action="select_item.jsp">
        <button type="submit" class="btn btn-primary">Save changes</button>
        </form>
      </div>
    </div>
  </div>
</div>
            
            </div>
        </div>
                
<script>
    
//Get the button
var mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction();};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}   
</script>


<%

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
    </body>
</html>
