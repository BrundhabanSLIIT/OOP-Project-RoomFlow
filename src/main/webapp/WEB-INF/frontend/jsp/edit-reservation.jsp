<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Reservation - RoomFlow</title>

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
    <div class="row justify-content-center">
        <div class="col-lg-8" data-aos="fade-up" data-aos-duration="600">

            <div class="rf-form-card">
                <div class="rf-form-header rf-form-header-edit">
                    <i class="fa-solid fa-pen-to-square me-2"></i>Edit Reservation
                    <span class="badge bg-light text-dark ms-2 fs-6">${reservation.reservationId}</span>
                </div>
                <div class="card-body p-4">

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger d-flex align-items-center" role="alert">
                            <i class="fa-solid fa-circle-exclamation me-2"></i>
                            <span>${error}</span>
                        </div>
                    </c:if>

                    <form action="/reservations/update" method="post" id="reservationForm">

                        <div class="row g-3">

                            <!-- Reservation ID (readonly) -->
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">
                                    <i class="fa-solid fa-hashtag me-1 text-primary"></i>Reservation ID
                                </label>
                                <input type="text" class="form-control rf-input rf-input-readonly"
                                       name="reservationId" value="${reservation.reservationId}" readonly>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">
                                    <i class="fa-solid fa-id-card me-1 text-primary"></i>Customer ID
                                </label>
                                <input type="text" class="form-control rf-input" name="customerId"
                                       value="${reservation.customerId}" required>
                            </div>

                            <!-- Customer Name & Contact -->
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">
                                    <i class="fa-solid fa-user me-1 text-primary"></i>Customer Name
                                </label>
                                <input type="text" class="form-control rf-input" name="customerName"
                                       value="${reservation.customerName}" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">
                                    <i class="fa-solid fa-phone me-1 text-primary"></i>Contact Number
                                </label>
                                <input type="text" class="form-control rf-input" name="contactNumber"
                                       value="${reservation.contactNumber}"
                                       pattern="[0-9]{10}" maxlength="10" required>
                            </div>

                            <!-- Room ID & Type -->
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">
                                    <i class="fa-solid fa-door-open me-1 text-primary"></i>Room ID
                                </label>
                                <input type="text" class="form-control rf-input" name="roomId"
                                       value="${reservation.roomId}" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">
                                    <i class="fa-solid fa-bed me-1 text-primary"></i>Room Type
                                </label>
                                <select class="form-select rf-input" name="roomType" required>
                                    <option value="Standard" ${reservation.roomType == 'Standard' ? 'selected' : ''}>Standard</option>
                                    <option value="Deluxe" ${reservation.roomType == 'Deluxe' ? 'selected' : ''}>Deluxe</option>
                                    <option value="Suite" ${reservation.roomType == 'Suite' ? 'selected' : ''}>Suite</option>
                                </select>
                            </div>

                            <!-- Nights -->
                            <div class="col-md-4">
                                <label class="form-label fw-semibold">
                                    <i class="fa-solid fa-moon me-1 text-primary"></i>Number of Nights
                                </label>
                                <input type="number" class="form-control rf-input" name="numberOfNights"
                                       value="${reservation.numberOfNights}" min="1" required>
                            </div>

                            <!-- Dates -->
                            <div class="col-md-4">
                                <label class="form-label fw-semibold">
                                    <i class="fa-solid fa-calendar-arrow-down me-1 text-success"></i>Check-In Date
                                </label>
                                <input type="date" class="form-control rf-input" name="checkInDate"
                                       id="checkInDate" value="${reservation.checkInDate}" required>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label fw-semibold">
                                    <i class="fa-solid fa-calendar-arrow-up me-1 text-danger"></i>Check-Out Date
                                </label>
                                <input type="date" class="form-control rf-input" name="checkOutDate"
                                       id="checkOutDate" value="${reservation.checkOutDate}" required>
                            </div>

                            <!-- Payment -->
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">
                                    <i class="fa-solid fa-credit-card me-1 text-primary"></i>Payment Status
                                </label>
                                <select class="form-select rf-input" name="paymentStatus" required>
                                    <option value="Paid" ${reservation.paymentStatus == 'Paid' ? 'selected' : ''}>Paid</option>
                                    <option value="Pending" ${reservation.paymentStatus == 'Pending' ? 'selected' : ''}>Pending</option>
                                </select>
                            </div>

                        </div>

                        <!-- Actions -->
                        <div class="d-flex gap-3 mt-4">
                            <button type="submit" class="btn rf-btn-update px-4">
                                <i class="fa-solid fa-floppy-disk me-2"></i>Update Reservation
                            </button>
                            <a href="/reservations" class="btn btn-outline-secondary px-4">
                                <i class="fa-solid fa-xmark me-2"></i>Cancel
                            </a>
                        </div>

                    </form>
                </div>
            </div>

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