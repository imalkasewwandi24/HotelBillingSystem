<%--
  Created by IntelliJ IDEA.
  User: imalka
  Date: 2/20/2026
  Time: 7:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Help - OceanView Resort</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body {
            background-color: #fff7e6;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .content-wrapper {
            margin-left: 280px;
            padding: 90px 40px 40px;
        }

        .card-box {
            background: #ffffff;
            border-radius: 18px;
            padding: 30px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.08);
            border: 1.5px solid #f1d6a3;
            margin-bottom: 25px;
        }

        .help-header {
            background: linear-gradient(135deg, #fceabb, #f8b500);
            color: #131212;
            border-radius: 18px;
            padding: 25px 30px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            margin-bottom: 30px;
        }

        .help-header h1 {
            margin: 0;
            font-size: 26px;
            font-weight: 600;
        }

        .help-header p {
            margin: 5px 0 0;
            font-size: 15px;
        }

        .help-section h4 {
            color: #676004;
            font-weight: 600;
            margin-bottom: 15px;
        }

        .help-section ul {
            padding-left: 20px;
        }

        .help-section ul li {
            margin-bottom: 8px;
        }

        .note {
            font-size: 0.9rem;
            color: #6c757d;
            margin-top: 10px;
        }

        .btn-orange {
            background-color: #676004;
            color: white;
            border-radius: 12px;
            padding: 8px 20px;
            font-weight: 500;
        }

        .btn-orange:hover {
            background-color: #676004;
        }

        @media (max-width: 991.98px) {
            .content-wrapper {
                margin-left: 0;
                padding: 140px 20px 20px;
            }
        }
    </style>
</head>
<body>

<jsp:include page="layouts/sidebar.jsp" />
<jsp:include page="layouts/navbar.jsp" />

<div class="content-wrapper">

    <!-- Header -->
    <div class="help-header">
        <h1><i class="fas fa-life-ring"></i> Admin Help Center</h1>
        <p>Step-by-step guide to manage the hotel management system efficiently</p>
    </div>

    <!-- User Management -->
    <div class="card-box help-section">
        <h4><i class="fas fa-users"></i> User Management Guide</h4>

        <p><strong>How to Add a New User:</strong></p>
        <ul>
            <li>Click <strong>"Add Users"</strong> from the sidebar.</li>
            <li>Fill in Username, Password, Email, and select User Type.</li>
            <li>Click the <strong>Register</strong> button.</li>
            <li>A success message will appear if registration is completed.</li>
        </ul>

        <p><strong>How to Manage Users:</strong></p>
        <ul>
            <li>Click <strong>"Manage Users"</strong> from the sidebar.</li>
            <li>All registered users will be displayed in a table.</li>
            <li>Click the <strong>Edit icon</strong> to update user details.</li>
            <li>Click the <strong>Delete icon</strong> to remove a user.</li>
            <li>Use the table to view all user roles and details.</li>
        </ul>

        <p class="note">Important: Always keep at least one Admin account active.</p>
    </div>

    <!-- Room Management -->
    <div class="card-box help-section">
        <h4><i class="fas fa-bed"></i> Room Management Guide</h4>

        <p><strong>How to Add a Room:</strong></p>
        <ul>
            <li>Click <strong>"Add Room"</strong> from the sidebar.</li>
            <li>Enter Room Number, Room Type, Price, and Availability and required fields</li>
            <li>Click <strong>Add Room</strong> to add the room.</li>
            <li>A success message will appear if insertion is completed.</li>
        </ul>

        <p><strong>How to Manage Rooms:</strong></p>
        <ul>
            <li>Click <strong>"Manage Rooms"</strong> from the sidebar.</li>
            <li>All rooms will be displayed in a table.</li>
            <li>Click the <strong>Edit icon</strong> to update room details.</li>
            <li>Click the <strong>Delete icon</strong> to remove a room.</li>
        </ul>
    </div>

    <!-- Reservation Management -->
    <div class="card-box help-section">
        <h4><i class="fas fa-calendar-check"></i> Reservation Management Guide</h4>

        <ul>
            <li>Click <strong>"All Reservations"</strong> from the sidebar.</li>
            <li>All reservations will be displayed in a table.</li>
            <li>Search  a reservation to view guest details, room details, and booking dates.</li>
        </ul>
    </div>

    <!-- Billing Management -->
    <div class="card-box help-section">
        <h4><i class="fas fa-file-invoice-dollar"></i> Billing Management Guide</h4>

        <ul>
            <li>Click <strong>"View Bills"</strong> from the sidebar.</li>
            <li>All billing details will be displayed in a table.</li>
            <li>Search a reservation related billing details. </li>
            <li>Click <strong>"View"</strong> to review the bill and print.</li>
        </ul>
    </div>

    <!-- Logout -->
    <div class="card-box help-section">
        <h4><i class="fas fa-sign-out-alt"></i> Logout Guide</h4>

        <ul>
            <li>Hover the admin icon top navigation bar.Then can see logout button. </li>
            <li>Click the <strong>Logout</strong> button from the top navigation bar.</li>
            <li>The system will securely log you out and redirect to the login page.</li>
            <li>Always logout after completing your work to ensure security.</li>
        </ul>
    </div>

    <div class="card-box text-center">
        <p class="mb-1"><strong>Need Further Assistance?</strong></p>
        <p class="text-muted">
            This guide is designed to help you manage the system efficiently.
            If you experience any issues, please contact the system administrator.
        </p>
    </div>


</div>

<script src="../assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
