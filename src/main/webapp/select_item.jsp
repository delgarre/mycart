<%@page import="com.learn.mycart.entities.Item"%>
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

try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from Item where id = 1593";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<input type="text" name="id" value="<%=resultSet.getString("id") %>">

<input type="text" name="alt" value="<%=resultSet.getString("itemNumber")%>">
<input type="hidden" name="date">
<input type="text" name="user_id" value="<%=user.getUserId()%>">

<input type="hidden" name="uom" value="<%=resultSet.getString("unitOfMeasure")%>">

<input type="hidden" name="man" value="<%=resultSet.getString("manufacturer")%>">

<input type="hidden" name="mannum" value="<%=resultSet.getString("manufacturerNum")%>">

<input type="hidden" name="vTitle" value="<%=resultSet.getString("vTitle")%>">


<input type="hidden" name="cTitle" value="<%=resultSet.getString("cTitle")%>">


<input type="hidden" name="pDesc" value="<%=resultSet.getString("pDesc")%>">

<input type="hidden" name="photo" value="<%=resultSet.getString("photo")%>">

<input type="hidden" name="alt" value="<%=resultSet.getString("alternateItem")%>">

<input type="text" name="alt" value="<%=request.getParameter("quantity")%>">

<%   
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>


<%
String ids = request.getParameter("id");
String drivers = "com.mysql.jdbc.Driver";
String connectionUrls = "jdbc:mysql://172.20.29.70:3306/";
String databases = "mycart";
String userids = "admin";
String passwords = "ordering";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connections = null;
Statement statements = null;
ResultSet resultSets = null;

try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from CPT order by case when codes='E1399' then 1  else 2 end";
resultSets = statement.executeQuery(sql);

%>
<select name="cpt" id="cpt" class="form-control">
    <%
    while(resultSets.next()){
    %>
    <option value="<%=resultSets.getString("codes")%>"><%=resultSets.getString("codes")%></option>
    <%
        }
    %>
</select>

<%   

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>



