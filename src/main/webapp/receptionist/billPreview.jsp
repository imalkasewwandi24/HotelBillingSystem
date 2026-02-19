<%--
  Created by IntelliJ IDEA.
  User: imalka
  Date: 2/17/2026
  Time: 7:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%@ page import="com.hotelbillingsystem.models.Bill, com.hotelbillingsystem.models.BillItem" %>
<%@ page import="com.hotelbillingsystem.services.RoomService, com.hotelbillingsystem.models.Room" %>

<%
  Bill bill = (Bill) request.getAttribute("bill");
  List<BillItem> items = (List<BillItem>) request.getAttribute("items");

  SimpleDateFormat sdf = new SimpleDateFormat("dd MMMM yyyy, hh:mm a");
  String currentDate = bill.getBillDate() != null ? sdf.format(bill.getBillDate()) : "";

  RoomService roomService = new RoomService();
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Reservation Bill - Ocean View Resort</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f2f4f7;
      margin: 0;
      padding: 20px;
    }

    .container {
      max-width: 900px;
      margin: auto;
      background-color: #ffffff;
      border-radius: 12px;
      box-shadow: 0 8px 20px rgba(0,0,0,0.08);
      padding: 30px 40px;
    }

    h2 {
      text-align: center;
      color: #0f2c70;
      font-size: 30px;
      margin-bottom: 10px;
      letter-spacing: 0.5px;
    }

    .header-info {
      text-align: center;
      font-size: 15px;
      color: #444;
      margin-bottom: 30px;
      line-height: 1.6;
    }

    .header-info p {
      margin: 3px 0;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      font-size: 14px;
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 3px 15px rgba(0,0,0,0.05);
    }

    th, td {
      padding: 12px 10px;
      text-align: center;
    }

    th {
      background: #0f2c70;
      color: #fff;
      font-weight: 600;
      letter-spacing: 0.5px;
    }

    tbody tr:nth-child(even) {
      background-color: #f9f9f9;
    }

    tbody tr:hover {
      background-color: #e6f0ff;
    }

    .totals-container {
      width: 100%;
      max-width: 400px;
      margin-top: 30px;
      margin-left: auto;
      border-radius: 12px;
      background-color: #f0f5ff;
      padding: 20px 25px;
      box-shadow: 0 3px 12px rgba(0,0,0,0.05);
    }

    .totals-row {
      display: flex;
      justify-content: space-between;
      font-size: 16px;
      color: #0f2c70;
      margin-bottom: 10px;
    }

    .totals-row.grand-total {
      font-weight: bold;
      font-size: 18px;
      color: #1a3d8f;
      border-top: 1px dashed #0f2c70;
      padding-top: 8px;
    }

    .footer {
      text-align: center;
      margin-top: 50px;
      font-size: 14px;
      color: #555;
      line-height: 1.6;
    }

    .back-button {
      display: inline-block;
      margin-bottom: 25px;
      background-color: #0f2c70;
      color: #fff;
      padding: 8px 18px;
      border-radius: 6px;
      text-decoration: none;
      font-weight: 600;
      transition: 0.3s;
    }

    .back-button:hover {
      background-color: #081a3f;
    }

    @media print {
      body { background-color: #fff; padding: 0; }
      .container { box-shadow: none; border: none; padding: 0; }
      .back-button { display: none; }
      .totals-container { float: none; margin-left: 0; width: 100%; background-color: #fff; border: none; padding: 0; }
    }
  </style>
</head>
<body>

<div class="container">

  <a href="javascript:history.back()" class="back-button">
    <i class="fas fa-arrow-left"></i> Back
  </a>

  <h2>Ocean View Resort</h2>
  <div class="header-info">
    <p><strong>Date:</strong> <%= currentDate %></p>
    <p><strong>Bill ID:</strong> <%= bill.getBillId() %></p>
    <p><strong>Reservation ID:</strong> <%= bill.getReservationId() %></p>
    <p><strong>Payment Method:</strong> <%= bill.getPaymentMethod() %></p>
  </div>

  <table>
    <thead>
    <tr>
      <th>Room Code</th>
      <th>Nights</th>
      <th>Price/Night (Rs.)</th>
      <th>Total (Rs.)</th>
    </tr>
    </thead>
    <tbody>
    <% if (items != null) {
      for (BillItem item : items) {
        double total = item.getNights() * item.getRoomPrice();
        Room room = roomService.getRoomById(item.getRoomId());
        String roomCode = (room != null) ? room.getRoomCode() : "N/A";
    %>
    <tr>
      <td><%= roomCode %></td>
      <td><%= item.getNights() %></td>
      <td><%= String.format("%.2f", item.getRoomPrice()) %></td>
      <td><%= String.format("%.2f", total) %></td>
    </tr>
    <% } } %>
    </tbody>
  </table>

  <div class="totals-container">
    <div class="totals-row"><span>Discount:</span><span><%= String.format("%.0f", bill.getDiscount()) %> %</span></div>
    <div class="totals-row"><span>Service Charge:</span><span><%= String.format("%.0f", bill.getServiceCharge()) %> %</span></div>
    <div class="totals-row grand-total"><span>Grand Total:</span><span>Rs.<%= String.format("%.2f", bill.getGrandTotal()) %></span></div>
  </div>

  <div class="footer">
    Thank you for staying at Ocean View Resort!<br>
    We hope to see you again.
  </div>
</div>

<script>
  window.onload = function() {
    window.print();
  }
</script>
</body>
</html>
