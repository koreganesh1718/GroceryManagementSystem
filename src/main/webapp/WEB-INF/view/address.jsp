<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>

<html>
<head>
    <title>Select Address</title>

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
            background: #ffffff;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 4px 25px rgba(0,0,0,0.25);
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

        .saved-box {
            background: #e9f2ff;
            padding: 20px;
            border-left: 5px solid #0056b3;
            border-radius: 10px;
            margin-bottom: 25px;
        }

    </style>
</head>

<body>

<!-- NAVBAR (Same Theme) -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary py-3">
    <div class="container-fluid">

        <a class="navbar-brand fw-bold text-white" href="/GroceryManagementMVC/">
            Prusti Home Mart
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbar">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link text-white" href="/GroceryManagementMVC/cart">Cart</a>
                </li>

                <c:if test="${not empty sessionScope.username}">
                    <li class="nav-item">
                        <span class="nav-link text-light">Welcome, ${sessionScope.username}</span>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link text-warning" href="/GroceryManagementMVC/logout">Logout</a>
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
    <div class="row justify-content-center">
        <div class="col-lg-6 col-md-8">

            <div class="card-retail">

                <h3 class="text-primary text-center fw-bold mb-4">Select / Add Address</h3>


                <!-- SAVED ADDRESS -->
                <c:if test="${not empty savedAddress}">
                    <div class="saved-box">

                        <h5 class="fw-bold mb-2">Saved Address</h5>

                        <p class="mb-1"><b>${savedAddress.fullName}</b></p>
                        <p class="mb-1">${savedAddress.houseNo}, ${savedAddress.street}</p>
                        <p class="mb-1">${savedAddress.city}, ${savedAddress.state} - ${savedAddress.pincode}</p>
                        <p class="mb-3">Mobile: ${savedAddress.mobile}</p>

                        <a href="../payment" class="btn btn-retail">Use This Address</a>
                    </div>
                </c:if>


                <!-- NEW ADDRESS FORM -->
                <h5 class="fw-bold mt-4 mb-3">Add / Update Address</h5>

                <form action="address/save" method="post">

                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" name="fullName" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Mobile</label>
                        <input type="text" name="mobile" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">House No</label>
                        <input type="text" name="houseNo" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Street</label>
                        <input type="text" name="street" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">City</label>
                        <input type="text" name="city" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">State</label>
                        <input type="text" name="state" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Pincode</label>
                        <input type="text" name="pincode" class="form-control" required>
                    </div>

                    <div class="text-center mt-4">
                        <button type="submit" class="btn-retail">Save & Continue</button>
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
