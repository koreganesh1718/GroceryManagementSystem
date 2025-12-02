<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>

<html>
<head>
    <title>Payment</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(rgba(255,255,255,0.75), rgba(255,255,255,0.75)),
                        url('https://images.unsplash.com/photo-1585325701482-c2f4d4a68688?auto=format&fit=crop&w=1400&q=60');
            background-size: cover;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .payment-card {
            background: #fff;
            padding: 35px;
            border-radius: 15px;
            max-width: 450px;
            width: 100%;
            box-shadow: 0 6px 25px rgba(0,0,0,0.25);
        }

        .btn-pay {
            background-color: #0056b3;
            color: #fff;
            font-weight: bold;
            border-radius: 12px;
            padding: 12px;
        }

        .btn-pay:hover {
            background-color: #003f80;
        }
    </style>
</head>

<body>

<div class="payment-card">
    <h2 class="text-center text-primary fw-bold mb-4">Payment</h2>

    <c:if test="${not empty error}">
        <p class="text-danger text-center fw-bold">${error}</p>
    </c:if>

    <form action="/GroceryManagementMVC/checkout/pay" method="post" onsubmit="return validateForm()">

        <label class="fw-bold">Card Holder Name</label>
        <input type="text" name="cardHolder" class="form-control mb-3" required
               oninput="this.value=this.value.replace(/[^A-Za-z ]/g,'');">

        <label class="fw-bold">Card Number</label>
        <input type="text" name="cardNumber" class="form-control mb-3"
               maxlength="16" minlength="16" required
               oninput="this.value=this.value.replace(/[^0-9]/g,'');">

        <div class="row">
            <div class="col-md-6">
                <label class="fw-bold">Expiry (MM/YY)</label>
                <input type="text" name="expiry" class="form-control mb-3"
                       maxlength="5"  onkeyup="formatExpiry(this)" required>
            </div>

            <div class="col-md-6">
                <label class="fw-bold">CVV</label>
                <input type="password" name="cvv" class="form-control mb-3"
                       maxlength="3" required
                       oninput="this.value=this.value.replace(/[^0-9]/g,'');">
            </div>
        </div>

        <label class="fw-bold">Payment Mode</label>
        <select name="paymentMode" class="form-select mb-3">
            <option value="CARD">Credit / Debit Card</option>
        </select>

        <button type="submit" class="btn btn-pay w-100">Pay Now</button>
    </form>
</div>


<script>
    function formatExpiry(input) {
        let v = input.value.replace(/[^0-9]/g, "");
        if (v.length >= 3) {
            input.value = v.substring(0,2) + "/" + v.substring(2,4);
        } else {
            input.value = v;
        }
    }

    function validateForm() {
        let exp = document.querySelector("input[name='expiry']").value;
        if (!/^\d{2}\/\d{2}$/.test(exp)) {
            alert("Invalid expiry (MM/YY)");
            return false;
        }

        let month = parseInt(exp.split("/")[0]);
        let year = 2000 + parseInt(exp.split("/")[1]);

        if (month < 1 || month > 12) {
            alert("Invalid month!");
            return false;
        }

        let today = new Date();
        let expiryDate = new Date(year, month - 1);

        if (expiryDate <= today) {
            alert("Expiry must be future date");
            return false;
        }

        return true;
    }
</script>

</body>
</html>
