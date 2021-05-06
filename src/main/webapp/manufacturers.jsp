<%@page import="com.learn.mycart.entities.Manufacturers"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.ManDAO"%>
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
        <title>Manufacturers</title>
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
        
        <div class="center">
        <h2>Manufacturers</h2>
        <br>
        <div class="row ml-2">
            <a href="add_manufacturers.jsp">
                <button class="btn btn-outline-success">Add manufacturer</button>
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
                 ManDAO mdao = new ManDAO(FactoryProvider.getFactory());
                 List<Manufacturers> mlist = mdao.getManufacturers();
                 %>
                 <%
                 for(Manufacturers m: mlist){
                 %>
                <tr>
                    <td><%=m.getName()%></td>
                    <td>
                        <a href="delete_man.jsp?id=<%=m.getId()%>" onclick="return confirm('Are you sure?');">
                             <button type="button" class="btn btn-outline-danger">Delete</button>
                         </a>
                         <a href="update_man_page.jsp?id=<%=m.getId()%>">
                             <button type="button" class="btn btn-outline-primary">Edit</button>
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
window.location.href = "manufacturer.jsp";


  } else {
   window.location.href = "manufacturer.jsp";
  }
  document.getElementById("demo").innerHTML = txt;
}
</script>
    </body>
</html>
