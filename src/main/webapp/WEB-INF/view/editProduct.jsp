<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>

<html>
<head>
    <title>Edit Product</title>

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
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 25px rgba(0,0,0,0.25);
        }

        .btn-retail {
            background-color: #0056b3;
            color: white;
            font-weight: 600;
            padding: 12px 25px;
            border-radius: 10px;
            border: none;
        }

        .btn-retail:hover {
            background-color: #003f80;
        }

        .btn-back {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
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


<!-- MAIN EDIT PRODUCT FORM -->
<div class="container mt-5">
    <div class="form-card">

        <h2 class="text-primary fw-bold text-center mb-4">Edit Product</h2>

        <!-- SPLIT NAME -->
        <c:set var="parts" value="${fn:split(product.name, ' ')}" />
        <c:set var="baseName" value="${parts[0]}" />
        <c:set var="unitValue" value="${parts[1]}" />
        <c:set var="unitType" value="${parts[2]}" />

        <form action="<c:url value='/admin/updateProduct' />" method="post">

            <input type="hidden" name="id" value="${product.id}">

            <div class="mb-3">
                <label class="form-label">Product Name</label>
                <input type="text" name="name" value="${baseName}" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Unit Value</label>
                <input type="text" name="unitValue" value="${unitValue}" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Unit Type</label>
                <select name="unitType" class="form-select">
                    <c:forEach items="${units}" var="u">
                        <option value="${u}" <c:if test="${u eq unitType}">selected</c:if>>
                            ${u}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Price (₹)</label>
                <input type="text" name="price" value="${product.price}" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Quantity</label>
                <input type="text" name="quantity" value="${product.quantity}" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Description</label>
                <input type="text" name="description" value="${product.description}" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Category</label>
                <select name="category" class="form-select">
                    <c:forEach var="c" items="${categories}">
                        <option value="${c}" <c:if test="${product.category eq c}">selected</c:if>>
                            ${c}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="text-center mt-4">
                <button type="submit" class="btn-retail px-5">Update Product</button>
            </div>

        </form>

        <div class="text-center mt-3">
            <a href="/GroceryManagementMVC/admin/products" class="btn-back">Back to Manage Products</a>
        </div>

    </div>
</div>


<!-- BOOTSTRAP JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
