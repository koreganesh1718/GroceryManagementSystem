<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>

<html>
<head>
    <title>Admin Dashboard</title>

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

        .menu-card {
            background: white;
            border-radius: 15px;
            padding: 40px 50px;
            box-shadow: 0 4px 25px rgba(0,0,0,0.25);
        }

        .btn-retail {
            background-color: #0056b3;
            color: white;
            font-weight: 600;
            border-radius: 10px;
            padding: 12px 25px;
            border: none;
            display: block;
            width: 100%;
            margin-bottom: 15px;
            text-align: center;
            text-decoration: none;
        }

        .btn-retail:hover {
            background-color: #004494;
            color: white;
        }

    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary py-3">
    <div class="container-fluid">

        <a class="navbar-brand fw-bold text-white" href="/GroceryManagementMVC/">
            Prusti Home Mart - Admin
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#adminNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="adminNav">

            <ul class="navbar-nav ms-auto">

                <c:if test="${not empty sessionScope.username}">
                    <li class="nav-item">
                        <span class="nav-link text-light">
                            Welcome, ${sessionScope.username}
                        </span>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link text-warning fw-bold"
                           href="/GroceryManagementMVC/logout">Logout</a>
                    </li>
                </c:if>

                <c:if test="${empty sessionScope.username}">
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/GroceryManagementMVC/login">Login</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link text-white" href="/GroceryManagementMVC/register">Register</a>
                    </li>
                </c:if>

            </ul>

        </div>
    </div>
</nav>


<!-- MAIN CONTENT SECTION -->
<div class="container d-flex justify-content-center align-items-center" style="min-height:80vh;">
    <div class="menu-card text-center">

        <h2 class="text-primary fw-bold mb-4">Welcome Admin</h2>

        <a href="admin/products" class="btn-retail">Manage Products</a>

        <a href="../products" class="btn-retail">View Store Products</a>

        <a href="../logout" class="btn-retail">Logout</a>

    </div>
</div>


<!-- BOOTSTRAP JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
