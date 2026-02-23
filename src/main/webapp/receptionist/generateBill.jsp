<%--
  Created by IntelliJ IDEA.
  User: imalka
  Date: 2/16/2026
  Time: 7:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.hotelbillingsystem.services.RoomService" %>
<%@ page import="com.hotelbillingsystem.services.ReservationService" %>
<%@ page import="com.hotelbillingsystem.models.*" %>
<%@ page import="java.util.ArrayList" %>


<%
    RoomService roomService = new RoomService();
    ReservationService reservationService = new ReservationService();

    List<Room> rooms = roomService.getAllRooms();
    List<Reservation> reservations = reservationService.getAllReservations();

    List<BillItem> billItems = (List<BillItem>) session.getAttribute("billItems");
    if (billItems == null) {
        billItems = new ArrayList<>();
    }

    String message = (String) session.getAttribute("message");
    String messageType = (String) session.getAttribute("messageType");
    if (message != null) {
        boolean isSuccess = "success".equals(messageType);
%>

<div class="modal fade" id="successModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content shadow-lg border-0">

            <div class="modal-header
                <%= isSuccess ? "bg-success" : "bg-danger" %>
                text-white">
                <h5 class="modal-title">
                    <i class="fas <%= isSuccess ? "fa-check-circle" : "fa-times-circle" %> me-2"></i>
                    <%= isSuccess ? "Success" : "Error" %>
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body text-center py-4">
                <p class="fs-5 fw-semibold
                    <%= isSuccess ? "text-success" : "text-danger" %>">
                    <%= message %>
                </p>
            </div>

            <div class="modal-footer justify-content-center border-0 pb-4">
                <button type="button"
                        class="btn <%= isSuccess ? "btn-success" : "btn-danger" %> px-4"
                        data-bs-dismiss="modal">
                    OK
                </button>
            </div>

        </div>
    </div>
</div>

<%
        session.removeAttribute("message");
        session.removeAttribute("messageType");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Create Bill</title>
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
        .main-content { margin-left: 280px; padding: 30px; }
        .custom-thead { background: linear-gradient(135deg, rgba(0, 232, 205, 0.66), rgba(0, 232, 205, 0.43)); color: white; border-top-left-radius: 10px; border-top-right-radius: 10px; }
        .table-custom { border-radius: 10px; overflow: hidden; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        .table-hover tbody tr:hover { background-color: #fff3e0; }
        .btn { border-radius: 8px; }
        .form-section { background-color: #f8f9fa; border-radius: 10px; padding: 20px; margin-bottom: 20px; }
        .action-buttons .btn { margin-left: 10px; }
    </style>
</head>
<body>

<%@ include file="layouts/sidebar.jsp" %>
<%@ include file="layouts/navbar.jsp" %>

<br><br><br><br>

<div class="main-content">
    <h2 class="text-center mb-4 " style="color: black;">Generate Bill</h2>

    <!-- Add Room Form -->
    <div class="form-section">
        <form action="${pageContext.request.contextPath}/receptionist/AddBillItemServlet" method="post" class="row g-3">
            <div class="col-md-6">
                <label for="roomId" class="form-label">Select Room</label>
                <select name="roomId" id="roomId" class="form-select" required onchange="showRoomDetails()">
                    <option value="" disabled selected>Select Room</option>
                    <% for (Room r : rooms) {
                        if ("Available".equals(r.getRoomStatus())) { %>
                    <option value="<%= r.getRoomId() %>" data-type="<%= r.getRoomName() %>" data-price="<%= r.getPricePerNight() %>">
                        <%= r.getRoomCode() %>
                    </option>
                    <% } } %>
                </select>
            </div>

            <div class="col-md-3">
                <label class="form-label">Room Type</label>
                <input type="text" id="roomTypeLabel" class="form-control" readonly>
            </div>

            <div class="col-md-3">
                <label class="form-label">Price per Night (LKR)</label>
                <input type="text" id="roomPriceLabel" class="form-control" readonly>
            </div>

            <div class="col-md-3">
                <label for="nights" class="form-label">Nights</label>
                <input type="number" name="nights" id="nights" class="form-control" value="1" min="1" required />
            </div>

            <div class="col-md-3 d-flex align-items-end">
                <button type="submit" class="btn text-white w-30"
                        style="background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%); border: none;">
                    Add Room
                </button>
            </div>
        </form>
    </div>

    <!-- Save Bill Form -->
    <form action="${pageContext.request.contextPath}/receptionist/SaveBillServlet" method="post" id="saveBillForm">
        <div class="mt-4">
            <h5>Bill Items</h5>
            <div class="table-responsive">
                <table class="table table-bordered table-hover table-custom" id="billTable">
                    <thead class="custom-thead">
                    <tr>
                        <th>Room Code</th>
                        <th>Room Name</th>
                        <th>Nights</th>
                        <th>Price/Night</th>
                        <th>Total</th>
                        <th>Remove</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        double grandTotal = 0;
                        for (BillItem bi : billItems) {
                            Room room = roomService.getRoomById(bi.getRoomId());
                            if (room == null) continue;
                            double total = bi.getNights() * room.getPricePerNight();
                            grandTotal += total;
                    %>
                    <tr>
                        <td><%= room.getRoomCode() %></td>
                        <td><%= room.getRoomName() %></td>
                        <td><%= bi.getNights() %></td>
                        <td><%= String.format("%.2f", room.getPricePerNight()) %></td>
                        <td class="rowTotal"><%= String.format("%.2f", total) %></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/receptionist/RemoveBillItemServlet?roomId=<%= room.getRoomId() %>"
                               class="btn btn-danger btn-sm">
                                <i class="fas fa-trash-alt"></i>
                            </a>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                    <tfoot>
                    <tr>
                        <th colspan="4" class="text-end">Grand Total</th>
                        <th id="grandTotalFooter">Rs.<%= String.format("%.2f", grandTotal) %></th>
                        <th></th>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <!-- Bill Summary -->
        <div class="form-section">
            <h5 class="mb-3">Bill Summary</h5>
            <div class="row g-3">
                <div class="col-md-3">
                    <label class="form-label">Subtotal (Rs.)</label>
                    <input type="text" class="form-control" id="subtotal" readonly />
                </div>
                <div class="col-md-3">
                    <label class="form-label">Discount (%)</label>
                    <input type="number" class="form-control" name="discount" id="discount" value="0" min="0" oninput="calculateTotal()" />
                </div>
                <div class="col-md-3">
                    <label class="form-label">Service Charge (%)</label>
                    <input type="number" class="form-control" name="serviceCharge" id="serviceCharge" value="10" min="0" oninput="calculateTotal()" />
                </div>
                <div class="col-md-3">
                    <label class="form-label fw-bold">Final Total (Rs.)</label>
                    <input type="text" class="form-control fw-bold text-success" id="grandTotal" readonly />
                    <input type="hidden" name="grandTotal" id="grandTotalHidden" value="0.0" />
                </div>
            </div>
        </div>

        <!-- Reservation Select -->
        <div class="form-section">
            <div class="row g-3 align-items-center">
                <div class="col-md-6">
                    <label for="reservationSelect" class="form-label">Select Reservation</label>
                    <select id="reservationSelect" name="reservationId" class="form-select" required>
                        <option selected disabled>Select Reservation</option>
                        <%
                            for (Reservation r : reservations) {
                                if ("CHECKED_OUT".equals(r.getStatus())) {
                        %>
                        <option value="<%= r.getReservationId() %>" data-guest="<%= r.getGuestName() %>">
                            <%= r.getReservationId() %>
                        </option>
                        <% }} %>
                    </select>
                    <div class="col-md-6 mt-3">
                        <label class="form-label">Guest Name</label>
                        <input type="text" id="guestNameLabel" class="form-control" readonly>
                    </div>
                </div>
            </div>
        </div>

        <!-- Payment Method -->
        <div class="form-section">
            <div class="col-md-6">
                <label for="paymentMethod">Payment Method</label>
                <select class="form-control" name="paymentMethod" id="paymentMethod" required>
                    <option value="">Select Payment Method</option>
                    <option value="cash">Cash</option>
                    <option value="check">Check</option>
                    <option value="card">Card</option>
                </select>
            </div>
        </div>

        <!-- Save & Preview -->
        <div class="text-end mt-4 action-buttons">
            <button type="submit" class="btn text-white"
                    style="background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%); border: none;">
                <i class="fas fa-print me-2"></i>Save
            </button>
            <button type="button" class="btn btn-secondary me-2" onclick="openPrintPreview()">
                <i class="fas fa-eye"></i> Preview
            </button>
        </div>
    </form>
</div>

<%@ include file="layouts/footer.jsp" %>

<script>
    function removeRow(button) {
        const row = button.closest("tr");
        row.remove();
        calculateTotal();
    }

    function calculateTotal() {
        let subtotal = 0;
        document.querySelectorAll("#billTable tbody tr").forEach(row => {
            const rowTotal = parseFloat(row.querySelector(".rowTotal").innerText) || 0;
            subtotal += rowTotal;
        });
        document.getElementById("subtotal").value = subtotal.toFixed(2);

        const discount = parseFloat(document.getElementById("discount").value) || 0;
        const service = parseFloat(document.getElementById("serviceCharge").value) || 0;
        const discounted = subtotal - (subtotal * discount / 100);
        const total = discounted + (discounted * service / 100);

        document.getElementById("grandTotal").value = total.toFixed(2);
        document.getElementById("grandTotalFooter").innerText = "Rs." + total.toFixed(2);
        document.getElementById("grandTotalHidden").value = total.toFixed(2);
    }

    document.getElementById("saveBillForm").addEventListener("submit", function() {
        calculateTotal();
    });

    function showRoomDetails() {
        const select = document.getElementById("roomId");
        const option = select.options[select.selectedIndex];
        document.getElementById("roomTypeLabel").value = option?.getAttribute("data-type") || "";
        const price = option?.getAttribute("data-price") || "0";
        document.getElementById("roomPriceLabel").value = parseFloat(price).toFixed(2);
    }

    function openPrintPreview() {
        const reservationSelect = document.getElementById("reservationSelect");
        const reservationId = reservationSelect.value;
        const guestName = document.getElementById("guestNameLabel").value;
        const discount = document.getElementById("discount").value;
        const serviceCharge = document.getElementById("serviceCharge").value;
        const paymentMethod = document.getElementById("paymentMethod").value;

        if (!reservationId) {
            alert("Please select a reservation first!");
            return;
        }

        const rows = document.querySelectorAll("#billTable tbody tr");
        if (rows.length === 0) {
            alert("No bill items added!");
            return;
        }

        let params = new URLSearchParams();

        // Append each room item
        rows.forEach(row => {
            params.append("roomCode[]", row.cells[0].innerText.trim());
            params.append("roomName[]", row.cells[1].innerText.trim());
            params.append("nights[]", row.cells[2].innerText.trim());
            params.append("pricePerNight[]", row.cells[3].innerText.replace("Rs.", "").trim());
        });

        // Append other info
        params.append("reservationId", reservationId);
        params.append("guestName", guestName);
        params.append("discount", discount);
        params.append("serviceCharge", serviceCharge);
        params.append("paymentMethod", paymentMethod);

        // Open print preview window
        const previewUrl = "printBill.jsp?" + params.toString();
        window.location.href = "printBill.jsp?" + params.toString();
    }

    document.getElementById("reservationSelect").addEventListener("change", function () {
        const guestName = this.options[this.selectedIndex].getAttribute("data-guest");
        document.getElementById("guestNameLabel").value = guestName || "";
    });

    window.onload = function() {
        calculateTotal();
        <% if (message != null) { %>
        new bootstrap.Modal(document.getElementById('successModal')).show();
        <% } %>
    }
</script>
</body>
</html>

