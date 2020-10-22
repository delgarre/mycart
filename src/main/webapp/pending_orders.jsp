
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pending Orders</title>
    </head>
    <body>
        <div class="table" id="carts">
            <div class="orders">
                
            </div>
            
        </div>
    </body>
    <script>
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
    </script>
</html>
