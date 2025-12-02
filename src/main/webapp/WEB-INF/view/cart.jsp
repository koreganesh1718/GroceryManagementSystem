<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>

<html>
<head>
    <title>My Cart</title>

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

        .cart-card {
            background: #ffffff;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 4px 25px rgba(0,0,0,0.25);
        }

        .table-retail thead th {
            background-color: #0056b3;
            color: white;
            font-weight: 600;
        }

        .qty-btn {
            background-color: #0056b3;
            color: white;
            border: none;
            padding: 3px 10px;
            font-weight: bold;
            border-radius: 5px;
        }
        .qty-btn:hover {
            background-color: #003f80;
        }

        .btn-remove {
            background-color: #cc0000;
            color: white;
            padding: 5px 12px;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
        }
        .btn-remove:hover {
            background-color: #990000;
            color: white;
        }

        .btn-checkout {
            background-color: #0056b3;
            color: white;
            padding: 12px 28px;
            font-weight: 600;
            border-radius: 10px;
            text-decoration: none;
            border: none;
        }
        .btn-checkout:hover {
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
                data-bs-target="#navBar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navBar">
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


<!-- MAIN CONTENT -->
<div class="container mt-5">
    <div class="cart-card">

        <h2 class="text-primary fw-bold text-center mb-4">Your Cart</h2>


        <!-- EMPTY CART -->
        <c:if test="${empty cartItems}">
            <h4 class="text-center text-danger">Your cart is empty.</h4>

            <div class="text-center mt-4">
                <a href="/GroceryManagementMVC/products" class="btn-shop">Continue Shopping</a>
            </div>
        </c:if>


        <!-- CART ITEMS -->
        <c:if test="${not empty cartItems}">

            <div class="table-responsive">
                <table class="table table-bordered table-retail align-middle">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Unit</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Qty</th>
                            <th>Total</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>

                    <c:forEach var="item" items="${cartItems}">

                        <c:set var="parts" value="${fn:split(item.name, ' ')}" />
                        <c:set var="unitValue" value="${parts[fn:length(parts)-2]}" />
                        <c:set var="unitType" value="${parts[fn:length(parts)-1]}" />

                        <c:set var="productName" value="" />
                        <c:forEach var="i" begin="0" end="${fn:length(parts)-3}">
                            <c:set var="productName" value="${productName} ${parts[i]}" />
                        </c:forEach>

                        <tr>
                            <td>${fn:trim(productName)}</td>
                            <td>${unitValue} ${unitType}</td>
                            <td>${item.category}</td>
                            <td>₹${item.price}</td>

                            <td>
                                <form action="/GroceryManagementMVC/cart/update" method="post" class="d-inline">
                                    <input type="hidden" name="productId" value="${item.productId}">
                                    <button type="submit" name="quantity" value="${item.quantity - 1}" class="qty-btn">-</button>
                                    <span class="mx-2">${item.quantity}</span>
                                    <button type="submit" name="quantity" value="${item.quantity + 1}" class="qty-btn">+</button>
                                </form>
                            </td>

                            <td>₹${item.price * item.quantity}</td>

                            <td>
                                <a href="/GroceryManagementMVC/cart/remove/${item.productId}"
                                   onclick="return confirm('Remove item from cart?');"
                                   class="btn-remove">
                                   Remove
                                </a>
                            </td>
                        </tr>

                    </c:forEach>

                    </tbody>

                </table>
            </div>

            <h3 class="text-success fw-bold mt-3">
                Total Amount: ₹${total}
            </h3>

            <div class="text-center mt-4">
                <a href="/GroceryManagementMVC/checkout" class="btn-checkout">Proceed to Checkout</a>
            </div>

            <!-- ONLY ONE Continue Shopping -->
            <div class="text-center mt-4">
                <a href="/GroceryManagementMVC/products" class="btn-shop">Continue Shopping</a>
            </div>

        </c:if>

    </div>
</div>




<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
