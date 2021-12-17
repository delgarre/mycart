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
        <button onclick="topFunction()" id="myBtn" title="Go to top">TOP</button>
        <div class="center">
        <h2>UNITS OF MEASURES</h2>
        <br>
        <div class="row ml-2">
            <a href="add_measurement.jsp">
                <button class="btn btn-outline-success">ADD MEASUREMENT</button>
            </a>
        </div>
        <div id="error" class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
        </div>
        
        
        <div class="table-responsive-sm mt-3">
            <table class="table table-bordered " >
                <tr>
                    <th>MEASUREMENT</th>
                    <th>ACTIONS</th>
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
                        <a href="list_uom.jsp?id=<%=u.getId()%>&uom=<%=u.getVal()%>">
                             <button type="button" class="btn btn-outline-danger">DELETE</button>
                         </a>
                         <a href="update_uom_page.jsp?id=<%=u.getId()%>">
                             <button type="button" class="btn btn-info">EDIT</button>
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
