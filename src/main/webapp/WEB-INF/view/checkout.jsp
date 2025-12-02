<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>

<html>
<head>
    <title>Checkout</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background:
            linear-gradient(rgba(255,255,255,0.7), rgba(255,255,255,0.7)),
            url('https://images.unsplash.com/photo-1585325701482-c2f4d4a68688?auto=format&fit=crop&w=1400&q=60');
            background-size: cover;
            background-position: center;
            min-height: 100vh;
        }

        .checkout-card {
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 25px rgba(0,0,0,0.25);
        }

        .table-retail thead th {
            background-color: #0056b3;
            color: white;
            font-weight: 600;
        }

        .btn-place {
            background-color: #0056b3;
            color: white;
            padding: 12px 28px;
            font-weight: 600;
            border-radius: 10px;
            text-decoration: none;
            border: none;
        }
        .btn-place:hover {
            background-color: #003f80;
        }

        .btn-shop {
            background-color: #007bff;
            color: white;
            padding: 10px 25px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 600;
        }
        .btn-shop:hover {
            background-color: #0056b3;
        }

    </style>

</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary py-3">
    <div class="container-fluid">

        <a class="navbar-brand fw-bold text-white" href="/GroceryManagementMVC/">
            Prusti Home Mart
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navLinks">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navLinks">
            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link text-white" href="/GroceryManagementMVC/products">Products</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link text-white" href="/GroceryManagementMVC/cart">Cart</a>
                </li>

                <c:if test="${not empty sessionScope.username}">
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/GroceryManagementMVC/orders">My Orders</a>
                    </li>

                    <li class="nav-item">
                        <span class="nav-link text-light">Welcome, ${sessionScope.username}</span>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link text-warning fw-bold" href="/GroceryManagementMVC/logout">Logout</a>
                    </li>
                </c:if>

                <c:if test="${empty sessionScope.username}">
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/GroceryManagementMVC/login">Login</a>
                    </li>
                </c:if>

            </ul>
        </div>

    </div>
</nav>



<!-- CHECKOUT AREA -->
<div class="container mt-5">
    <div class="checkout-card">

        <h2 class="text-primary fw-bold text-center mb-4">Checkout</h2>


        <!-- EMPTY CART -->
        <c:if test="${empty cartItems}">
            <h4 class="text-danger text-center">Your cart is empty.</h4>

            <div class="text-center mt-4">
                <a href="/GroceryManagementMVC/products" class="btn-shop">Continue Shopping</a>
            </div>
        </c:if>



        <!-- DISPLAY CART ITEMS -->
        <c:if test="${not empty cartItems}">

            <div class="table-responsive">
                <table class="table table-bordered table-retail align-middle">

                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Unit</th>
                            <th>Price</th>
                            <th>Qty</th>
                            <th>Total</th>
                        </tr>
                    </thead>

                    <tbody>

                        <c:forEach var="item" items="${cartItems}">

                            <c:set var="parts" value="${fn:split(item.name, ' ')}" />

                            <!-- unit -->
                            <c:set var="unitValue" value="${parts[fn:length(parts)-2]}" />
                            <c:set var="unitType" value="${parts[fn:length(parts)-1]}" />

                            <!-- name (first word only) -->
                            <c:set var="productName" value="${parts[0]}" />

                            <tr>
                                <td>${productName}</td>
                                <td>${unitValue} ${unitType}</td>

                                <td>₹${item.price}</td>
                                <td>${item.quantity}</td>
                                <td>₹${item.price * item.quantity}</td>
                            </tr>

                        </c:forEach>

                    </tbody>

                </table>
            </div>



            <!-- TOTAL AMOUNT -->
            <h3 class="text-success fw-bold">
                Total Amount: ₹${total}
            </h3>



            <!-- PLACE ORDER BUTTON -->
            <div class="text-center mt-4">
                <a href="/GroceryManagementMVC/placeOrder" class="btn-place">
                    Place Order
                </a>
            </div>

        </c:if>



        <div class="text-center mt-4">
            <a href="/GroceryManagementMVC/products" class="btn-shop">Continue Shopping</a>
        </div>

    </div>
</div>


<!-- BOOTSTRAP JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
