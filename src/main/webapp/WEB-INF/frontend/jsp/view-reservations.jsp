<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservations - RoomFlow</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <!-- AOS Animations -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<c:url value='/frontend/css/style.css?v=5' />">
</head>
<body class="rf-page-body">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark rf-navbar">
    <div class="container">
        <a class="navbar-brand" href="/">
            <div class="rf-logo-icon"><i class="fa-solid fa-hotel"></i></div>
            RoomFlow
        </a>
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mainNav">
            <ul class="navbar-nav ms-auto align-items-center gap-1">
                <li class="nav-item"><a class="nav-link" href="/"><i class="fa-solid fa-house me-1"></i>Home</a></li>
                <li class="nav-item"><a class="nav-link active" href="/reservations"><i class="fa-solid fa-list me-1"></i>Reservations</a></li>
                <div class="rf-nav-divider d-none d-lg-block"></div>
                <li class="nav-item">
                    <a href="/reservations/add" class="btn btn-warning btn-sm fw-bold px-3">
                        <i class="fa-solid fa-plus me-1"></i>New Booking
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container my-5">

    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3"
         data-aos="fade-down" data-aos-duration="500">
        <div>
            <h2 class="fw-bold mb-1"><i class="fa-solid fa-list-check me-2 text-primary"></i>All Reservations</h2>
            <p class="text-muted mb-0">Manage all hotel room bookings</p>
        </div>
        <a href="/reservations/add" class="btn rf-btn-save px-4">
            <i class="fa-solid fa-plus me-2"></i>Add Reservation
        </a>
    </div>

    <!-- Search -->
    <div class="rf-search-card mb-4" data-aos="fade-up" data-aos-delay="100">
        <form action="/reservations" method="get" class="d-flex gap-3 flex-wrap align-items-center">
            <div class="flex-grow-1">
                <div class="input-group">
                    <span class="input-group-text bg-white border-end-0">
                        <i class="fa-solid fa-magnifying-glass text-muted"></i>
                    </span>
                    <input type="text" class="form-control border-start-0 rf-search-input"
                           name="keyword"
                           placeholder="Search by ID, customer, room, type, payment..."
                           value="${keyword}">
                </div>
            </div>
            <button type="submit" class="btn btn-primary px-4">
                <i class="fa-solid fa-search me-1"></i>Search
            </button>
            <a href="/reservations" class="btn btn-outline-secondary px-3">
                <i class="fa-solid fa-rotate-left me-1"></i>Clear
            </a>
        </form>
    </div>

    <!-- Table -->
    <div class="rf-table-card" data-aos="fade-up" data-aos-delay="200">
        <div class="table-responsive">
            <table class="table rf-table mb-0">
                <thead>
                <tr>
                    <th><i class="fa-solid fa-hashtag me-1"></i>Res. ID</th>
                    <th><i class="fa-solid fa-user me-1"></i>Customer</th>
                    <th><i class="fa-solid fa-phone me-1"></i>Contact</th>
                    <th><i class="fa-solid fa-door-open me-1"></i>Room ID</th>
                    <th><i class="fa-solid fa-bed me-1"></i>Type</th>
                    <th><i class="fa-solid fa-moon me-1"></i>Nights</th>
                    <th><i class="fa-solid fa-calendar-arrow-down me-1"></i>Check-In</th>
                    <th><i class="fa-solid fa-calendar-arrow-up me-1"></i>Check-Out</th>
                    <th><i class="fa-solid fa-credit-card me-1"></i>Payment</th>
                    <th><i class="fa-solid fa-dollar-sign me-1"></i>Total</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty reservations}">
                        <c:forEach var="reservation" items="${reservations}">
                            <tr class="rf-table-row">
                                <td><span class="badge rf-badge-id">${reservation.reservationId}</span></td>
                                <td class="fw-semibold">${reservation.customerName}</td>
                                <td><i class="fa-solid fa-phone-flip me-1 text-muted small"></i>${reservation.contactNumber}</td>
                                <td>${reservation.roomId}</td>
                                <td>
                                    <span class="badge rf-badge-type-${reservation.roomType.toLowerCase()}">${reservation.roomType}</span>
                                </td>
                                <td>${reservation.numberOfNights}</td>
                                <td>${reservation.checkInDate}</td>
                                <td>${reservation.checkOutDate}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${reservation.paymentStatus == 'Paid'}">
                                            <span class="badge bg-success"><i class="fa-solid fa-check me-1"></i>Paid</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-warning text-dark"><i class="fa-solid fa-clock me-1"></i>Pending</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="fw-semibold text-success">$${reservation.totalCost}</td>
                                <td>
                                    <div class="d-flex gap-2">
                                        <a href="/reservations/edit/${reservation.reservationId}"
                                           class="btn btn-sm rf-btn-edit">
                                            <i class="fa-solid fa-pen"></i>
                                        </a>
                                        <a href="/reservations/delete/${reservation.reservationId}"
                                           class="btn btn-sm rf-btn-delete"
                                           onclick="return confirm('Delete reservation ${reservation.reservationId}?');">
                                            <i class="fa-solid fa-trash"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="11" class="text-center py-5">
                                <i class="fa-solid fa-inbox fs-1 text-muted d-block mb-3"></i>
                                <span class="text-muted fs-5">No reservations found.</span>
                                <div class="mt-3">
                                    <a href="/reservations/add" class="btn rf-btn-save btn-sm">
                                        <i class="fa-solid fa-plus me-1"></i>Add First Reservation
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
    </div>

</div>

<!-- Footer -->
<footer class="rf-footer mt-5">
    <div class="container">
        <div class="row g-5">
            <div class="col-lg-4 col-md-6">
                <div class="rf-footer-brand">
                    <div class="rf-logo-icon"><i class="fa-solid fa-hotel"></i></div>
                    RoomFlow
                </div>
                <p>A modern hotel room reservation system built for simplicity, speed, and elegance.</p>
                <div class="rf-social-links">
                    <a href="#" class="rf-social-link"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="rf-social-link"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="rf-social-link"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="rf-social-link"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            <div class="col-lg-2 col-md-6 col-6">
                <div class="rf-footer-heading">Quick Links</div>
                <ul class="rf-footer-links">
                    <li><a href="/"><i class="fa-solid fa-chevron-right"></i>Home</a></li>
                    <li><a href="/reservations"><i class="fa-solid fa-chevron-right"></i>Reservations</a></li>
                    <li><a href="/reservations/add"><i class="fa-solid fa-chevron-right"></i>New Booking</a></li>
                </ul>
            </div>
            <div class="col-lg-2 col-md-6 col-6">
                <div class="rf-footer-heading">Room Types</div>
                <ul class="rf-footer-links">
                    <li><a href="#"><i class="fa-solid fa-chevron-right"></i>Standard</a></li>
                    <li><a href="#"><i class="fa-solid fa-chevron-right"></i>Deluxe</a></li>
                    <li><a href="#"><i class="fa-solid fa-chevron-right"></i>Suite</a></li>
                </ul>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="rf-footer-heading">Contact</div>
                <div class="rf-footer-contact-item">
                    <div class="icon-wrap"><i class="fa-solid fa-location-dot"></i></div>
                    <span>123 Hotel Avenue, City, Country</span>
                </div>
                <div class="rf-footer-contact-item">
                    <div class="icon-wrap"><i class="fa-solid fa-phone"></i></div>
                    <span>+1 (555) 000-0000</span>
                </div>
                <div class="rf-footer-contact-item">
                    <div class="icon-wrap"><i class="fa-solid fa-envelope"></i></div>
                    <span>info@roomflow.com</span>
                </div>
            </div>
        </div>
        <div class="rf-footer-bottom">
            <div class="d-flex flex-wrap justify-content-between align-items-center gap-2">
                <p class="rf-footer-bottom-text mb-0">&copy; 2026 <span>RoomFlow</span>. All rights reserved.</p>
                <p class="rf-footer-bottom-text mb-0">Built with <i class="fa-solid fa-heart" style="color:#f59e0b;font-size:0.75rem"></i> Spring Boot &amp; Bootstrap 5</p>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- AOS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<!-- Custom JS -->
<script src="<c:url value='/frontend/js/script.js?v=6' />"></script>

</body>
</html>