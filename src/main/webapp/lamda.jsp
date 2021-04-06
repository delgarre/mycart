<%@page import="com.learn.mycart.entities.Item"%>
<%@page import="com.learn.mycart.dao.ItemDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.Company"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.CompanyDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
    User user = (User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message", "You are not logged in!");
        response.sendRedirect("index.jsp");
        return;
    }
    else
    {
        if(user.getUserType().equals("normal"))
        {
            session.setAttribute("message", "Admin level required!");
            response.sendRedirect("index.jsp");
            return;
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Locations</title>
        <%@include file="components/common_css_js.jsp" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/webcamjs/1.0.25/webcam.js">
        </script>
        
<script type="text/javascript" src="jspdf.debug.js"></script>
        <script type="text/javascript">
        function demoFromHTML() {
            var pdf = new jsPDF('p', 'pt', 'letter');
            // source can be HTML-formatted string, or a reference
            // to an actual DOM element from which the text will be scraped.
            source = $('#customers')[0];

            // we support special element handlers. Register them with jQuery-style 
            // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
            // There is no support for any other type of selectors 
            // (class, of compound) at this time.
            specialElementHandlers = {
                // element with id of "bypass" - jQuery style selector
                '#bypassme': function(element, renderer) {
                    // true = "handled elsewhere, bypass text extraction"
                    return true;
                }
            };
            margins = {
                top: 50,
                bottom: 60,
                left: 20,
                width: 100000
            };
            // all coords and widths are in jsPDF instance's declared units
            // 'inches' in this case
            pdf.fromHTML(
                    source, // HTML string or DOM elem ref.
                    margins.left, // x coord
                    margins.top, {// y coord
                        'width': margins.width, // max width of content on PDF
                        'elementHandlers': specialElementHandlers
                    },
            function(dispose) {
                // dispose: object with X, Y of the last line add to the PDF 
                //          this allow the insertion of new lines after html
                pdf.save('Test.pdf');
            }
            , margins);
        }
    </script>

<style>
.center {
  margin: auto;
  width: 60%;
  border: navy;
  padding: 10px;
}
</style>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="center">
            <h2>Locations:</h2>
            <br>
            <div class="row ml-2">
            <a href="add_company.jsp">
                <button class="btn btn-outline-success">Add location</button>
            </a>
                <a href="l_company.jsp">
                <button class="btn btn-outline-primary">Companies</button>
            </a>
        </div>
        <div class="col-md-8">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="table-responsive-sm">
                <div id="customers">
      <button onclick="javascript:demoFromHTML()">PDF</button>
                <table class="table table-bordered " >
                    <tr>
                        <th>Vendor</th>
                        <th>Description</th>
                        <th>Item #</th>
                        
                        <th>UOM</th>
                        <th>Category</th>
                        <th>CPT</th>
                        <th>QTY</th>
                        <th>Cost</th>
                       
                    </tr>
                    
                    
                    <%
                        ItemDao cpDao = new ItemDao(FactoryProvider.getFactory());
                        List<Item> cpList = cpDao.getItems();
                    %>
                    
                    <%
                        for(Item cp: cpList){
                       // cpList.forEach(cp ->{
                        
                       // });
                    %>
                    
                    <tr>
                        <td><%= cp.getvTitle()%></td>
                        <td><%= cp.getpDesc()%></td>
                        <td><%= cp.getItemNumber()%></td>
                        
                        <td><%=cp.getUnitOfMeasure()%></td>
                        <td><%= cp.getcTitle()%></td>
                        <td><%= cp.getCpt()%></td>
                        <td><%=cp.getQuantity()%></td>
                        <td><span>$<%=cp.getPrice()%></span></td>
                    
            </tr>
            <%
            }
            %>
                    
                </table>
                </div>
            </div>
        </div>
        </div>        
    </body>
</html>
