<%--
  Created by IntelliJ IDEA.
  User: imalka
  Date: 2/4/2026
  Time: 9:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hotelbillingsystem.models.User" %>

<%
    User editUser = (User) request.getAttribute("editUser");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #fff7e6;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .form-box {
            max-width: 500px;
            margin: 60px auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        .header-text {
            text-align: center;
            color: #e7993c;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .btn-orange {
            background-color: #e7993c;
            color: white;
        }
        .btn-orange:hover {
            background-color: #cc7e22;
        }
    </style>
</head>

<body>

<%@ include file="layouts/sidebar.jsp" %>
<%@ include file="layouts/navbar.jsp" %>

<br><br><br><br>

<div class="container">
    <div class="form-box">
        <div class="header-text">Edit User Account</div>

        <form method="post" action="<%= request.getContextPath() %>/admin/UpdateUserServlet">

            <input type="hidden" name="id" value="<%= editUser.getId() %>">

            <div class="mb-3">
                <label class="form-label">Username</label>
                <input type="text"
                       name="username"
                       class="form-control"
                       value="<%= editUser.getUsername() %>"
                       required>
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email"
                       name="email"
                       class="form-control"
                       value="<%= editUser.getEmail() %>"
                       required>
            </div>

            <div class="mb-3">
                <label class="form-label">
                    Password
                    <small class="text-muted">(leave blank to keep current)</small>
                </label>
                <input type="password"
                       name="password"
                       class="form-control"
                       placeholder="Enter new password (optional)">
            </div>

            <div class="mb-3">
                <label class="form-label">User Type</label>
                <select name="usertype" class="form-select" required>
                    <option value="0" <%= editUser.getUsertype() == 0 ? "selected" : "" %>>Admin</option>
                    <option value="1" <%= editUser.getUsertype() == 1 ? "selected" : "" %>>Receptionist</option>
                </select>
            </div>

            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-orange w-100">
                    Update User
                </button>
                <a href="<%= request.getContextPath() %>/admin/UserManagementServlet"
                   class="btn btn-secondary w-100">
                    Cancel
                </a>
            </div>

        </form>
    </div>
</div>

<script src="../assets/js/bootstrap.bundle.min.js"></script>

<%@ include file="layouts/footer.jsp" %>

</body>
</html>
