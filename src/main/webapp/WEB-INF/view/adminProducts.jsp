<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>

<html>
<head>
    <title>Manage Products</title>

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

        .card-retail {
            background: white;
            border-radius: 15px;
            padding: 35px;
            box-shadow: 0 4px 25px rgba(0,0,0,0.25);
        }

        .table-retail thead th {
            background-color: #0056b3;
            color: white;
            font-weight: 600;
        }

        .btn-edit {
            background-color: #007bff;
            color: white;
            padding: 5px 12px;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
        }
        .btn-edit:hover {
            background-color: #0056b3;
        }

        .btn-delete {
            background-color: #cc0000;
            color: white;
            padding: 5px 12px;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
        }
        .btn-delete:hover {
            background-color: #990000;
        }

        .btn-add {
            background-color: #0056b3;
            color: white;
            padding: 10px 20px;
            font-weight: 600;
            border-radius: 10px;
            text-decoration: none;
        }

        .btn-add:hover {
            background-color: #003f80;
        }

    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary py-3">
    <div class="container-fluid">

        <a class="navbar-brand fw-bold text-white" href="/GroceryManagementMVC/admin/dashboard">
            Prusti Home Mart - Admin
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#adminNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="adminNav">
            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link text-white" href="/GroceryManagementMVC/admin/orders">View Orders</a>
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


<!-- MAIN CONTENT -->
<div class="container mt-5">

    <div class="card-retail">

        <div class="d-flex justify-content-between mb-4">
            <h2 class="text-primary fw-bold">Manage Products</h2>
            <a href="/GroceryManagementMVC/admin/addProduct" class="btn-add">+ Add New Product</a>
        </div>

        <div class="table-responsive">
            <table class="table table-bordered table-retail align-middle">

                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Unit</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Category</th>
                        <th>Description</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>

                <c:forEach var="p" items="${products}">
                    <!-- SPLIT NAME -->
                    <c:set var="parts" value="${fn:split(p.name, ' ')}" />

                    <c:set var="unitValue" value="${parts[fn:length(parts)-2]}" />
                    <c:set var="unitType" value="${parts[fn:length(parts)-1]}" />

                    <c:set var="productName" value="" />
                    <c:forEach var="i" begin="0" end="${fn:length(parts)-3}">
                        <c:set var="productName" value="${productName} ${parts[i]}" />
                    </c:forEach>

                    <tr>
                        <td>${p.id}</td>
                        <td>${fn:trim(productName)}</td>
                        <td>${unitValue} ${unitType}</td>
                        <td>₹${p.price}</td>
                        <td>${p.quantity}</td>
                        <td>${p.category}</td>
                        <td>${p.description}</td>

                        <td>

                            <a href="/GroceryManagementMVC/admin/editProduct/${p.id}" class="btn-edit">
                                Edit
                            </a>

                            <a href="/GroceryManagementMVC/admin/deleteProduct/${p.id}"
                               onclick="return confirm('Delete this product?');"
                               class="btn-delete ms-2">
                                Delete
                            </a>

                        </td>
                    </tr>

                </c:forEach>

                </tbody>

            </table>
        </div>

        <div class="text-center mt-3">
            <a href="/GroceryManagementMVC/admin/dashboard" class="btn-add">Back to Dashboard</a>
        </div>

    </div>

</div>


<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
