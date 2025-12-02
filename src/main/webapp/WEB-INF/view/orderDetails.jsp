<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Order Details</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background:
            linear-gradient(rgba(255,255,255,0.75), rgba(255,255,255,0.75)),
            url('https://images.unsplash.com/photo-1585325701482-c2f4d4a68688?auto=format&fit=crop&w=1400&q=60');
            background-size: cover;
            background-position: center;
            min-height: 100vh;
        }

        .details-card {
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 25px rgba(0,0,0,0.20);
        }

        .table-retail thead th {
            background-color: #0056b3;
            color: white;
            font-weight: 600;
        }

        .btn-retail {
            background-color: #0056b3;
            color: white !important;
            padding: 10px 22px;
            font-weight: 600;
            border-radius: 10px;
            text-decoration: none;
            display: inline-block;
            margin: 0 5px;
        }

        .btn-retail:hover {
            background-color: #003f80;
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

                <c:if test="${not empty sessionScope.username}">
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/GroceryManagementMVC/cart">Cart</a>
                    </li>

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



<!-- ORDER DETAILS CONTENT -->
<div class="container mt-5">

    <div class="details-card">

        <h2 class="text-primary fw-bold text-center mb-4">
            Order Details – ID: ${orderId}
        </h2>


        <!-- EMPTY CASE -->
        <c:if test="${empty items}">
            <h4 class="text-center text-danger">No items found for this order.</h4>
        </c:if>


        <!-- ITEMS TABLE -->
        <c:if test="${not empty items}">

            <div class="table-responsive">
                <table class="table table-bordered table-retail align-middle">

                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Qty</th>
                            <th>Total</th>
                        </tr>
                    </thead>

                    <tbody>

                        <c:forEach var="item" items="${items}">
                            <tr>
                                <td>${item.name}</td>
                                <td>${item.category}</td>
                                <td>₹${item.price}</td>
                                <td>${item.quantity}</td>
                                <td>₹${item.price * item.quantity}</td>
                            </tr>
                        </c:forEach>

                    </tbody>

                </table>
            </div>

        </c:if>


        <!-- ACTION BUTTONS -->
         <!--<div class="text-center mt-4">
            <a href="/GroceryManagementMVC/orders" class="btn-retail">Back to Orders</a>
            <a href="/GroceryManagementMVC/products" class="btn-retail">Continue Shopping</a>
        </div>-->
        <div class="text-center mt-4">
            <a href="/GroceryManagementMVC/admin/orders" class="btn-retail">
               Go Back
            </a>
        </div>


    </div>

</div>



<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
