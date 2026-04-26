<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Reservation</title>

    <!-- Proper CSS -->
    <link rel="stylesheet" href="<c:url value='/frontend/css/style.css?v=4' />">
</head>
<body>

<div class="container">
    <div class="card">
        <h2>Edit Reservation</h2>

        <!-- Error message -->
        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>

        <form action="/reservations/update" method="post" class="form-grid">

            <input type="text" name="reservationId" value="${reservation.reservationId}" readonly>

            <input type="text" name="customerId" value="${reservation.customerId}" required>

            <input type="text" name="customerName" value="${reservation.customerName}" required>

            <!-- Phone validation -->
            <input type="text"
                   name="contactNumber"
                   value="${reservation.contactNumber}"
                   pattern="[0-9]{10}"
                   maxlength="10"
                   title="Must be exactly 10 digits"
                   required>

            <input type="text" name="roomId" value="${reservation.roomId}" required>

            <select name="roomType" required>
                <option value="Standard" ${reservation.roomType == 'Standard' ? 'selected' : ''}>Standard</option>
                <option value="Deluxe" ${reservation.roomType == 'Deluxe' ? 'selected' : ''}>Deluxe</option>
                <option value="Suite" ${reservation.roomType == 'Suite' ? 'selected' : ''}>Suite</option>
            </select>

            <input type="number" name="numberOfNights" value="${reservation.numberOfNights}" min="1" required>

            <!-- Date validation -->
            <input type="date" name="checkInDate" id="checkInDate" value="${reservation.checkInDate}" required>
            <input type="date" name="checkOutDate" id="checkOutDate" value="${reservation.checkOutDate}" required>

            <select name="paymentStatus" required>
                <option value="Paid" ${reservation.paymentStatus == 'Paid' ? 'selected' : ''}>Paid</option>
                <option value="Pending" ${reservation.paymentStatus == 'Pending' ? 'selected' : ''}>Pending</option>
            </select>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">Update Reservation</button>
                <a href="/reservations" class="btn btn-secondary">Back</a>
            </div>

        </form>
    </div>
</div>

<script src="<c:url value='/frontend/js/script.js' />"></script>

</body>
</html>