<%@page import="com.learn.mycart.dao.CompanyDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.User"%>
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
%>
<%
String id = request.getParameter("id");
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
String sql ="select * from Test where user_id =  "+id;
resultSet = statement.executeQuery(sql);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Info</title>
        <%@include file="components/common_css_js.jsp" %>
<script>
function goBack(){
        window.history.back();
    } 
    
</script>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>Locations</h1>
        <div class="container-fluid">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
        <div class="col-md-2">
        <form action="add_location.jsp" method="POST">
            <h6>Add Location:</h6>
            <select name="location" id="location">
                <option value="ADMIN-SAWYER ROAD">ADMIN-SAWYER ROAD</option>
                <option value="BEACHBLVD">Beach</option>
                <option value="BETHKOM-STATE STREET">BETHKOM-STATE STREET</option>
                <option value="BILLING">BILLING</option>
                <option value="BRADENTON">BRADENTON</option>
                <option value="BRANDON">BRANDON</option>
                <option value="BROOKLYN PARK">BROOKLYN PARK</option>
                <option value="CAPTIVA BEACH RESORT">CAPTIVA BEACH RESORT</option>
                <option value="DUNNAVENUE">DUNNAVENUE</option>
                <option value="ELLENTON">ELLENTON</option>
                <option value="EMERSON">EMERSON</option>
                <option value="FROG HOP">FROG HOP</option>
                <option value="FTMYERS">FTMYERS</option>
                <option value="HIBISCUS INN & SUITES">HIBISCUS INN & SUITES</option>
                <option value="HIMES AVENUE">HIMES AVENUE</option>
                <option value="IT DEPARTMENT-SAWYER ROAD">IT DEPARTMENT-SAWYER ROAD</option>
                <option value="KASOTA">KASOTA</option>
                <option value="LAKELAND">LAKELAND</option>
                <option value="LARGO">LARGO</option>
                <option value="NEW PORT RICHEY">NEW PORT RICHEY</option>
                <option value="NORMANDY">NORMANDY</option>
                <option value="ORANGE PARK">ORANGE PARK</option>
                <option value="PALM INSURE">PALM INSURE</option>
                <option value="PHARMACY">PHARMACY</option>
                <option value="PHYSICIANS GROUP INC-HAND SANITIZER">PHYSICIANS GROUP INC-HAND SANITIZER</option>
                <option value="PORT CHARLOTTE">PORT CHARLOTTE</option>
                <option value="RAMADA">RAMADA</option>
                <option value="ROBBINSDALE">ROBBINSDALE</option>
                <option value="SAN MATEO">SAN MATEO</option>
                <option value="SARASOTA GROUP">SARASOTA GROUP</option>
                <option value="SCOC">SCOC</option>
                <option value="SCOD">SCOD</option>
                <option value="SCOJ">SCOJ</option>
                <option value="SCOL">SCOL</option>
                <option value="SCOP">SCOP</option>
                <option value="SCOS">SCOS</option>
                <option value="SCOT">SCOT</option>
                <option value="SEBRING">SEBRING</option>
                <option value="SPRING HILL">SPRING HILL</option>
                <option value="SPRUCE TREE">SPRUCE TREE</option>
                <option value="STPETERSBURG">STPETERSBURG</option>
                <option value="TAMPANORTH">TAMPANORTH</option>
                <option value="TEMPLE TERRACE">TEMPLE TERRACE</option>
                <option value="THE LUCKY SPOT">THE LUCKY SPOT</option>
                <option value="WEST COAST LAW">WEST COAST LAW</option>
                <option value="WINTER HAVEN">WINTER HAVEN</option>
            </select>
            
            <input type="hidden" name="user" value ="<%=id%>">
            <button class="btn btn-warning" onclick="goBack()">Go Back</button>
            <input type="submit" value="Add Location" class="btn btn-success">
        </form>
        </div>
        <div class="col-md-8">
       
        
        
        <table class="table table-bordered ">
            <tr>
                <th>Id</th>
                <th>Locations</th>
                <th>Action</th>
            </tr>
            <tr>
                 <%
                while(resultSet.next()){
                String t_id = resultSet.getString("id");
                String comp_name = resultSet.getString("comp_name");
                %>
                <td><%=t_id%></td>
                <td><%=comp_name%></td>
                <td>
                    
                    <a href="delete_location.jsp?id=<%=t_id%>">
                        <button type="button" class="btn-outline-danger">Remove</button>
                    </a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        </div>
        </div>
<%

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
    </body>
</html>
