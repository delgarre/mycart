<%@page import="com.learn.mycart.entities.User"%>
<%@page import="com.learn.mycart.dao.UserDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%
    User user = (User)session.getAttribute("current-user");
    try
{
  
        
            
            //System.out.println(user);
            HttpSession httpSession = request.getSession();
            
            if(user == null)
            {
                httpSession.setAttribute("message", "Invalid details. Try again.");
                response.sendRedirect("index.jsp");
                return;
            }
            else{
                out.println("<h1>Welcome " + user.getUserName() + "</h1>");
                //login
                httpSession.setAttribute("current-user", user);
                
                if(user.getUserType().equals("admin")){
                    //admin-admin.jsp
                    response.sendRedirect("admin.jsp");
                }
                else if(user.getUserType().equals("normal")){
                    
                    response.sendRedirect("user_page.jsp");
                    
                    //response.sendRedirect("dropdown.jsp?id="+user.getUserId());
                    //response.sendRedirect("home.jsp");
                }
                else
                {
                    out.println("We have not identified user type");
                }
            }
                
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
                
%>
