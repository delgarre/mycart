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
                <option value="Admin-Sawyer Road">Admin-Sawyer Road</option>
                <option value="Beach">Beach</option>
                <option value="Bethkom-State Street">Bethkom-State Street</option>
                <option value="Billing">Billing</option>
                <option value="Bosque">Bosque</option>
                <option value="Bradenton South">Bradenton South</option>
                <option value="Brandon">Brandon</option>
                <option value="Brooklyn Park">Brooklyn Park</option>
                <option value="Captiva Beach Resort">Captiva Beach Street</option>
                <option value="Dunn">Dunn</option>
                <option value="Ellenton">Ellenton</option>
                <option value="Emerson">Emerson</option>
                <option value="Frog Hop">Frog Hop</option>
                <option value="Fort Myers-Phys">Fort Myers-Phys</option>
                <option value="Hibiscus Inn & Suites">Hibiscus Inn & Suites</option>
                <option value="Himes Avenue">Himes</option>
                <option value="IT Department-Sawyer Road">IT Department-Sawyer Road</option>
                <option value="Kasota">Kasota</option>
                <option value="Lakeland">Lakeland</option>
                <option value="Largo">Largo</option>
                <option value="New Port Richey">New Port Richey</option>
                <option value="Normandy">Normandy</option>
                <option value="Orange Park">Orange Park</option>
                <option value="Palm Insure">Palm Insure</option>
                <option value="Pharmacy">Pharmacy</option>
                <option value="Physicians Group Inc">Physicians Group Inc</option>
                <option value="Port Charlotte">Port Charlotte</option>
                <option value="Ramada">Ramada</option>
                <option value="Robbinsdale">Robbinsdale</option>
                <option value="San Mateo">San Mateo</option>
                <option value="Sarasota Group">Sarasota Group</option>
                <option value="SCOC">SCOC</option>
                <option value="SCOD">SCOD</option>
                <option value="SCOJ">SCOJ</option>
                <option value="SCOL">SCOL</option>
                <option value="SCOP">SCOP</option>
                <option value="SCOS">SCOS</option>
                <option value="SCOT">SCOT</option>
                <option value="Sebring">Sebring</option>
                <option value="Spring Hill">Spring Hill</option>
                <option value="Spruce Tree">Spruce Tree</option>
                <option value="ST Pete">ST Pete</option>
                <option value="Tampa North">Tampa North</option>
                <option value="Temple Terrace">Temple Terrace</option>
                <option value="The Lucky Spot">The Lucky Spot</option>
                <option value="West Coast Law">West Coast Law</option>
                <option value="Winter Haven">Winter Haven</option>
            </select>
            
            <input type="hidden" name="user" value ="<%=id%>">
            <input type="submit" value="submit">
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
