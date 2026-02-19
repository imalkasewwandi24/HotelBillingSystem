<%--
  Created by IntelliJ IDEA.
  User: imalka
  Date: 2/18/2026
  Time: 4:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%@ page import="com.hotelbillingsystem.models.Bill" %>

<%
  List<Bill> bills = (List<Bill>) request.getAttribute("bills");

  SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy hh:mm a");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Bill Records - Admin | Resort</title>
  <link href="../assets/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      background: #f9f9f9;
      margin: 0;
      padding: 0;
    }

    .main-content {
      margin-left: 260px;
      padding: 30px;
      padding-top: 100px;
    }

    .form-container {
      background: white;
      padding: 30px;
      border-radius: 15px;
      max-width: 1100px;
      margin: auto;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
    }

    .table thead {
      background: linear-gradient(135deg, #e7993c, #d4831f);
      color: white;
    }

    .title {
      text-align: center;
      margin-bottom: 25px;
      font-size: 28px;
      font-weight: 600;
    }
    .btn-view {
      background: linear-gradient(135deg, #e7993c, #d4831f);
      border: none;
      color: white;
    }

  </style>
</head>

<body>

<%@ include file="layouts/sidebar.jsp" %>
<%@ include file="layouts/navbar.jsp" %>

<div class="main-content">
  <div class="form-container">

    <h2 class="title">View All Bills</h2>

    <div class="mb-3">
      <input type="text"
             id="searchInput"
             class="form-control"
             placeholder="Search by Reservation ID or Date">
    </div>

    <!-- Bill Table -->
    <table class="table table-hover table-bordered">
      <thead>
      <tr>
        <th>Bill Number</th>
        <th>Reservation ID</th>
        <th>Date & Time</th>
        <th>Discount (%)</th>
        <th>Service Charge (%)</th>
        <th>Grand Total</th>
        <th>Payment Method</th>
        <th>View</th>
      </tr>
      </thead>

      <tbody>
      <% if (bills != null && !bills.isEmpty()) {
        for (Bill b : bills) { %>

      <tr>
        <td><%= b.getBillId() %></td>
        <td><%= b.getReservationId() %></td>
        <td><%= b.getBillDate() != null ? sdf.format(b.getBillDate()) : "-" %></td>
        <td><%= String.format("%.0f", b.getDiscount()) %>%</td>
        <td><%= String.format("%.0f", b.getServiceCharge()) %>%</td>
        <td>Rs. <%= String.format("%.2f", b.getGrandTotal()) %></td>
        <td><%= b.getPaymentMethod() %></td>
        <td>
          <a href="<%= request.getContextPath() %>/admin/BillPreviewServlet?billId=<%= b.getBillId() %>"
             class="btn btn-view btn-sm">
            View
          </a>
        </td>
      </tr>

      <%  }
      } else { %>

      <tr>
        <td colspan="8" class="text-center text-danger">
          No bills found.
        </td>
      </tr>

      <% } %>
      </tbody>
    </table>

  </div>
</div>

<%@ include file="layouts/footer.jsp" %>

<!-- Search Script -->
<script>
  document.getElementById('searchInput')
          .addEventListener('keyup', function () {
            const filter = this.value.toLowerCase();
            const rows = document.querySelectorAll('table tbody tr');
            rows.forEach(row => {
              const resId = row.cells[1].textContent.toLowerCase();
              const date = row.cells[2].textContent.toLowerCase();
              row.style.display = (resId.includes(filter) || date.includes(filter)) ? '' : 'none';
            });
          });
</script>

</body>
</html>

