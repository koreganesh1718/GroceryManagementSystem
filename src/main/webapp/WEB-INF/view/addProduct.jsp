<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>

<html>
<head>
    <title>Add Product</title>

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

        .form-card {
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 5px 25px rgba(0,0,0,0.25);
            border: 1px solid #e0e0e0;
        }

        .btn-retail {
            background-color: #0056b3;
            color: white;
            font-weight: 600;
            border-radius: 10px;
            padding: 12px 20px;
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
            Prusti Home Mart
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link text-white" href="/GroceryManagementMVC/admin/dashboard">Admin Dashboard</a>
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


<!-- FORM SECTION -->
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-6 col-md-8">

            <div class="form-card">

                <h3 class="text-center mb-4 text-primary fw-bold">Add New Product</h3>

                <form action="<c:url value='/admin/addProduct' />" method="post">

                    <div class="mb-3">
                        <label class="form-label">Product Name</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Unit Value</label>
                        <input type="text" name="unitValue" class="form-control" placeholder="e.g., 1, 500, 25" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Unit Type</label>
                        <select name="unitType" class="form-select" required>
                            <c:forEach items="${units}" var="u">
                                <option value="${u}">${u}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Price</label>
                        <input type="text" name="price" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Quantity</label>
                        <input type="text" name="quantity" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <input type="text" name="description" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Category</label>
                        <select name="category" class="form-select" required>
                            <option value="Rice & Grains">Rice & Grains</option>
                            <option value="Atta & Flour">Atta & Flour</option>
                            <option value="Pulses">Pulses</option>
                            <option value="Spices">Spices</option>
                            <option value="Vegetables">Vegetables</option>
                            <option value="Fruits">Fruits</option>
                            <option value="Oil & Ghee">Oil & Ghee</option>
                            <option value="Dairy">Dairy</option>
                            <option value="Snacks">Snacks</option>
                            <option value="General">General</option>
                        </select>
                    </div>

                    <div class="text-center mt-4">
                        <button type="submit" class="btn-retail px-5">Add Product</button>
                    </div>

                </form>

            </div>
        </div>
    </div>
</div>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
