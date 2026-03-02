<%--
  Created by IntelliJ IDEA.
  User: imalka
  Date: 2/4/2026
  Time: 8:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.hotelbillingsystem.models.User" %>

<%
  List<User> users = (List<User>) request.getAttribute("users");
  String successMessage = (String) session.getAttribute("successMessage");
%>

<!DOCTYPE html>
<html>
<head>
  <title>Users</title>
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
      width: 85%;
      background: #ffffff;
      border-radius: 18px;
      padding: 30px;
      box-shadow: 0 12px 30px rgba(0,0,0,0.08);
      border: 1.5px solid #f1d6a3;   /* ✅ added border */
    }

    table {
      border-collapse: separate;
      border-spacing: 0 12px;
    }

    thead th {
      color: #666;
      font-weight: 600;
      border-bottom: 2px solid #f0f0f0;
      text-align: center;
    }

    tbody tr {
      background: #ffffff;
      border-radius: 14px;
      box-shadow: 0 5px 14px rgba(0,0,0,0.07);
    }

    tbody td {
      padding: 15px;
      text-align: center;
      vertical-align: middle;
      border-top: none;
    }

    tbody tr td:first-child {
      border-radius: 14px 0 0 14px;
    }

    tbody tr td:last-child {
      border-radius: 0 14px 14px 0;
    }

    /* Role badges unchanged */
    .role-badge {
      padding: 6px 16px;
      border-radius: 20px;
      font-size: 13px;
      font-weight: 600;
      color: white;
    }

    .role-admin {
      background: #e7993c;
    }

    .role-receptionist {
      background: #6c757d;
    }

    /* Buttons – NO gradients */
    .btn-action {
      border-radius: 12px;
      padding: 6px 16px;
      font-size: 14px;
      font-weight: 500;
      border: 1.5px solid rgba(0,0,0,0.15); /* ✅ light border */
      display: inline-flex;
      align-items: center;
      gap: 6px;
    }

    /* Edit button */
    .btn-edit {
      background-color: #ff9800;
      color: white;
      border-color: #f1a53a;
    }

    .btn-edit:hover {
      background-color: #fb8c00;
    }

    /* Delete button */
    .btn-delete {
      background-color: #ff5252;
      color: white;
      border-color: #ff8a80;
    }

    .btn-delete:hover {
      background-color: #e53935;
    }
  </style>
</head>

<body>

<%@ include file="layouts/sidebar.jsp" %>
<%@ include file="layouts/navbar.jsp" %>

<div class="content-wrapper">
  <div class="card-box">

    <% if (successMessage != null) { %>
    <div class="alert alert-success text-center mb-4">
      <%= successMessage %>
      <% session.removeAttribute("successMessage"); %>
    </div>
    <% } %>

    <div class="table-responsive">
      <table class="table align-middle">
        <thead>
        <tr>
          <th>ID</th>
          <th>Username</th>
          <th>Email</th>
          <th>User Type</th>
          <th>Actions</th>
        </tr>
        </thead>

        <tbody>
        <% if (users != null && !users.isEmpty()) {
          for (User user : users) { %>
        <tr>
          <td><%= user.getId() %></td>
          <td><strong><%= user.getUsername() %></strong></td>
          <td><%= user.getEmail() %></td>
          <td>
                            <span class="role-badge <%= user.getUsertype() == 0 ? "role-admin" : "role-receptionist" %>">
                                <%= user.getUsertype() == 0 ? "Admin" : "Receptionist" %>
                            </span>
          </td>
          <td>
            <a href="<%= request.getContextPath() %>/admin/EditUserServlet?id=<%= user.getId() %>"
               class="btn btn-action btn-edit">
              <i class="fas fa-pen"></i>Edit
            </a>

            <a href="UserManagementServlet?action=delete&id=<%= user.getId() %>"
               class="btn btn-action btn-delete"
               onclick="return confirm('Delete <%= user.getUsername() %>?')">
              <i class="fas fa-trash"></i>Delete
            </a>
          </td>
        </tr>
        <% } } else { %>
        <tr>
          <td colspan="5" class="text-muted">No users found</td>
        </tr>
        <% } %>
        </tbody>
      </table>
    </div>

  </div>
</div>

<script src="../assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
