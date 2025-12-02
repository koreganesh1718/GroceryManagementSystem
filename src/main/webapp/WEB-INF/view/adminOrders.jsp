<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>

<html>
<head>
    <title>All Orders - Admin</title>

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

        .orders-card {
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

        .btn-view {
            background-color: #0056b3;
            color: white;
            padding: 6px 15px;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
        }

        .btn-view:hover {
            background-color: #003f80;
            color: white;
        }

        .btn-back {
            background-color: #0056b3;
            color: white;
            padding: 10px 20px;
            border-radius: 10px;
            font-weight: 600;
            border: none;
            text-decoration: none;
        }

        .btn-back:hover {
            background-color: #003f80;
            color: white;
        }
    </style>

</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary py-3">
    <div class="container-fluid">

        <a class="navbar-brand fw-bold text-white" href="/GroceryManagementMVC/admin/dashboard">
            Admin - Prusti Home Mart
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navBar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navBar">
            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link text-white" href="/GroceryManagementMVC/admin/products">Manage Products</a>
                </li>

                <c:if test="${not empty sessionScope.username}">
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


<!-- MAIN CONTAINER -->
<div class="container mt-5">

    <div class="orders-card">

        <h2 class="text-primary fw-bold text-center mb-4">All Orders</h2>

        <div class="table-responsive">
            <table class="table table-bordered table-retail align-middle">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Username</th>
                        <th>Total Amount</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td>${order.id}</td>
                            <td>${order.username}</td>
                            <td>₹${order.totalAmount}</td>
                            <td>${order.createdAt}</td>
                            <td>
                                <a href="../orderDetails?orderId=${order.id}" class="btn-view">
                                    View Details
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>

            </table>
        </div>

        <div class="text-center mt-4">
            <a href="../admin/dashboard" class="btn-back">Go Back</a>
        </div>

    </div>

</div>

<!-- BOOTSTRAP JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
