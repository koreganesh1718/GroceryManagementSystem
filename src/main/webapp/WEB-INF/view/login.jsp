<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Login</title>

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
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-card {
            background: #ffffff;
            padding: 40px 45px;
            border-radius: 15px;
            box-shadow: 0 4px 25px rgba(0,0,0,0.25);
            width: 100%;
            max-width: 420px;
        }

        .btn-login {
            background-color: #0056b3;
            color: white;
            font-weight: 600;
            padding: 10px 30px;
            border-radius: 10px;
            border: none;
        }

        .btn-login:hover {
            background-color: #003f80;
        }

        .register-link {
            color: #0056b3;
            font-weight: 600;
            text-decoration: none;
        }

        .register-link:hover {
            text-decoration: underline;
            color: #003f80;
        }
    </style>

</head>

<body>


<!-- LOGIN FORM CARD -->
<div class="login-card">

    <h2 class="text-center text-primary fw-bold mb-4">Login</h2>

    <!-- SUCCESS / ERROR MESSAGES -->
    <c:if test="${not empty msg}">
        <div class="alert alert-success">${msg}</div>
    </c:if>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <c:if test="${param.logout == 'true'}">
        <div class="alert alert-success">You have been logged out successfully.</div>
    </c:if>

    <c:if test="${param.error == 'AccessDenied'}">
        <div class="alert alert-danger">Access denied! Only admin can access that page.</div>
    </c:if>



    <!-- LOGIN FORM -->
    <form action="login" method="post">

        <div class="mb-3">
            <label class="form-label fw-semibold">Username</label>
            <input type="text" name="username" class="form-control" required>
        </div>

        <div class="mb-4">
            <label class="form-label fw-semibold">Password</label>
            <input type="password" name="password" class="form-control" required>
        </div>

        <div class="text-center">
            <button type="submit" class="btn-login px-5">Login</button>
        </div>

    </form>


    <!-- REGISTER LINK -->
    <div class="text-center mt-3">
        <a href="register" class="register-link">Create new account</a>
    </div>

</div>


<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
