<%@page import="com.learn.mycart.entities.Notice"%>
<%@page import="com.learn.mycart.dao.NoticeDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ItemDao"%>
<%@page import="com.learn.mycart.entities.Item"%>
<%@page import="com.learn.mycart.dao.LocationTypeDao"%>
<%@page import="com.learn.mycart.entities.LocationType"%>
<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%
        User user = (User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message", "You are not logged in!");
        response.sendRedirect("index.jsp");
        return;
    }
Company companys3 = (Company)session.getAttribute("location");
%>
<%
String name = companys3.getCompanyName();
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
ResultSet resultSet2 = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="Select I.* from Item I inner Join LocationType LT ON FIND_IN_SET(LT.locationType,I.locationType)Where LT.location ='"+name+"' AND stat=1 ORDER BY itemNumber";

resultSet = statement.executeQuery(sql);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Items</title>
        <%@include file="components/common_css_js.jsp" %>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});


function goBack(){
        window.history.back();
    } 
    

</script>

        
<style>
.center {
  margin: auto;
  width: 60%;
  border: navy;
  padding: 10px;
}

th {
  background: white;
  position: sticky;
  top: 0;
}

.currencyinput {
    border: 1px inset #ccc;
}
.currencyinput input {
    border: 0;
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


* {box-sizing: border-box;}

.img-magnifier-container {
  position: relative;
}

.img-magnifier-glass {
  position: absolute;
  border: 3px solid #000;
  border-radius: 50%;
  cursor: none;
  /*Set the size of the magnifier glass:*/
  width: 100px;
  height: 100px;
}

</style>
    </head>
    <body>
          <%@include file="components/user_items_pharm_navbar.jsp" %>
          
          <div class="panel panel-primary">
            <div>
                <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
                </div>
            
                
            </div>
        </div>
                <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
        <div class="col-md-8">
            <div div class="table-responsive-sm mt-3">
        
                <div>
                 <button class="btn btn-warning" onclick="goBack()">Go Back</button>
                 <br>
          <input id="myInput" type="text" placeholder="Search..">
          
    
                </div>
                <div>
                  <h3>INVENTORY ITEMS:</h3>
                </div>
             
                <div class="img-magnifier-container"> 
   
            <table class="table table-bordered"  style="width:20px">
                <thead>
                <tr>
                

                <th>IMAGE</th>
                <th>ITEM NUMBER</th>
                <th>DESCRIPTION</th>
                <th>VENDOR</th>
                <th>UOM</th>



                <th>QTY PER UOM</th>
              
                 <th>COST</th>

                <th>MANUFACTURER</th>
            
                <th>CPT</th>
                <th>NDC</th>
                
                
                <th>ACTIONS</th>
                </tr>
                </thead>
                <tbody id="myTable">
                <%
                    while(resultSet.next()){
                        ;
                        String id = resultSet.getString("id");
                        
                        
                        String price = resultSet.getString("price");
                        String quantity = resultSet.getString("quantity");
                        String photo = resultSet.getString("photo");
                        String itemNumber = resultSet.getString("ItemNumber");
                        String vendor = resultSet.getString("vTitle");
                        String desc = resultSet.getString("pDesc");
                        String unit = resultSet.getString("unitOfMeasure");
                        String man = resultSet.getString("manufacturer");
                        String manNum = resultSet.getString("manufacturerNum");
                        String cTitle = resultSet.getString("cTitle");
                        String cpt = resultSet.getString("cpt");
                        String ndc = resultSet.getString("ndc");
                        String alt = resultSet.getString("alternateItem");
                    %>
                
                <tr>
                    <td>
                        <img id="myimage" style="max-width: 125px" src="image/<%=photo%>" alt="user_icon">
                    </td>
                    <td><%= itemNumber%></td>
                    <td><%=desc%></td>
                    <td><%=vendor%></td>
                    <td><%=unit%></td>

                    
                    
                    <td><%= quantity%></td>
                    <td><span>$<%= price%></span></td>
                    
                    
                    <td><%=man%></td>
                
                    <td><%=cpt%></td>
                    <td><%=ndc%></td>
                    

                    <td>
                        
                        <a href="dup_item_pharm_check.jsp?id=<%= id%>">
                    <button class="btn btn-outline-success">Add To Cart</button>
                        </a>
                    
                    </td>
                   
                
                   
                </tr>

                <%
                    session.setAttribute("itemNumber", itemNumber);
                    }
                %>
                </tbody>
            </table>
                </div>
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
                
          <input type="number" name="quantity">
             
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <form method="post" action="select_item.jsp">
        <button type="submit" class="btn btn-primary">Save changes</button>
        </form>
      </div>
    </div>
  </div>
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
