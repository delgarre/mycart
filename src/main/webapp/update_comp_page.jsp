<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.entities.Company"%>
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
String sql ="select * from Company where companyId="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Site</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>Make Changes!</h1>
        <form method="post" action="update_comp.jsp">
            <input type="hidden" name="companyId" value="<%=resultSet.getString("companyId") %>">
            <br>
            Name:<br>
            <input type="text" name="companyName" value="<%=resultSet.getString("companyName")%>">
            <br>
            Type:<br>
            <input type="text" name="type" value="<%=resultSet.getString("type")%>">
            <br>
            Type Location:<br>
            <input type="text" name="typeLocation" value="<%=resultSet.getString("typeLocation")%>">
            <br><br>
            <input type="submit" value="submit">
        </form>
    <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
    </body>
</html>
