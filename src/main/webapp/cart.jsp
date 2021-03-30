<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="com.learn.mycart.dao.CompanyDao"%>
<%@page import="com.learn.mycart.dao.LocationTypeDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%
String name = request.getParameter("id");
           
            LocationTypeDao lDao = new LocationTypeDao(FactoryProvider.getFactory());
           // LocationType locationType = lDao.getByLocation(location);
            
            CompanyDao cdao  = new CompanyDao(FactoryProvider.getFactory());
            Company company = cdao.getCompanyByName(name);
         
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("location", company);
            
                httpSession.setAttribute("message","Location selected ");
            //response.sendRedirect("home.jsp");
            response.sendRedirect("l_pending_orders.jsp");
        
%>
