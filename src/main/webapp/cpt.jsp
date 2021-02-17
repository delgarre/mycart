<%@page import="com.learn.mycart.entities.CPT"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.CptDAO"%>
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
        <title>CPT Codes</title>
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
        <h2>CPT</h2>
        <br>
        <div class="row ml-2">
            <a href="add_cpt.jsp">
                <button class="btn btn-outline-success">Add CPT Code</button>
            </a>
        </div>
        <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
        </div>
        
        <div class="table-responsive-sm mt-3">
            <table class="table table-bordered " >
                <tr>
                    <th>Codes</th>
                    <th>Actions</th>
                </tr>
                <%
                 CptDAO cdao = new CptDAO(FactoryProvider.getFactory());
                 List<CPT> clist = cdao.getCodes();
                 %>
                 <%
                 for(CPT c: clist){
                 %>
                <tr>
                    <td><%=c.getCodes()%></td>
                    <td>
                        <a href="delete_cpt.jsp?id=<%=c.getId()%>">
                             <button type="button" class="delete" onclick="myFunction()">Delete</button>
                         </a>
                         <a href="update_cpt_page.jsp?id=<%=c.getId()%>">
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
window.location.href = "cpt.jsp";


  } else {
   window.location.href = "cpt.jsp";
  }
  document.getElementById("demo").innerHTML = txt;
}
</script>
    </body>
</html>
