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
                <button class="btn btn-outline-success">ADD LOCATION</button>
            </a>
                <br>
                <a href="l_company.jsp">
                <button class="btn btn-outline-primary">COMPANIES</button>
            </a>
                <br>
            <a href="type.jsp">
                <button class="btn btn-outline-primary">MAINTAIN LOCATION TYPE</button>
            </a>
                <br>
                 <a href="types.jsp">
                <button class="btn btn-outline-success">ASSIGNED LOCATION TYPES</button>
            </a>
        </div>
        <div class="col-md-8">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="table-responsive-sm">
                <table class="table table-bordered table-fit" >
                    <tr>
                       
                        <th>LOCATION</th>
                        <th>COMPANY</th>
                        <th>STATUS</th>
                        <th>ACTIONS</th>
                     
                    </tr>
                    
                    
                    <%
                        CompanyDao cpDao = new CompanyDao(FactoryProvider.getFactory());
                        List<Company> cpList = cpDao.getCompanies();
                        String answer = "Yes";
                    %>
                    
                    <%
                        for(Company cp: cpList){
                    %>
                    
                    <tr>
                       
                        <td><%= cp.getCompanyName()%></td>
                        <td><%= cp.getType()%></td>
                        <td><%= cp.getStatus()%></td>
                    <td>
                    <a href="c_status.jsp?id=<%= cp.getCompanyId()%>" onclick="return confirm('Are you sure?');">
                        <button type="button" class="btn btn-outline-danger">INACTIVATE</button>
                    </a>
                </td>
                <!--
                <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button></td>
                -->
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
                
          <h3>Are you sure?</h3>
          <input type="text" class="btn btn-outline-danger" value="<%= cp.getCompanyId()%>">
             
      </div>
      
      <div class="modal-footer">
       <a href="delete_comp.jsp?id=<%= cp.getCompanyId()%>&answer=<%=answer%>">
           <input type="button" class="btn btn-outline-danger" value="Yes">
                    </a>
      </div>
    </div>
  </div>
</div>
            </tr>
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
