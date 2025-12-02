<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>

<html>
<head>
    <title>Grocery Store</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background:
            linear-gradient(rgba(255,255,255,0.6), rgba(255,255,255,0.6)),
            url('https://images.unsplash.com/photo-1585325701482-c2f4d4a68688?auto=format&fit=crop&w=1400&q=60');
            background-size: cover;
            background-position: center;
            min-height: 100vh;
        }

        .welcome-card {
            background: rgba(255, 255, 255, 0.90);
            border-radius: 20px;
            padding: 45px;
            color: #003366;
            box-shadow: 0px 4px 25px rgba(0, 0, 0, 0.25);
            border: 1px solid #e3e3e3;
        }

        .btn-retail {
            background-color: #007bff;
            color: white;
            font-weight: 600;
            border-radius: 10px;
            padding: 12px 30px;
            transition: 0.3s;
            border: none;
        }

        .btn-retail:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .title {
            font-size: 38px;
            font-weight: 700;
            color: #003366;
        }

        .navbar-retail {
            background-color: #0056b3 !important;
            box-shadow: 0px 2px 15px rgba(0,0,0,0.3);
        }

        .nav-link {
            color: #e6f2ff !important;
            font-weight: 600;
            margin-left: 8px;
        }

        .nav-link:hover {
            color: #ffffff !important;
            text-decoration: underline;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-retail py-3">
    <div class="container-fluid">

        <a class="navbar-brand fw-bold text-white" href="/GroceryManagementMVC/">
            Prusti Home Mart
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navItems">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navItems">
            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link" href="/GroceryManagementMVC/products">Products</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/GroceryManagementMVC/cart">Cart</a>
                </li>

                <c:if test="${not empty sessionScope.username}">
                    <li class="nav-item">
                        <a class="nav-link" href="/GroceryManagementMVC/orders">My Orders</a>
                    </li>

                    <li class="nav-item">
                        <span class="nav-link text-light">Welcome, ${sessionScope.username}</span>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link text-warning" href="/GroceryManagementMVC/logout">Logout</a>
                    </li>
                </c:if>

                <c:if test="${empty sessionScope.username}">
                    <li class="nav-item">
                        <a class="nav-link" href="/GroceryManagementMVC/login">Login</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/GroceryManagementMVC/register">Register</a>
                    </li>
                </c:if>

            </ul>
        </div>
    </div>
</nav>

<!-- CENTER CONTENT -->
<div class="container d-flex justify-content-center align-items-center" style="min-height:80vh;">
    <div class="welcome-card text-center">
        <h2 class="title mb-4">Welcome to Prusti Home Mart</h2>

        <a href="<c:url value='/products'/>" class="btn btn-retail me-3">View Products</a>
        <a href="<c:url value='/cart'/>" class="btn btn-retail">View Cart</a>
    </div>
</div>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
