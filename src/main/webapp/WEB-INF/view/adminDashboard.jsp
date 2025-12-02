<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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

        .dashboard-card {
            background: #ffffff;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0px 5px 25px rgba(0,0,0,0.25);
        }

        .stat-card {
            border-radius: 15px;
            padding: 25px;
            color: white;
        }

        .bg-blue {
            background: #0056b3;
        }

        .bg-green {
            background: #2e8b57;
        }

        .bg-orange {
            background: #ff8c00;
        }

        .bg-red {
            background: #cc0000;
        }

        .table-retail th {
            background: #0056b3;
            color: white;
            font-weight: 600;
        }

        .btn-retail {
            background-color: #0056b3;
            color: white;
            font-weight: 600;
            border-radius: 10px;
            padding: 10px 25px;
            border: none;
        }

        .btn-retail:hover {
            background-color: #004494;
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

                <li class="nav-item">
                    <a class="nav-link text-white" href="/GroceryManagementMVC/admin/products">Manage Products</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link text-white" href="/GroceryManagementMVC/admin/orders">View Orders</a>
                </li>

                <c:if test="${not empty sessionScope.username}">
                    <li class="nav-item">
                        <span class="nav-link text-light">Welcome, ${sessionScope.username}</span>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link text-warning" href="/GroceryManagementMVC/logout">Logout</a>
                    </li>
                </c:if>

            </ul>
        </div>

    </div>
</nav>



<!-- DASHBOARD SECTION -->
<div class="container mt-5">

    <h2 class="text-center fw-bold text-primary mb-4">Admin Dashboard</h2>

    <!-- STATISTICS CARDS -->
    <div class="row g-4 mb-4">

        <div class="col-md-3">
            <div class="stat-card bg-blue text-center">
                <h5>Total Orders</h5>
                <h3>${totalOrders}</h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="stat-card bg-green text-center">
                <h5>Total Revenue</h5>
                <h3>₹${totalRevenue}</h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="stat-card bg-orange text-center">
                <h5>Today's Orders</h5>
                <h3>${todayOrders}</h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="stat-card bg-red text-center">
                <h5>Today's Revenue</h5>
                <h3>₹${todayRevenue}</h3>
            </div>
        </div>

    </div>



    <!-- TOP SELLING PRODUCTS -->
    <div class="dashboard-card mt-4">

        <h4 class="fw-bold mb-3 text-primary">Top Selling Products</h4>

        <table class="table table-bordered table-retail">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Total Quantity Sold</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="p" items="${topProducts}">
                    <c:set var="parts" value="${fn:split(p.productName, ' ')}" />
                    <tr>
                        <td>${parts[0]}</td>
                        <td>${p.qty}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </div>


    <!-- ACTION BUTTONS -->
    <div class="text-center mt-4">
        <a href="/GroceryManagementMVC/admin/products" class="btn-retail me-3">Manage Products</a>
        <a href="/GroceryManagementMVC/admin/orders" class="btn-retail">View All Orders</a>
    </div>

</div>



<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
