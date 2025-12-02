<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>

<html>
<head>
    <title>Products</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

        body {
            background:
            linear-gradient(rgba(255,255,255,0.75), rgba(255,255,255,0.75)),
            url('https://images.unsplash.com/photo-1585325701482-c2f4d4a68688?auto=format&fit=crop&w=1400&q=60');
            background-position: center;
            background-size: cover;
            min-height: 100vh;
        }

        .products-card {
            background: #ffffff;
            padding: 40px;
            border-radius: 18px;
            box-shadow: 0 6px 28px rgba(0,0,0,0.25);
        }

        .table-retail thead th {
            background-color: #0056b3;
            color: white;
            font-weight: 600;
            text-align: center;
        }

        .table-retail td {
            text-align: center;
        }

        .btn-view {
            background-color: #0056b3;
            color: #fff !important;
            padding: 7px 15px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
        }

        .btn-view:hover {
            background-color: #003f80;
        }

        .btn-back {
            background-color: #007bff;
            color: white;
            padding: 10px 25px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 600;
        }

        .btn-back:hover {
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




<!-- MAIN CONTENT -->
<div class="container mt-5">

    <div class="products-card">

        <h2 class="text-primary fw-bold text-center mb-4">Available Grocery Items</h2>


        <!-- FILTER SECTION -->
        <form action="products" method="get" class="row g-3 mb-4">

            <div class="col-md-5">
                <input type="text" name="keyword"
                       value="${param.keyword}"
                       class="form-control"
                       placeholder="Search product...">
            </div>

            <div class="col-md-4">
                <select name="category" class="form-select">
                    <option value="">All Categories</option>
                    <option>Rice & Grains</option>
                    <option>Atta & Flour</option>
                    <option>Pulses</option>
                    <option>Spices</option>
                    <option>Vegetables</option>
                    <option>Fruits</option>
                    <option>Oil & Ghee</option>
                    <option>Dairy</option>
                    <option>Snacks</option>
                </select>
            </div>

            <div class="col-md-3">
                <button type="submit" class="btn btn-primary w-100 fw-bold">Filter</button>
            </div>

        </form>


        <!-- PRODUCTS TABLE -->
        <div class="table-responsive">
            <table class="table table-bordered table-retail align-middle">

                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Unit</th>
                        <th>Price</th>
                        <th>Qty</th>
                        <th>Category</th>
                        <th>Details</th>
                    </tr>
                </thead>

                <tbody>

                    <c:forEach var="p" items="${products}">

                        <c:set var="parts" value="${fn:split(p.name, ' ')}" />
                        <c:set var="unitValue" value="${parts[fn:length(parts)-2]}" />
                        <c:set var="unitType" value="${parts[fn:length(parts)-1]}" />

                        <c:set var="productName" value="" />
                        <c:forEach var="i" begin="0" end="${fn:length(parts)-3}">
                            <c:set var="productName" value="${productName} ${parts[i]}" />
                        </c:forEach>

                        <tr>
                            <td>${fn:trim(productName)}</td>
                            <td>${unitValue} ${unitType}</td>
                            <td>₹${p.price}</td>
                            <td>${p.quantity}</td>
                            <td>${p.category}</td>
                            <td>
                                <a href="/GroceryManagementMVC/product/${p.id}" class="btn-view">
                                    View
                                </a>
                            </td>
                        </tr>

                    </c:forEach>

                </tbody>

            </table>
        </div>


        <div class="text-center mt-4">
            <a href="/GroceryManagementMVC/" class="btn-back">Back to Home</a>
        </div>

    </div>

</div>




<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
