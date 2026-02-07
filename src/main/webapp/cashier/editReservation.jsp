<%--
  Created by IntelliJ IDEA.
  User: imalka
  Date: 2/6/2026
  Time: 6:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: imalka
  Date: 2/4/2026
  Time: 4:35 PM
--%>

<%@ page import="com.hotelbillingsystem.models.Reservation" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Reservation reservation = (Reservation) request.getAttribute("reservation");

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String checkInDate = sdf.format(reservation.getCheckInDate());
    String checkOutDate = sdf.format(reservation.getCheckOutDate());
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Reservation</title>
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body
        {   background-color: #fff7e6;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .content-wrapper
        {   margin-left: 280px;
            padding: 90px 40px 40px;
            display: flex;
            justify-content: center;
        }
        .card-box
        {   width: 60%;
            background: #ffffff;
            border-radius: 18px; padding: 30px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.08);
            border: 1.5px solid #f1d6a3;
        }
        .form-control
        {
            border-radius: 12px;
        }
        .btn-submit
        {   background-color: #2196f3;
            color: white;
            border-radius: 12px;
            padding: 8px 20px;
            font-weight: 500;
        }
        .btn-submit:hover
        {
            background-color: #1976d2;
        }
    </style>
</head>
<body>

<%@ include file="layouts/sidebar.jsp" %>
<%@ include file="layouts/navbar.jsp" %>

<div class="content-wrapper">
    <div class="card-box">
        <h4 class="mb-4">Edit Reservation</h4>

        <form action="UpdateReservationServlet" method="post">

            <input type="hidden" name="r_id" value="<%= reservation.getR_id() %>">

            <div class="mb-3">
                <label>Reservation ID</label>
                <input type="text" name="reservationId" class="form-control"
                       value="<%= reservation.getReservationId() %>" required>
            </div>

            <div class="mb-3">
                <label>Guest Name</label>
                <input type="text" name="guestName" class="form-control"
                       value="<%= reservation.getGuestName() %>" required>
            </div>

            <div class="mb-3">
                <label>NIC</label>
                <input type="text" name="nic" class="form-control"
                       value="<%= reservation.getNic() %>" required>
            </div>

            <div class="mb-3">
                <label>Address</label>
                <input type="text" name="address" class="form-control"
                       value="<%= reservation.getAddress() %>" required>
            </div>

            <div class="mb-3">
                <label>Contact Number</label>
                <input type="text" name="contactNumber" class="form-control"
                       value="<%= reservation.getContactNumber() %>" required>
            </div>

            <div class="mb-3">
                <label>Email</label>
                <input type="email" name="email" class="form-control"
                       value="<%= reservation.getEmail() %>">
            </div>

            <div class="mb-3">
                <label>Room Type</label>
                <select name="roomType" class="form-control" required>
                    <option value="">-- Select Room Type --</option>
                    <option value="R001_SINGLE" <%= "R001_SINGLE".equals(reservation.getRoomType()) ? "selected" : "" %>>R001 - Single Room</option>
                    <option value="R002_DOUBLE" <%= "R002_DOUBLE".equals(reservation.getRoomType()) ? "selected" : "" %>>R002 - Double Room</option>
                    <option value="R003_TWIN" <%= "R003_TWIN".equals(reservation.getRoomType()) ? "selected" : "" %>>R003 - Twin Room</option>
                    <option value="R004_DELUXE" <%= "R004_DELUXE".equals(reservation.getRoomType()) ? "selected" : "" %>>R004 - Deluxe Room</option>
                    <option value="R005_FAMILY" <%= "R005_FAMILY".equals(reservation.getRoomType()) ? "selected" : "" %>>R005 - Family Room</option>
                    <option value="R006_SUITE" <%= "R006_SUITE".equals(reservation.getRoomType()) ? "selected" : "" %>>R006 - Suite</option>
                    <option value="R007_EXECUTIVE" <%= "R007_EXECUTIVE".equals(reservation.getRoomType()) ? "selected" : "" %>>R007 - Executive Suite</option>
                    <option value="R008_PRESIDENTIAL" <%= "R008_PRESIDENTIAL".equals(reservation.getRoomType()) ? "selected" : "" %>>R008 - Presidential Suite</option>
                </select>
            </div>

            <div class="mb-3">
                <label>Check-in Date</label>
                <input type="date" name="checkInDate" class="form-control"
                       value="<%= checkInDate %>" required>
            </div>

            <div class="mb-3">
                <label>Check-out Date</label>
                <input type="date" name="checkOutDate" class="form-control"
                       value="<%= checkOutDate %>" required>
            </div>

            <div class="mb-3">
                <label>Status</label>
                <select name="status" class="form-control" required>
                    <option value="CHECKED_IN"  <%= "CHECKED_IN".equals(reservation.getStatus()) ? "selected" : "" %>>Check-in</option>
                    <option value="CHECKED_OUT" <%= "CHECKED_OUT".equals(reservation.getStatus()) ? "selected" : "" %>>Check-out</option>
                </select>
            </div>

            <button type="submit" class="btn btn-submit mt-3">
                <i class="fas fa-pen"></i> Update Reservation
            </button>

        </form>
    </div>
</div>

<script src="../assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>

