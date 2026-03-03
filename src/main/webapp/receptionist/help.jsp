<%--
  Created by IntelliJ IDEA.
  User: imalka
  Date: 2/20/2026
  Time: 7:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Receptionist Help - OceanView Resort</title>
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
            background: linear-gradient(135deg, #145130 0%, #16833e 100%);
            color: #ffffff;
            border-radius: 18px;
            padding: 25px 30px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            margin-bottom: 30px;
        }

        .help-header h1 {
            margin: 0;
            font-size: 26px;
            font-weight: 600;
            text-shadow: 0 1px 2px rgba(0,0,0,0.15);
        }

        .help-section h4 {
            color: #145130;
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
            background-color: #145130;
            color: white;
            border-radius: 12px;
            padding: 8px 20px;
            font-weight: 500;
        }

        .btn-orange:hover {
            background-color:#145130;
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
        <h1><i class="fas fa-headset"></i> Receptionist Help Center</h1>
        <p>Step-by-step guide to manage reservations and billing efficiently</p>
    </div>

    <!-- Reservation Management -->
    <div class="card-box help-section">
        <h4><i class="fas fa-calendar-plus"></i> Add Reservations</h4>
        <ul>
            <li>Click <strong>"Add Reservation"</strong> from the sidebar.</li>
            <li>Enter guest details, room details, check-in and check-out dates and required fields</li>
            <li>Click <strong>Add Reservation</strong> to confirm the reservation.</li>
            <li>A success message will appear if reservation is saved successfully.</li>
        </ul>
    </div>

    <div class="card-box help-section">
        <h4><i class="fas fa-tasks"></i> Manage Reservations</h4>
        <ul>
            <li>Click <strong>"Manage Reservations"</strong> from the sidebar.</li>
            <li>All reservations will be displayed in a table.</li>
            <li>Use the <strong>Search bar</strong> to quickly find reservations.</li>
            <li>Click the <strong>Edit icon</strong> to update reservation details.</li>
            <li>Click the <strong>Delete icon</strong> to remove a reservation.</li>
            <li>Click <strong>Check-In</strong> button to update guest status when guest arrives.</li>
            <li>Click <strong>Check-Out</strong> button when guest leaves.</li>
        </ul>
    </div>

    <!-- View Rooms -->
    <div class="card-box help-section">
        <h4><i class="fas fa-bed"></i> View All Rooms</h4>
        <ul>
            <li>Click <strong>"View Rooms"</strong> from the sidebar.</li>
            <li>All available and occupied rooms will be displayed.</li>
            <li>Use search functionality to filter rooms if needed.</li>
        </ul>
    </div>

    <!-- Billing Section -->
    <div class="card-box help-section">
        <h4><i class="fas fa-file-invoice-dollar"></i> Generate Bill</h4>
        <ul>
            <li>Click <strong>"Generate Bill"</strong> from the sidebar.</li>
            <li>Select the correct reservation.</li>
            <li>Enter all required billing details carefully.</li>
            <li>Click <strong>Preview</strong> to review the bill before saving.</li>
            <li>You may also click <strong>Print</strong> to print the bill before saving.</li>
            <li>After verifying details, click <strong>Save Bill</strong>.</li>
            <li>A success message will appear once the bill is saved successfully.</li>
        </ul>
    </div>

    <!-- View Bills -->
    <div class="card-box help-section">
        <h4><i class="fas fa-receipt"></i> View Bills</h4>
        <ul>
            <li>Click <strong>"View Bills"</strong> from the sidebar.</li>
            <li>All saved bills will be displayed.</li>
            <li>Click <strong>"View"</strong> to review the bill and print.</li>
        </ul>
    </div>

    <!-- Logout -->
    <div class="card-box help-section">
        <h4><i class="fas fa-sign-out-alt"></i> Logout Guide</h4>
        <ul>
            <li>Click the <strong>Logout</strong> button from the top navigation bar.</li>
            <li>The system will securely log you out.</li>
            <li>Always logout after completing your work to ensure system security.</li>
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
