<%@page import="com.learn.mycart.entities.User"%>
<%
    User user1 = (User)session.getAttribute("current-user");



%>


<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container">
        <a class="navbar-brand" href="admin_home.jsp">DSE Portal</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="admin_home.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      
     
      <li class="nav-item active">
        <a class="nav-link" href="admin.jsp">Admin <span class="sr-only">(current)</span></a>
      </li>
      
        </ul>
      <ul class="navbar-nav ml-auto">
          
          
          
            
          
          
          <%
              if(user1==null)
              {
          %>
                   <li class="nav-item active">
                    <a class="nav-link" href="login.jsp">Login </a>
                   </li>
      
                   
                  
           <%
              }
              else
              {
           %>     
            <li class="nav-item active">
                <a class="nav-link" href="<%= user1.getUserType().equals("admin") ? "admin.jsp" : "home.jsp"%>"><%= user1.getUserName()%> </a>
            </li>
      
            <li class="nav-item active">
                <a class="nav-link" href="LogoutServlet">Logout </a>
            </li>
           
           <%      
              }
           %>
          
         
      </ul>
    
  </div>
    </div>
</nav>
