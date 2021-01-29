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
</style>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="row ml-2">
            <a href="add_vendor.jsp">
                <button>Add vendor</button>
            </a>
        </div>
        <div class="center">
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
                 VendorDao vdao = new VendorDao(FactoryProvider.getFactory());
                 List<Vendor> vlist = vdao.getVendors();
                 %>
                 <%
                 for(Vendor v: vlist){
                 %>
                 
                 <tr>
                     <td><%=v.getVendorName()%></td>
                     <td>
                         <a href="delete_vendor.jsp?id=<%=v.getVendorId()%>">
                             <button type="button" class="delete" onclick="myFunction()">Delete</button>
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
window.location.href = "vendors.jsp";


  } else {
   window.location.href = "vendors.jsp";
  }
  document.getElementById("demo").innerHTML = txt;
}
</script>

    </body>
</html>
