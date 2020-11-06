
package com.learn.mycart.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "uploadImage", urlPatterns = {"/uploadImage"})
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class uploadImage extends HttpServlet{
    
    PrintWriter out;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        int result = 0;
        Part part = request.getPart("image");
        String id = request.getParameter("pId");
        int personID = Integer.parseInt(id);
        if (part != null && id !=null) {
            try {
                Connection con = DB.getConnection();
                PreparedStatement ps = con.prepareStatement("Update Product set pPic=? where pId="+id);
                InputStream is = part.getInputStream();
                ps.setBlob(1, is);
                result = ps.executeUpdate();
                if (result > 0) {
                    response.sendRedirect("products.jsp");
                } else {
                    response.sendRedirect("index.jsp?message=Some+Error+Occurred");
                }
            } catch (Exception e) {
                out.println(e);
            }
        }
    }

}

