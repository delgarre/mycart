<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String location = request.getParameter("location");
String user = request.getParameter("user");
String name = request.getParameter("name");
 try
                {
               
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.29.70:3306/mycart", "admin", "ordering");
                Statement st=conn.createStatement();
                
              
               String sql ="select type from Company where companyName ='"+location+"'";
ResultSet rs = st.executeQuery(sql);
if(rs.next()){
              String type = rs.getString("type");
                

               
              
                response.sendRedirect("add_location.jsp?user="+user+"&location="+location+"&type="+type+"&name="+name);
}
                }
                catch(Exception e)
                {
                System.out.print(e);
                e.printStackTrace();
                }

%>
