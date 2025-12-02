<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>

<html>
<head>
    <title>User Registration</title>

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
            align-items: center;
            padding-top: 40px;
        }

        .register-card {
            background: white;
            padding: 40px 45px;
            border-radius: 18px;
            box-shadow: 0 6px 28px rgba(0,0,0,0.25);
            width: 100%;
            max-width: 420px;
        }

        .btn-register {
            background-color: #0056b3;
            color: white;
            font-weight: 600;
            padding: 10px 30px;
            border-radius: 12px;
            border: none;
        }

        .btn-register:hover {
            background-color: #003f80;
        }

        .login-link {
            color: #0056b3;
            font-weight: 600;
            text-decoration: none;
        }

        .login-link:hover {
            color: #003f80;
            text-decoration: underline;
        }

    </style>

</head>

<body>

<div class="register-card">

    <h2 class="text-center text-primary fw-bold mb-4">Create Account</h2>

    <form action="register" method="post">

        <div class="mb-3">
            <label class="form-label fw-semibold">Username</label>
            <input type="text" name="username" class="form-control" required>
        </div>

        <div class="mb-4">
            <label class="form-label fw-semibold">Password</label>
            <input type="password" name="password" class="form-control" required>
        </div>

        <div class="text-center">
            <button type="submit" class="btn-register px-5">Register</button>
        </div>

    </form>

    <div class="text-center mt-3">
        <a href="login" class="login-link">Already have an account? Login</a>
    </div>

</div>


<!-- BOOTSTRAP JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
