<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
String sql ="select * from Item where itemNumber = '"+session.getAttribute("number")+"'";
resultSet = statement.executeQuery(sql);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
       <%@include file="components/navbar.jsp" %>
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
        <form method="post" action="item_photo.jsp">
                        <%
            while(resultSet.next()){
                
                        String Id = resultSet.getString("id");
            %>
        <h2>Confirm photo for item Number:  </h2>
        <input type="text" name="id" value="<%=session.getAttribute("number")%>"><br>
        <br><br>
        <h2>Photo: </h2>
        <input type="text" name="fileName" value="<%=session.getAttribute("file")%>">
        <input type="hidden" value="<%=Id%>" name="ids" />
         <input type = "submit" value = "Upload Photo" />
         
         <%
             }
         %>
        </form>
        

<%

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
    </body>
</html>
