
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
    User user = (User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message", "You are not logged in!");
        response.sendRedirect("index.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/user_navbar.jsp" %>
        <div class="container-fluid">
        <div class="row mt-3 mx-2">
            <%
            
            String cat=request.getParameter("category");
            //out.println(cat);
            ProductDao dao = new ProductDao(FactoryProvider.getFactory());
            List<Product> list = null;
            
            if(cat==null || cat.trim().equals("all"))
            {
                 list = dao.getAllProducts();
            }else{
                int cid =Integer.parseInt(cat.trim());
                list = dao.getAllProductsById(cid);
            }
            
            
            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
            List<Category> clist= cdao.getCategories();
           
            %>
            
            <!--show categories-->
            <div class="col-md-2">
                
                <div class="list-group mt-4">
                    
                     <a href="home.jsp?category=all" class="list-group-item list-group-item-action active">
                     All products
                     </a>
                
                
                <%
                for(Category c: clist){
                %>   
                    <a href="home.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>
                    
                <%  }
                
                %>
                
                </div>
            </div>
            
            
            
            
        <div class="col-md-8">
            <div class="table-responsive-sm">
                <table class="table table-bordered " >
                    <tr>
                <th>Photo</th>
                <th>Id</th>
                <th>Name</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
            
            <%
                            
            for(Product p: list){
                            
            %>
            
            <tr>
                <td><%= p.getpPhoto()%></td>
                <td><%= p.getpId()%></td>
                <td><%= p.getpName()%></td>
                <td><%= p.getpPrice()%></td>
                <td>
                    <button class="btn custom-bg text-white" onClick="add_to_carts(<%= p.getpId() %>, '<%= p.getpName() %>',<%= p.getpPrice() %> )">Add to Cart</button>
                </td>
            </tr>
            <%
            }
            %>
                </table>
            </div>
        </div>
        </div>
        </div>
            <%@include file="components/common_modals.jsp" %>
            <script type="text/javascript">
    function add_to_carts(pid, pname, price){
    
    
    let cart = localStorage.getItem("cart");
    if(cart === null)
    
    {
        //no cart yet
        let products = [];
        let product = {productId:pid, productName:pname, productQuantity:1, productPrice:price};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("Product is added for the first time");
    }else
    {
        //cart is already present
        let pcart = JSON.parse(cart);
        console.log("more test");
        let oldProduct = pcart.find((item) => item.productId === pid);
        if(oldProduct)
        {
            //increase quantity
            console.log("test code");
            //oldProduct.getQuantity = oldProduct.getQuantity + 1;
            pcart.map((item)=>{
                console.log(oldProduct);
                console.log(item);
                console.log("test1");
                if(item.productId === oldProduct.productId)
                {
                    item.productQuantity = oldProduct.productQuantity + 1;
                    console.log(item);
                    console.log("test2");
                }
            });
            
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product quantity more");
            
        }else
        {
            //add product
            let product = { productId:pid, productName:pname, productQuantity:1, productPrice:price};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product added!");
        }
    }
   
   
   
   updateCart();
}
//update cart:

function updateCart()
{
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if(cart===null || cart.length===0)
    {
        console.log("Cart is empty!! ");
        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h3>Cart does not have any items</h3>");
        $(".checkout-btn").attr('disabled',true);
    }else
    {
        //there is something in cart to show
        console.log(cart);
        $(".cart-items").html(`( ${cart.length} )`);
        let table = `
                    <table class='table'>
                    <thead class='thead-light'>
                        <tr>
                        <th>Item Name </th>
                        <th>Price </th>
                        <th>Quantity </th>
                        <th>Total Price </th>
                        <th>Action </th>
                         
                        </tr>
        
                    </thead>

                    `;
        
                    let totalPrice = 0;
                    cart.map((item)=>{
                        table+=`
                                <tr>
                                    <td id="productName"> ${item.productName}</td>
                                    <td id="productPrice"> ${item.productPrice}</td>
                                    <td id="productQuantity"> ${item.productQuantity}</td>
                                    <td id="totalPrice"> ${item.productQuantity * item.productPrice}</td>
                                    <td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
                                </tr>
                                `;
            
                                totalPrice += item.productPrice * item.productQuantity;
                    });
        
                    table = table + `
                    <tr><td colspan='5' class='text-right font-weight-bold'> Total Price : ${totalPrice} </td></tr>
                    </table>`;
                    $(".cart-body").html(table);
                    $(".checkout-btn").attr('disabled',false);
                    console.log("removed");
    }
}


//delete item
function deleteItemFromCart(pid)
{
    let cart = JSON.parse(localStorage.getItem('cart'));
    
    let newcart = cart.filter((item) => item.productId !== pid);
    
    localStorage.setItem('cart' ,JSON.stringify(newcart));
    
    updateCart();
}


$(document).ready(function() {
    updateCart();
});
            </script>
    </body>
</html>
