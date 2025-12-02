<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>

<html>
<head>
    <title>Order Success</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

        body {
            background:
            linear-gradient(rgba(255,255,255,0.75), rgba(255,255,255,0.75)),
            url('https://images.unsplash.com/photo-1585325701482-c2f4d4a68688?auto=format&fit=crop&w=1400&q=60');
            background-size: cover;
            background-position: center;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            padding-top: 80px;
        }

        .success-card {
            background: #ffffff;
            padding: 45px;
            border-radius: 20px;
            box-shadow: 0 6px 28px rgba(0,0,0,0.25);
            max-width: 550px;
            width: 100%;
            text-align: center;
        }

        .success-heading {
            color: #0d880d;
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 25px;
        }

        .order-detail {
            font-size: 18px;
            margin: 10px 0;
        }

        .btn-shop {
            background-color: #0056b3;
            color: white;
            padding: 12px 28px;
            border-radius: 12px;
            text-decoration: none;
            font-weight: 600;
            display: inline-block;
            margin-top: 20px;
        }

        .btn-shop:hover {
            background-color: #003f80;
            color: #fff;
        }

    </style>

</head>

<body>


<div class="success-card">

    <h2 class="success-heading">🎉 Order Placed Successfully!</h2>

    <p class="order-detail"><b>Order ID:</b> ${orderId}</p>
    <p class="order-detail"><b>Transaction ID:</b> ${txnId}</p>
    <p class="order-detail"><b>Payment Mode:</b> ${paymentMode}</p>
    <p class="order-detail"><b>Total Amount:</b> ₹${amount}</p>
    <p class="order-detail"><b>Expected Delivery:</b> ${deliveryDate}</p>

    <h4 class="mt-4">Thank you for shopping with us! 🙏</h4>
    <p>Your order is being processed. You will be notified soon.</p>

    <a href="/GroceryManagementMVC/products" class="btn-shop">Continue Shopping</a>

</div>


<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
