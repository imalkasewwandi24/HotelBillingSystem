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
    <title>Edit User Account</title>
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
            color: #171616;
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
        .btn-secondary {
            border-radius: 12px;
            width: 100%;
        }
        .d-flex.gap-2 {
            display: flex;
            gap: 10px;
        }
    </style>
</head>

<body>

<%@ include file="layouts/sidebar.jsp" %>
<%@ include file="layouts/navbar.jsp" %>

<div class="content-wrapper">
    <div class="card-box">
        <h4>Edit User Account</h4>

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
                <button type="submit" class="btn btn-orange">
                    <i class="fas fa-user-edit"></i> Update User
                </button>
                <a href="<%= request.getContextPath() %>/admin/UserManagementServlet"
                   class="btn btn-orange">
                    <i class="fas fa-times"></i> Cancel
                </a>
            </div>

        </form>
    </div>
</div>

<script src="../assets/js/bootstrap.bundle.min.js"></script>

<%@ include file="layouts/footer.jsp" %>

</body>
</html>