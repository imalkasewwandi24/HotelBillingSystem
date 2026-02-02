<%--
  Created by IntelliJ IDEA.
  User: imalka
  Date: 2/2/2026
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #fceabb, #f8b500);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-card {
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
            display: flex;
            overflow: hidden;
            max-width: 900px;
            width: 100%;
        }

        .left-panel {
            flex: 1;
            padding: 60px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .header-title {
            font-size: 24px;
            font-weight: 700;
            color: #101940;
            text-align: center;
            margin-bottom: 25px;
        }

        h2 {
            font-weight: 600;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-control {
            border-radius: 12px;
            border: 1px solid #e0d7c4;
            padding: 12px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #f08c00;
            box-shadow: 0 0 8px rgba(240,140,0,0.3);
        }

        .btn-login {
            background: #101940;
            color: white;
            border: none;
            padding: 12px;
            font-weight: 600;
            border-radius: 12px;
            width: 100%;
            transition: all 0.3s ease;
        }

        .btn-login:hover {
            background: rgba(0, 232, 205, 0.66);
        }

        .feedback, .error-feedback, .alert-success {
            text-align: center;
            font-weight: 600;
            margin-bottom: 15px;
            border-radius: 8px;
            padding: 10px;
        }

        .feedback {
            color: #155724;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
        }

        .error-feedback {
            color: #721c24;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
        }

        .alert-success {
            color: #856404;
            background-color: #fff3cd;
            border: 1px solid #ffeeba;
        }

        .right-panel {
            flex: 1;
            background: url('assets/images/resort_image.png') center/cover no-repeat;
            border-left: 1px solid rgba(0,0,0,0.05);
        }

        @media (max-width: 768px) {
            .login-card {
                flex-direction: column;
            }
            .right-panel {
                height: 200px;
            }
        }

    </style>
</head>
<body>
<div class="login-card">
    <div class="left-panel">
        <div class="header-title"><span id="typewriter"></span></div>

        <% String registered = request.getParameter("registered"); %>
        <% if ("true".equals(registered)) { %>
        <div class="feedback">Registration successful! Please log in.</div>
        <% } %>

        <% String error = request.getParameter("error"); %>
        <% if ("invalid".equals(error)) { %>
        <div class="error-feedback">Invalid username or password!</div>
        <% } %>

        <div class="alert-success">
            <%= request.getAttribute("message") != null ? request.getAttribute("message") : "Use your account details to Sign in!!" %>
        </div>

        <h2>Sign In</h2>

        <form method="post" action="login" class="mt-4">
            <div class="mb-3">
                <label>Username</label>
                <input type="text" name="username" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Password</label>
                <input type="password" name="password" class="form-control" required>
            </div>

            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="remember">
                <label class="form-check-label" for="remember">Remember me</label>
            </div>

            <button type="submit" class="btn btn-login mt-2">Sign In</button>
        </form>


    </div>

    <div class="right-panel"></div>
</div>

<script src="assets/js/bootstrap.bundle.min.js"></script>
<script>
    const text = "Welcome to Ocean View Resort";
    const speed = 70;
    let i = 0;

    function typeWriter() {
        if (i < text.length) {
            document.getElementById("typewriter").innerHTML += text.charAt(i);
            i++;
            setTimeout(typeWriter, speed);
        }
    }

    window.onload = typeWriter;
</script>
</body>
</html>
