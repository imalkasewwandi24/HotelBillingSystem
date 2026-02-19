<%--
  Created by IntelliJ IDEA.
  User: imalka
  Date: 2/16/2026
  Time: 7:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%
  // Retrieve parameters from URL
  String reservationId = request.getParameter("reservationId");
  String guestName = request.getParameter("guestName");
  String discountParam = request.getParameter("discount");
  String serviceChargeParam = request.getParameter("serviceCharge");
  String paymentMethod = request.getParameter("paymentMethod");

  double discount = discountParam != null ? Double.parseDouble(discountParam) : 0;
  double serviceCharge = serviceChargeParam != null ? Double.parseDouble(serviceChargeParam) : 0;

  String[] roomCodes = request.getParameterValues("roomCode[]");
  String[] roomNames = request.getParameterValues("roomName[]");
  String[] nightsArr = request.getParameterValues("nights[]");
  String[] priceArr = request.getParameterValues("pricePerNight[]");

  double subtotal = 0;
  if (roomCodes != null) {
    for (int i = 0; i < roomCodes.length; i++) {
      double total = Integer.parseInt(nightsArr[i]) * Double.parseDouble(priceArr[i]);
      subtotal += total;
    }
  }

  double discounted = subtotal - (subtotal * discount / 100);
  double totalAmount = discounted + (discounted * serviceCharge / 100);

  String currentDate = new java.text.SimpleDateFormat("dd MMMM yyyy, hh:mm a").format(new Date());
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Reservation Bill</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f5f5f5;
      margin: 0;
      padding: 20px;
    }

    .container {
      max-width: 900px;
      margin: auto;
      background-color: #ffffff;
      border-radius: 10px;
      box-shadow: 0 6px 18px rgba(0,0,0,0.1);
      padding: 30px 40px;
    }

    h2 {
      text-align: center;
      color: #1e3a8a;
      font-size: 28px;
      margin-bottom: 5px;
    }

    .header-info {
      text-align: center;
      font-size: 14px;
      color: #333;
      margin-bottom: 30px;
    }

    .header-info p {
      margin: 4px 0;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      font-size: 14px;
    }

    th, td {
      padding: 12px 10px;
      text-align: left;
    }

    th {
      background: #1e3a8a;
      color: white;
      font-weight: 600;
    }

    tbody tr:nth-child(even) {
      background-color: #f9f9f9;
    }

    tbody tr:hover {
      background-color: #e3edff;
    }

    .totals-container {
      width: 100%;
      max-width: 400px;
      margin-top: 25px;
      margin-left: auto;
      border: 1px solid #1e3a8a;
      border-radius: 8px;
      padding: 15px 20px;
      background-color: #f0f5ff;
    }

    .totals-row {
      display: flex;
      justify-content: space-between;
      font-size: 16px;
      color: #1e3a8a;
      margin-bottom: 8px;
    }

    .totals-row.grand-total {
      font-weight: bold;
      font-size: 18px;
      color: #0f2c70;
    }

    .footer {
      text-align: center;
      margin-top: 50px;
      font-size: 14px;
      color: #555;
    }

    .back-button {
      display: inline-block;
      margin-bottom: 20px;
      background-color: #1e3a8a;
      color: #fff;
      padding: 8px 15px;
      border-radius: 6px;
      text-decoration: none;
      font-weight: bold;
    }

    .back-button:hover {
      background-color: #0f2c70;
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
    <p>Date: <%= currentDate %></p>
    <p>Reservation ID: <%= reservationId %></p>
    <p>Guest Name: <%= guestName %></p>
    <p>Payment Method: <%= paymentMethod %></p>
  </div>

  <table>
    <thead>
    <tr>
      <th>Room Code</th>
      <th>Room Name</th>
      <th>Nights</th>
      <th>Price/Night (Rs.)</th>
      <th>Total (Rs.)</th>
    </tr>
    </thead>
    <tbody>
    <% if (roomCodes != null) {
      for (int i = 0; i < roomCodes.length; i++) {
        int nights = Integer.parseInt(nightsArr[i]);
        double price = Double.parseDouble(priceArr[i]);
        double total = nights * price;
    %>
    <tr>
      <td><%= roomCodes[i] %></td>
      <td><%= roomNames[i] %></td>
      <td><%= nights %></td>
      <td><%= String.format("%.2f", price) %></td>
      <td><%= String.format("%.2f", total) %></td>
    </tr>
    <% } } %>
    </tbody>
  </table>

  <div class="totals-container">
    <div class="totals-row"><span>Subtotal:</span><span>Rs.<%= String.format("%.2f", subtotal) %></span></div>
    <div class="totals-row"><span>Discount:</span><span><%= discount %>%</span></div>
    <div class="totals-row"><span>Service Charge:</span><span><%= serviceCharge %>%</span></div>
    <div class="totals-row grand-total"><span>Grand Total:</span><span>Rs.<%= String.format("%.2f", totalAmount) %></span></div>
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
