<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>

<html>
<head>
    <title>Your Orders</title>

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

        .orders-card {
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

        .btn-view {
            background-color: #0056b3;
            color: white !important;
            padding: 7px 15px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
        }

        .btn-view:hover {
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



<!-- MAIN CONTENT -->
<div class="container mt-5">

    <div class="orders-card">

        <h2 class="text-primary fw-bold text-center mb-4">Your Orders</h2>


        <!-- NO ORDERS -->
        <c:if test="${empty orders}">
            <h4 class="text-center text-danger">No orders found.</h4>

            <div class="text-center mt-4">
                <a href="products" class="btn-shop">Shop Now</a>
            </div>
        </c:if>


        <!-- ORDERS TABLE -->
        <c:if test="${not empty orders}">

            <div class="table-responsive">
                <table class="table table-bordered table-retail align-middle">

                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Total Amount</th>
                            <th>Date</th>
                            <th>Details</th>
                        </tr>
                    </thead>

                    <tbody>

                        <c:forEach var="o" items="${orders}">
                            <tr>
                                <td>${o.id}</td>
                                <td>₹${o.totalAmount}</td>
                                <td>${o.createdAt}</td>

                                <td>
                                    <a href="orderDetails?orderId=${o.id}" class="btn-view">
                                        View Items
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>

                </table>
            </div>

            <div class="text-center mt-4">
                <a href="products" class="btn-shop">Continue Shopping</a>
            </div>

        </c:if>

    </div>

</div>


<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
