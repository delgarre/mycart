function add_to_cart(pid, pname, price){
    
    
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
                                    <td> ${item.productName}</td>
                                    <td> ${item.productPrice}</td>
                                    <td> ${item.productQuantity}</td>
                                    <td> ${item.productQuantity * item.productPrice}</td>
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
function goToCheckout(){
    window.location = "checkout.jsp";
}
function searchFunction(){
    // Declare variables
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[2];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
function orderSubmit(UserName, UserEmail){
    
    let cart = localStorage.getItem("cart");
    let user = {name:UserName, email:UserEmail};
    
    
    console.log(cart);
    if(cart===null){
     
     let carts = [];
     carts.push(cart, user);
     localStorage.setItem("cart", JSON.stringify(carts));
    }
    
    updateOrder();
}
//updateOrder
function updateOrder()
{
    let cartsString = localStorage.getItem("carts");
    let carts = JSON.parse(cartsString);
    
    if(carts === null || carts.length === 0)
    {
        $(".orders").html("<h3>No Pending Orders!<h3>");
        $(".view-btn").attr('disabled',true);
    }else
    {
        //there is something in cart to show
        console.log(carts);
        $(".orders").html(`( ${carts.length} )`);
        let orderTable = `
                    <table class='table'>
                    <thead class='thead-light'>
                        <tr>
                        <th>Order Id </th>
                        <th>User </th>
                        <th>Email </th>
                        <th>Action </th>
                         
                        </tr>
        
                    </thead>

                    `;
        
                    let orderId = 0;
                    carts.map((pending)=>{
                        orderTable+=`
                                <tr>
                                    <td> ${Math.random() * 13/2}</td>
                                    <td> ${pending.name}</td>
                                    <td> ${pending.email}</td>
                                    <td><button onclick='deletePending(${pending.orderId})' class='btn btn-danger btn-sm'>Remove</button></td>
                                    <td><button onclick='viewOrder(${pending.orderId})' class='btn-primary btn-sm'>View</button></td> 
                                </tr>
                                `;
            
                                orderId += Math.random() * 13/2;
                    });
        
                    orderTable = orderTable + `
                    
                    </table>`;
                    $(".orders").html(orderTable);
                    $(".view-btn").attr('disabled',false);
                    
    }
    
}
$(document).ready(function() {
    updateOrder();
});
