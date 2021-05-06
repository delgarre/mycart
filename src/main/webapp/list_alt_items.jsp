<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.ApproveOrder"%>
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
<%
String id = request.getParameter("id");
String alt = request.getParameter("alt");
String itemNumber = request.getParameter("itemNumber");
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
String sql ="select * from Item where itemNumber = '"+itemNumber+"'";
resultSet = statement.executeQuery(sql);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Associated Items</title>
        <%@include file="components/common_css_js.jsp" %>
 <script src= 
    "https://smtpjs.com/v3/smtp.js"> 
  </script> 
  
<script type="text/javascript"> 
    function sendEmail(tableID) { 
        
        var tableSelect = document.getElementById(tableID);
    var tableHTML = tableSelect.outerHTML;
      Email.send({ 
        Host: "east.EXCH092.serverdata.net", 
        Username: "ordering.portal@dseincorporated.com", 
        Password: "Rackspace123!!", 
        To: "diane.madonna@dseincorporated.com", 
        From: "ordering.portal@dseincorporated.com", 
        Subject: "Alternate Items List", 
        Body: tableHTML, 
        Link: "www.google.com",
      }) 
        .then(function (message) { 
          alert("mail sent successfully") 
        }); 
    } 
    
    function goBack(){
        window.history.back();
    }
    
    
    
</script>

<style>
    

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
         <div class="container">
             <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
             <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <br>
                    <button type="button" class="btn btn-warning" onclick="goBack()">Go Back</button>
                    <br>
                    
                  
                       
                    <h1>Are you Sure?</h1><br>
                    <br>
                    <h2>UOM: <%=itemNumber%></h2>
                  
                  
                            
                                 <div class="form-group">
                       
                                    <a href="delete_prod.jsp?id=<%=id%>&alt=<%=alt%>&itemNumber=<%=itemNumber%>">
                                        <button class="btn btn-danger" onclick="sendEmail('td')">DELETE</button>
                                    </a>
                                </div>

                                
                      
                                   <table class="table table-bordered " id="td">
                                        <thead>
                                        <tr>
                                            <th>ALTERNATE ITEM NUMBERS</th>
                                            <th>DESCRIPTION</th>
                   
                   
                    
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <%
                                                 while(resultSet.next()){

                                                     String alternateItem = resultSet.getString("alternateItem");
                                                     String desc = resultSet.getString("pDesc");

                                                 %>


                                                 <td><%=alternateItem%></td>
                                                 <td><%=desc%></td>
                                                 

                                             </tr>
                                             <%
                                                 }
                                             %>
                                        </tbody>
                                         </table>
        
                                       
                        
                </div>
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
        
<%

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
    </body>
</html>
