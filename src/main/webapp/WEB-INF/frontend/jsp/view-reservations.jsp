<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Reservations</title>
    <link rel="stylesheet" href="<c:url value='/frontend/css/style.css?v=6' />">
</head>
<body>

<div class="container">
    <div class="card">

        <div class="page-header">
            <h2>All Reservations</h2>

            <div class="button-group">
                <a href="/" class="btn btn-secondary">Home</a>
                <a href="/reservations/add" class="btn btn-success">Add Reservation</a>
            </div>
        </div>

        <form action="/reservations" method="get" class="search-form">
            <input type="text"
                   name="keyword"
                   placeholder="Search by ID, customer, room, type, payment..."
                   value="${keyword}">

            <button type="submit" class="btn btn-primary">Search</button>
            <a href="/reservations" class="btn btn-secondary">Clear</a>
        </form>

        <div class="table-wrapper">
            <table>
                <thead>
                <tr>
                    <th>Reservation ID</th>
                    <th>Customer Name</th>
                    <th>Contact</th>
                    <th>Room ID</th>
                    <th>Room Type</th>
                    <th>Nights</th>
                    <th>Check-In</th>
                    <th>Check-Out</th>
                    <th>Payment</th>
                    <th>Total Cost</th>
                    <th>Actions</th>
                </tr>
                </thead>

                <tbody>
                <c:choose>
                    <c:when test="${not empty reservations}">
                        <c:forEach var="reservation" items="${reservations}">
                            <tr>
                                <td>${reservation.reservationId}</td>
                                <td>${reservation.customerName}</td>
                                <td>${reservation.contactNumber}</td>
                                <td>${reservation.roomId}</td>
                                <td>${reservation.roomType}</td>
                                <td>${reservation.numberOfNights}</td>
                                <td>${reservation.checkInDate}</td>
                                <td>${reservation.checkOutDate}</td>
                                <td>${reservation.paymentStatus}</td>
                                <td>${reservation.totalCost}</td>

                                <td>
                                    <div class="action-buttons">
                                        <a href="/reservations/edit/${reservation.reservationId}"
                                           class="btn btn-warning">
                                            Edit
                                        </a>

                                        <a href="/reservations/delete/${reservation.reservationId}"
                                           class="btn btn-danger"
                                           onclick="return confirm('Are you sure you want to delete this reservation?');">
                                            Delete
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>

                    <c:otherwise>
                        <tr>
                            <td colspan="11" class="empty-message">
                                No reservations found.
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>

    </div>
</div>

</body>
</html>