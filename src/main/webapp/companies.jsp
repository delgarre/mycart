<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.CompanyDao"%>
<%@page import="com.learn.mycart.entities.User"%>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Locations</title>
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
    var filename = 'locations' + '_' + 'report_' + new Date().toLocaleDateString() + '.csv';
    var link = document.createElement('a');
    link.style.display = 'none';
    link.setAttribute('target', '_blank');
    link.setAttribute('href', 'data:text/csv;charset=utf-8,' + encodeURIComponent(csv_string));
    link.setAttribute('download', filename);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
        </script>
        
        <script>
            
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

table.table-fit {
    width: auto !important;
    table-layout: auto !important;
}
table.table-fit thead th, table.table-fit tfoot th {
    width: auto !important;
}
table.table-fit tbody td, table.table-fit tfoot td {
    width: auto !important;
}

table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
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
</style>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
        <div class="center">
            <h2>LOCATIONS:</h2>
            <br>
            <div class="row ml-2">
            <a href="add_company.jsp">
                <button class="btn btn-success">ADD LOCATION</button>
            </a>
                <br>
                <a href="l_company.jsp">
                <button class="btn btn-warning">COMPANIES</button>
            </a>
                <br>
            <a href="type.jsp">
                <button class="btn btn-primary">MAINTAIN LOCATION TYPE</button>
            </a>
                <br>
                 <a href="types.jsp">
                <button class="btn btn-info">ASSIGNED LOCATION TYPES</button>
            </a>
                 <br>
                 <a href="d_companies.jsp">
                <button class="btn btn-danger">INACTIVE LOCATIONS</button>
            </a>
                 <a href="#" onclick="download_table_as_csv('my_id_table_to_export');">
                    <button class="btn btn-secondary">
                    DOWNLOAD AS CSV
                    </button>
                </a>
        </div>
        <div class="col-md-8">
            <div id="error" class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="table-responsive-sm">
                <table id="my_id_table_to_export" class="table table-bordered table-fit" >
                    <thead>
                    <tr>
                       
                        <th>LOCATION</th>
                        <th>COMPANY</th>
                        <th>CODE</th>
                        <th>ADDRESS 1</th>
                        <th>ADDRESS 2</th>
                        <th>CITY</th>
                        <th>STATE</th>
                        <th>ZIP</th>
                        <th>ACCOUNT ID</th>
                        <th>PHONE</th>
                        <th>STATUS</th>
                        <th>ACTIONS</th>
                     
                    </tr>
                    
                    </thead>
                    <%
                        CompanyDao cpDao = new CompanyDao(FactoryProvider.getFactory());
                        List<Company> cpList = cpDao.getCompanies();
                        
                    %>
                    
                    <%
                        for(Company cp: cpList){
                    %>
                    <tbody>
                    <tr>
                       
                        <td><%= cp.getCompanyName()%></td>
                        <td><%= cp.getType()%></td>
                        <td><%=cp.getCompanyCode()%></td>
                        <td><%=cp.getAddress1()%></td>
                        <td><%=cp.getAddress2()%></td>
                        <td><%=cp.getCity()%></td>
                        <td><%=cp.getStates()%></td>
                        <td><%=cp.getZip()%></td>
                        <td><%=cp.getAccount_id()%></td>
                        <td><%=cp.getPhone()%></td>
                        <td><%= cp.getStatus()%></td>
                    <td>
                        <a href="update_comp_page.jsp?id=<%= cp.getCompanyId()%>">
                        <button type="button" class="btn btn-outline-primary">EDIT</button>
                    </a>
                    <a href="c_status.jsp?id=<%= cp.getCompanyId()%>" onclick="return confirm('Are you sure?');">
                        <button type="button" class="btn btn-outline-danger">INACTIVATE</button>
                    </a>
                </td>
                <!--
                <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button></td>
                -->

            </tr>
                    </tbody>
            <%
            }
            %>
                    
                </table>
          
            </div>
        </div>
        </div>        
    </body>
<script>
function myFunction() {
  var txt;
  var r = confirm("Are you sure?");
  if (r == true) {
    txt = "Category edited!";
  } else {
    window.open(companies.jsp);
  }
  document.getElementById("demo").innerHTML = txt;
}


//Get the button
var mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

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
</html>
