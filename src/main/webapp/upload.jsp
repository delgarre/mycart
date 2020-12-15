<%-- 
    Document   : upload
    Created on : Dec 14, 2020, 6:27:16 PM
    Author     : garre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <h3>File Upload:</h3>
      Select a file to upload: <br />
      <form action = "UploadServlet" method = "post" enctype = "multipart/form-data">
         <input type = "file" name = "file" size = "50" />
         
         <br />
         <input type = "submit" value = "Upload File" />
      </form>
      <!--
      <table>
          <tr>
              <th>Pic</th>
              <th>Name</th>
          </tr>
          <tr>
              <td>
      <img style="max-width: 125px" class="img-fluid rounded-circle" src="image/beach2.jpg" alt="user_icon">
              </td>
              <td>
                  Beach
              </td>
          </tr>
      </table>
      -->
    </body>
</html>
