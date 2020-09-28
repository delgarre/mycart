<%@page import="com.learn.mycart.entities.User"%>
<%
    User user1 = (User)session.getAttribute("current-user");



%>


<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container">
        <a class="navbar-brand" href="home.jsp">DSE Portal</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
    </ul>
      <ul class="navbar-nav ml-auto">
          
          
          
          <li class="nav-item active">
              <a class="nav-link" href="cart_modal.jsp" data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus" style="  color: gold"></i> <span class="ml-2 cart-items"> ( 0 ) </span> </a>
          </li>
                 
          
          
          <%
              if(user1==null)
              {
          %>
                   <li class="nav-item active">
                    <a class="nav-link" href="login.jsp">Login </a>
                   </li>
      
                   <li class="nav-item active">
                    <a class="nav-link" href="register.jsp">Register </a>
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
    <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search"  aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit" onclick="searchFunction()">Search</button>
    </form>
  </div>
    </div>
</nav>

