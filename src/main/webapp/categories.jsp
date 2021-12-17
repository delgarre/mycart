<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>

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
        <title>Categories</title>
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
    var filename = 'categories' + '_' + 'report_' + new Date().toLocaleDateString() + '.csv';
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
            <h2>CATEGORIES:</h2>
            <br>SEARCH: 
        <input id="myInput"  name="ven" type="text" placeholder="Search All">
        
        <br><br>
            <br>
        <div class="row ml-2">
            <a href="add_category.jsp">
                <button class="btn btn-outline-success">ADD CATEGORY</button>
            </a>
                <a href="#" onclick="download_table_as_csv('my_id_table_to_export');">
                    <button class="btn btn-info">
                    DOWNLOAD AS CSV
                    </button>
                </a>
        </div>
            <div id="error" class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            
            <div div class="table-responsive-sm mt-3">
                <table id="my_id_table_to_export" class="table table-bordered ">
                    <thead>
                    <tr>
                        <th>CATEGORY</th>
                        
                        <th>ACTIONS</th>
                    </tr>
                    <%
                    CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> list = cDao.getCategories();
                    %>
                    
                    <%
                    for(Category c: list){
                    %>
                    </thead>
                    <tbody id="myTable">
                    <tr>
                        <td><%= c.getCategoryTitle()%></td>
                        
                        <td>
                            <a href="update_category_page.jsp?id=<%=c.getCategoryId()%>">
                                <button type="button" class="btn btn-outline-warning">EDIT</button>
                            </a>
                                <a href="delete_category.jsp?id=<%=c.getCategoryId()%>" onclick="return confirm('Are you sure?');">
                                    <button type="button" class="btn btn-outline-danger">DELETE</button>
                                </a>
                        </td>
                    </tr>
                    </tbody>
                    <%
                    }
                    %>
                </table>
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

                
    </body>
</html>
