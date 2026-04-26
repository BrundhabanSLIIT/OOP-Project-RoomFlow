<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Reservation</title>

    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/frontend/css/style.css?v=4' />">
</head>
<body>

<div class="container">
    <div class="card">
        <h2>Add Reservation</h2>

        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>

        <form action="/reservations/add" method="post" class="form-grid">

            <input type="text" name="reservationId" placeholder="Reservation ID" required>
            <input type="text" name="customerId" placeholder="Customer ID" required>
            <input type="text" name="customerName" placeholder="Customer Name" required>

            <input type="text"
                   name="contactNumber"
                   placeholder="Contact Number"
                   pattern="[0-9]{10}"
                   maxlength="10"
                   required>

            <input type="text" name="roomId" placeholder="Room ID" required>

            <select name="roomType" required>
                <option value="">Select Room Type</option>
                <option value="Standard">Standard</option>
                <option value="Deluxe">Deluxe</option>
                <option value="Suite">Suite</option>
            </select>

            <input type="number" name="numberOfNights" min="1" required>

            <!-- IMPORTANT IDs -->
            <input type="date" name="checkInDate" id="checkInDate" required>
            <input type="date" name="checkOutDate" id="checkOutDate" required>

            <select name="paymentStatus" required>
                <option value="">Select Payment</option>
                <option value="Paid">Paid</option>
                <option value="Pending">Pending</option>
            </select>

            <div class="form-actions">
                <button type="submit" class="btn btn-success">Save</button>
                <a href="/reservations" class="btn btn-secondary">Back</a>
            </div>

        </form>
    </div>
</div>

<!-- JS MUST BE HERE -->
<script src="<c:url value='/frontend/js/script.js?v=2' />"></script>

</body>
</html>