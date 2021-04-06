<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.VendorDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.Vendor"%>
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
    VendorDao vdao = new VendorDao(FactoryProvider.getFactory());
                 List<Vendor> vlist = vdao.getVendors();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vendors</title>
        <%@include file="components/common_css_js.jsp" %>
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
            <h2>Vendors:</h2>
            <br>
            <div class="row ml-2">
            <a href="add_vendor.jsp">
                <button class="btn btn-outline-success">Add vendor</button>
            </a>
        </div>
            
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            
        <div class="table-responsive-sm mt-3">
            
             <table class="table table-bordered " >
                 <tr>
                     <th>Name</th>
                     <th>Actions</th>
                 </tr>
                 <%
                 
                 %>
                 <%
                 for(Vendor v: vlist){
                 %>
               
                 <tr>
                     <td><%=v.getVendorName()%></td>
                     <td>
                 
                         <a href="delete_vendor.jsp?id=<%=v.getVendorId()%>" ">
                             <button type="button" class="btn btn-danger" onclick="myFunction()">Delete</button>
                         </a>
                         <a href="update_vendor_page.jsp?id=<%=v.getVendorId()%>">
                             <button type="button" class="update">Edit</button>
                         </a>
                     </td>
                 </tr>
                 
                 <%
                     }
                 %>
             </table>
        </div>
        </div>
             
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

    </body>
</html>
