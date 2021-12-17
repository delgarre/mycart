
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ItemDao"%>
<%@page import="com.learn.mycart.entities.Item"%>

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
    else
    {
        if(user.getUserType().equals("normal"))
        {
            session.setAttribute("message", "Admin level required!");
            response.sendRedirect("index.jsp");
            return;
        }
    }
    
    
String itemNumber1 = request.getParameter("itemNumber");
if(itemNumber1==null){
    itemNumber1 = "";
}
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Items List</title>
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

        
        
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/webcamjs/1.0.25/webcam.js">
        </script>
        
<script type="text/javascript" src="jspdf.debug.js"></script>
<script>
    

    
    
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});


</script>

<style>
.center {
  margin: auto;
  width: 60%;
  border: navy;
  padding: 10px;
}

.table-responsive

table.table-fit {
    width: 50% !important;
    table-layout: auto !important;
}
table.table-fit thead th, table.table-fit tfoot th {
    width: 50% !important;
}
table.table-fit tbody td, table.table-fit tfoot td {
    width: 50% !important;
}

table {
  border-collapse: collapse;
  max-width: 50%;
}

th, td {
  text-align: left;
  padding: 8px;
}

th {
  background: white;
  position: sticky;
  top: 0;
}

tr:nth-child(even) {background-color: #008080;}


#container_data_entry {
            border: solid 1px #ccc;
            border-radius: 4px;
            margin: 5px 5px 5px 0;
            padding: 10px 5px;
            background-color: #f5f5f5;
            overflow: auto;
            height: 100%;
        }
 #student_details {
            padding: 10px 0;
            background-color: #f5f5f5;
            color: #3d3d3d;
            border: solid 1px #ccc;
            border-radius: 4px;
            margin: 5px 0 5px 5px;
            width: 25%;
            float:right;
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
div.managerTable{
    max-width: 100px;
    margin: auto
    
}

</style>
<%

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
String sql ="select * from Item where stat = 1 order by pDesc";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
    </head>
    <body>
<%@include file="components/navbar.jsp" %>
<br>
<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
<div id="managerTable" >
        <div class="col-md-8">
       
        <h1>LIST OF ACTIVE ITEMS</h1>
        
        <div class="student_details">
        <div class="col-md-8">
            <div class="row ml-2">
            <a href="add_item_page.jsp">
                <button class="btn btn-primary">ADD ITEM</button>
            </a><br>
        </div>
        
        <br>SEARCH: 
        <input id="myInput"  name="ven" type="text" value="<%=itemNumber1%>" placeholder="Search All">
        
        <br><br>
      
        
        <a href="items_1.jsp">  
                <button class="btn btn-outline-primary">REPORTS</button>
        </a><br>
        <br>
        <a href="discontinued_items.jsp">  
                <button class="btn btn-outline-success">DISCONTINUED</button>
        </a><br>
        <br>
                <a href="#" onclick="download_table_as_csv('my_id_table_to_export');">
                    <button class="btn btn-info">
                    Download as CSV
                    </button>
                </a><br>
                
            <br>
            <div id="error" class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div><br>
            <br>
            
             <div class="table-responsive-sm">     
  
            <table id="my_id_table_to_export" class="table table-bordered table-fit" style="width: 140%">
            <thead>
            <tr>
                        
                        <th>IMAGE</th>
                        <th>ITEM # </th>
                        <th>DESCRIPTION</th>
                        <th>COST</th>
                        <th>QTY PER UOM</th>
                        <th>UOM</th>
                        <th>LOCATION TYPE</th>
                        
                        <th>ALTERNATE ITEM</th>
                        <th>MFR</th>
                        <th>MFR #</th>
                        <th>VENDOR</th>
                        <th>CATEGORY</th>
                        
                        <th>CPT</th>
                        <th>NDC</th>
                        <th>STATUS</th>
                        <th>SDS</th>
                        <th>SPECIAL INSTRUCTIONS</th>
                        <th>ACTIONS</th>
            </tr>
            </thead>
            <tbody id="myTable">
            <%
                
           while(resultSet.next()){
               String id = resultSet.getString("id");
               String itemNumber = resultSet.getString("itemNumber");
               String alt = resultSet.getString("alternateItem");
               String pDesc = resultSet.getString("pDesc");
               String vTitle = resultSet.getString("vTitle");
               String cTitle = resultSet.getString("cTitle");
               String stat = resultSet.getString("stat");
               String sds = resultSet.getString("sds");
               String photo = resultSet.getString("photo");
               String uom = resultSet.getString("unitOfMeasure");
               String quantity = resultSet.getString("quantity");
               String cpt = resultSet.getString("cpt");
               String notes = resultSet.getString("notes");
               String price = resultSet.getString("price");
               String ndc = resultSet.getString("ndc");
               String locationType = resultSet.getString("locationType");
               String manufacturer = resultSet.getString("manufacturer");
               String manufacturerNum = resultSet.getString("manufacturerNum");
            %>
            
            <tr>

                <td>
                    <img style="max-width: 125px" src="image/<%=photo%>" alt="user_icon">
                </td>
                <td><%=itemNumber%></td>
                <td><%=pDesc%></td>
                <td><span>$<%=price%></span></td>
                <td><%=quantity%></td>
                <td><%=uom%></td>
                <td><%=locationType%></td>
                
                <td><%=alt%></td>
                <td><%=manufacturer%></td>
                <td><%=manufacturerNum%></td>
                <td><%=vTitle%></td>
                <td><%=cTitle%></td>
                
                <td><%=cpt%></td>
                <td><%=ndc%></td>
                
                <td><%=stat%></td>
             
                <td><%=sds%></td>
               
                <td><%=notes%></td>
                
                <td>
                    <a href="update_product_page.jsp?id=<%= id%>&code=<%=cpt%>&cTitle=<%=cTitle%>&vTitle=<%=vTitle%>&man=<%=manufacturer%>&uom=<%=uom%>&ltype=<%=locationType%>">
                        <button class="btn btn-outline-warning">EDIT</button>
                    </a>
                    <a href="list_alt_items.jsp?id=<%=id%>&alt=<%=alt%>&itemNumber=<%=itemNumber%>" >
                        <button class="btn btn-outline-danger">DISCONTINUED</button>
                    </a>
                </td>
                
            </tr>
            <%
                }

                
            %>
            </tbody>
        </table>
              
             </div>
             </div>
        </div>
        </div>
        </div>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
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
    </body>
</html>
