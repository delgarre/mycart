<%@page import="com.learn.mycart.entities.UOM"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.UOMDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
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
        <title>Measurements</title>
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
        <h2>UNITS OF MEASURES</h2>
        <br>
        <div class="row ml-2">
            <a href="add_measurement.jsp">
                <button class="btn btn-outline-success">Add measurement</button>
            </a>
        </div>
        <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
        </div>
        
        
        <div class="table-responsive-sm mt-3">
            <table class="table table-bordered " >
                <tr>
                    <th>Measurement</th>
                    <th>Actions</th>
                </tr>
                <%
                 UOMDao udao = new UOMDao(FactoryProvider.getFactory());
                 List<UOM> ulist = udao.getMeasurements();
                 %>
                 <%
                 for(UOM u: ulist){
                 %>
                <tr>
                    <td><%=u.getVal()%></td>
                    <td>
                        <a href="delete_uom.jsp?id=<%=u.getId()%>">
                             <button type="button" class="delete" onclick="myFunction()">Delete</button>
                         </a>
                         <a href="update_uom_page.jsp?id=<%=u.getId()%>">
                             <button type="button" class="update">SAVE CHANGES</button>
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
window.location.href = "uom.jsp";


  } else {
   window.location.href = "uom.jsp";
  }
  
}
</script>
    </body>
</html>
