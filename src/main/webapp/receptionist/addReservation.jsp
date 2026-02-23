<%--
  Created by IntelliJ IDEA.
  User: imalka
  Date: 2/5/2026
  Time: 7:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*, com.hotelbillingsystem.models.*, com.hotelbillingsystem.services.*" %>
<%@ page session="true" %>

<%
    RoomService roomService = new RoomService();
    List<Room> rooms = roomService.getAllRooms();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Reservation</title>
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
            width: 60%;
            background: #ffffff;
            border-radius: 18px;
            padding: 30px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.08);
            border: 1.5px solid #f1d6a3;
        }
        .form-control {
            border-radius: 12px;
        }
        .btn-submit {
            background-color: #4caf50;
            color: white;
            border-radius: 12px;
            padding: 8px 20px;
            font-weight: 500;
        }
        .btn-submit:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<%@ include file="layouts/sidebar.jsp" %>
<%@ include file="layouts/navbar.jsp" %>

<div class="content-wrapper">
    <div class="card-box">
        <h4 class="mb-4">Add New Reservation</h4>

        <%-- Success message --%>
        <% String success = request.getParameter("success"); %>
        <% if ("true".equals(success)) { %>
        <div class="alert alert-success text-center">
            Reservation added successfully!
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
                case "invalid_room": %>
            Invalid room type selected.
            <% break;
                case "reservation_failed": %>
            Failed to add reservation. Reservation ID may already exist.
            <% break;
                default: %>
            An error occurred while adding the reservation.
            <% } %>
        </div>
        <% } %>


        <form action="<%= request.getContextPath() %>/receptionist/ReservationServlet" method="post">
            <div class="mb-3">
                <label>Reservation ID</label>
                <input type="text" name="reservationId" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Guest Name</label>
                <input type="text" name="guestName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>NIC</label>
                <input type="text" name="nic" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Address</label>
                <input type="text" name="address" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Contact Number</label>
                <input type="text" name="contactNumber" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Email</label>
                <input type="email" name="email" class="form-control">
            </div>
            <div class="mb-3">
                <label>Room Code</label>
                <select name="roomType" class="form-control" required>
                    <option value="">Select Room Code</option>

                    <% for (Room r : rooms) {
                        if ("Available".equalsIgnoreCase(r.getRoomStatus())) { %>

                    <option value="<%= r.getRoomCode() %>_<%= r.getRoomName() %>">
                        <%= r.getRoomCode() %>_<%= r.getRoomName() %>
                    </option>

                    <%  }
                    } %>
                </select>
            </div>
            <div class="mb-3">
                <label>Check-in Date</label>
                <input type="date" name="checkInDate" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Check-out Date</label>
                <input type="date" name="checkOutDate" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Status</label>
                <select name="status" class="form-control" required>
                    <option value="CHECKED_IN">Check-in</option>
                    <option value="CHECKED_OUT">Check-out</option>
                </select>
            </div>
            <button type="submit" class="btn btn-submit mt-3"><i class="fas fa-plus"></i> Add Reservation</button>
        </form>
    </div>
</div>

<script src="../assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
