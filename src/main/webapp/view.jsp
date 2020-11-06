<%@page import="com.learn.mycart.servlets.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    String id = request.getParameter("id");
    try {
        Connection con = DB.getConnection();
        PreparedStatement ps = con.prepareStatement("select * from Product where pId=?");
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            Blob blob = rs.getBlob("pPic");
            byte byteArray[] = blob.getBytes(1, (int) blob.length());
            response.setContentType("image/gif");
            OutputStream os = response.getOutputStream();
            os.write(byteArray);
            os.flush();
            os.close();
        } else {
            System.out.println("No image found with this id.");
        }
    } catch (Exception e) {
        out.println(e);
    }
%>

<div class="modal fade">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-body">
                <h4>Photo</h4>
            <img src="getImage.jsp?id=<%=id%>"/>
            </div>
        </div>
    </div>
</div>
