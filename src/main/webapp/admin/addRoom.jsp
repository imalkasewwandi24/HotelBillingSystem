<%--
  Created by IntelliJ IDEA.
  User: imalka
  Date: 2/7/2026
  Time: 7:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Add Room</title>
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
    <h4 class="mb-4">Add New Room</h4>

    <%-- Success message --%>
    <% String success = request.getParameter("success"); %>
    <% if ("true".equals(success)) { %>
    <div class="alert alert-success text-center">
      Room added successfully!
    </div>
    <% } %>

    <%-- Error messages --%>
    <% String error = request.getParameter("error"); %>
    <% if (error != null) { %>
    <div class="alert alert-danger text-center">
      <% switch(error) {
        case "room_failed": %>
      Failed to add room. Room code may already exist.
      <% break;
        default: %>
      An error occurred while adding the room.
      <% } %>
    </div>
    <% } %>

    <form action="<%= request.getContextPath() %>/admin/RoomServlet" method="post">

      <div class="mb-3">
        <label>Room Code</label>
        <input type="text" name="roomCode" class="form-control" required>
      </div>

      <div class="mb-3">
        <label>Room Name</label>
        <input type="text" name="roomName" class="form-control" required>
      </div>

      <div class="mb-3">
        <label>Description</label>
        <input type="text" name="description" class="form-control" required>
      </div>

      <div class="mb-3">
        <label>Price Per Night (LKR)</label>
        <input type="number" step="0.01" name="pricePerNight" class="form-control" required>
      </div>

      <div class="mb-3">
        <label>Room Number(Physical)</label>
        <input type="number" name="numberOfRooms" class="form-control" required>
      </div>

      <div class="mb-3">
        <label>Maximum Guests</label>
        <input type="number" name="maxGuests" class="form-control" required>
      </div>

      <div class="mb-3">
        <label>Room Status</label>
        <select name="roomStatus" class="form-control" required>
          <option value="Available">Available</option>
          <option value="Occupied">Occupied</option>
          <option value="Maintenance">Maintenance</option>
        </select>
      </div>

      <button type="submit" class="btn btn-submit mt-3">
        <i class="fas fa-plus"></i> Add Room
      </button>
    </form>
  </div>
</div>

<script src="../assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>

