<%@page import="com.learn.mycart.entities.User"%>

<%@page import="com.learn.mycart.entities.Company"%>
<%
    User user1 = (User)session.getAttribute("current-user");

    Company company = (Company)session.getAttribute("location");
    

%>


<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container">
        <a class="navbar-brand" href="#">DSE Portal</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="items.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
          <a class="nav-link" href="pending_orders.jsp?id=<%=user1.getUserId()%>">Cart <span class="sr-only">(current)</span></a>
      </li>
      
       <li class="nav-item active">
        <a class="nav-link" href="admin.jsp">Admin <span class="sr-only">(current)</span></a>
      </li>
      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search Name" onkeyup="searchFunction()" aria-label="Search" id="myInput">
    </form>
    </ul>
      <ul class="navbar-nav ml-auto">
          
          <%
           if(company == null)
            {
           
            
            

           %>
           <li class="nav-item active">
              <a href="dropdown.jsp?id=<%= user1.getUserId()%>"></a>
           </li>
           
          <%
              }
              else
              {
           %> 
        
            <li class="nav-item active">
              <a class="nav-link" href="#!"><%= company.getCompanyName()%> </a>
            </li>  
          
           
           <%      
              }
           %>

          
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
                <a class="nav-link" href="#!"><%= user1.getUserName()%> </a>
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

