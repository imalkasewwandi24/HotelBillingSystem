<%--
  Created by IntelliJ IDEA.
  User: imalka
  Date: 2/2/2026
  Time: 7:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create New User</title>
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body {
            background-color: #fff7e6;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .content-wrapper {
            margin-left: 280px;
            padding: 90px 40px 40px;
            display: flex;
            justify-content: center;
        }

        .card-box {
            width: 500px;
            background: #ffffff;
            border-radius: 18px;
            padding: 30px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.08);
            border: 1.5px solid #f1d6a3;
        }

        .card-box h4 {
            margin-bottom: 25px;
            color: #0c0c0c;
            font-weight: 600;
            text-align: left;
        }

        .form-control {
            border-radius: 12px;
        }

        .btn-orange {
            background-color: #e7993c;
            color: white;
            border-radius: 12px;
            padding: 8px 20px;
            font-weight: 500;
            width: 100%;
        }

        .btn-orange:hover {
            background-color: #cc7e22;
        }

        .password-strength {
            height: 5px;
            margin-top: 5px;
            margin-bottom: 15px;
        }

        .strength-0 { background: #dc3545; width: 20%; }
        .strength-1 { background: #fd7e14; width: 40%; }
        .strength-2 { background: #ffc107; width: 60%; }
        .strength-3 { background: #28a745; width: 80%; }
        .strength-4 { background: #28a745; width: 100%; }
    </style>
</head>
<body>

<%@ include file="layouts/sidebar.jsp" %>
<%@ include file="layouts/navbar.jsp" %>

<div class="content-wrapper">
    <div class="card-box">
        <h4>Add New User </h4>

        <%-- Success message --%>
        <% String success = request.getParameter("success"); %>
        <% if ("true".equals(success)) { %>
        <div class="alert alert-success text-center">
            Registration successful!
        </div>
        <% } %>

        <%-- Error messages --%>
        <% String error = request.getParameter("error"); %>
        <% if (error != null) { %>
        <div class="alert alert-danger text-center">
            <% switch(error) {
                case "empty": %>
            Please fill all required fields.
            <% break;
                case "invalid_type": %>
            Invalid user type selected.
            <% break;
                case "registration_failed": %>
            Registration failed. Username or email may already be taken.
            <% break;
                default: %>
            An error occurred during registration.
            <% } %>
        </div>
        <% } %>

        <form id="registerForm" method="post"
              action="${pageContext.request.contextPath}/admin/RegisterServlet">

            <div class="mb-3">
                <label class="form-label">Username <span class="text-danger">*</span></label>
                <input type="text" name="username" class="form-control" required
                       pattern="[a-zA-Z0-9]{4,20}"
                       title="4-20 alphanumeric characters">
                <div class="form-text">4-20 alphanumeric characters</div>
            </div>

            <div class="mb-3">
                <label class="form-label">Password <span class="text-danger">*</span></label>
                <input type="password" name="password" id="password"
                       class="form-control" required
                       minlength="6"
                       pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$"
                       title="At least 6 characters with 1 uppercase, 1 lowercase, and 1 number">

                <div class="password-strength" id="passwordStrength"></div>
                <div class="form-text">
                    At least 6 characters with 1 uppercase, 1 lowercase, and 1 number
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">Email <span class="text-danger">*</span></label>
                <input type="email" name="email" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">User Type <span class="text-danger">*</span></label>
                <select name="usertype" class="form-select" required>
                    <option value="">Select user type</option>
                    <option value="0">Admin</option>
                    <option value="1">Receptionist</option>
                </select>
            </div>

            <button type="submit" class="btn btn-orange mt-3">
                <i class="fas fa-user-plus"></i> Register
            </button>
        </form>

    </div>
</div>

<script src="../assets/js/bootstrap.bundle.min.js"></script>

<script>
    // Password strength indicator
    document.getElementById('password').addEventListener('input', function() {
        const password = this.value;
        const strengthBar = document.getElementById('passwordStrength');
        let strength = 0;

        // Length check
        if (password.length > 5) strength++;
        if (password.length > 8) strength++;

        // Character variety checks
        if (/[A-Z]/.test(password)) strength++;
        if (/\d/.test(password)) strength++;
        if (/[^A-Za-z0-9]/.test(password)) strength++;

        // Cap at 4
        strength = Math.min(strength, 4);

        // Update UI
        strengthBar.className = 'password-strength strength-' + strength;
    });

    // Form validation
    document.getElementById('registerForm').addEventListener('submit', function(e) {
        const password = document.getElementById('password').value;
        if (password.length < 6) {
            alert('Password must be at least 6 characters long');
            e.preventDefault();
        }
    });
</script>

<%@ include file="layouts/footer.jsp" %>

</body>
</html>