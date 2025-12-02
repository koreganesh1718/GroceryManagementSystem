<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>

<html>
<head>
    <title>Product Details</title>

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

        .details-card {
            background: #ffffff;
            padding: 40px;
            border-radius: 18px;
            box-shadow: 0 6px 28px rgba(0,0,0,0.25);
        }

        .btn-cart {
            background-color: #0056b3;
            color: #fff !important;
            padding: 12px 28px;
            font-weight: 600;
            border-radius: 12px;
            border: none;
        }

        .btn-cart:hover {
            background-color: #003f80;
        }

        .btn-back {
            background-color: #007bff;
            color: #fff !important;
            padding: 10px 25px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 600;
        }

        .btn-back:hover {
            background-color: #0056b3;
        }

        .product-title {
            font-size: 32px;
            font-weight: 700;
        }

        .detail-row {
            font-size: 18px;
            margin: 10px 0;
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



<!-- PRODUCT DETAILS -->
<div class="container mt-5">

    <div class="details-card">

        <!-- Name Split Logic -->
        <c:set var="parts" value="${fn:split(product.name, ' ')}" />
        <c:set var="unitValue" value="${parts[fn:length(parts)-2]}" />
        <c:set var="unitType" value="${parts[fn:length(parts)-1]}" />

        <c:set var="productName" value="" />
        <c:forEach var="i" begin="0" end="${fn:length(parts)-3}">
            <c:set var="productName" value="${productName} ${parts[i]}" />
        </c:forEach>


        <h2 class="product-title text-primary mb-4">${fn:trim(productName)}</h2>

        <div class="detail-row"><b>Unit:</b> ${unitValue} ${unitType}</div>
        <div class="detail-row"><b>Category:</b> ${product.category}</div>
        <div class="detail-row"><b>Price:</b> ₹${product.price}</div>
        <div class="detail-row"><b>Available Quantity:</b> ${product.quantity}</div>
        <div class="detail-row"><b>Description:</b> ${product.description}</div>


        <!-- Add to Cart -->
        <form action="/GroceryManagementMVC/addToCart/${product.id}" method="post" class="mt-4">

            <label class="fw-semibold">Quantity:</label>
            <input type="number" name="quantity" value="1" min="1"
                   class="form-control d-inline-block"
                   style="width:100px; display:inline-block; margin-left:10px; margin-right:20px;">

            <button type="submit" class="btn-cart">Add to Cart</button>
        </form>


        <div class="mt-4">
            <a href="/GroceryManagementMVC/products" class="btn-back">Back to Products</a>
        </div>

    </div>

</div>



<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
