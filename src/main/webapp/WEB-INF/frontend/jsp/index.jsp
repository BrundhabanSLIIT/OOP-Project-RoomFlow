<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>RoomFlow - Hotel Room Reservation System</title>

    <!-- Bootstrap 5 -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <!-- Font Awesome -->
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
      rel="stylesheet"
    />
    <!-- AOS Animations -->
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css"
      rel="stylesheet"
    />
    <!-- Custom CSS -->
    <link
      rel="stylesheet"
      href="<c:url value='/frontend/css/style.css?v=5' />"
    />
  </head>
  <body class="hero-body">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark rf-navbar">
      <div class="container">
        <a class="navbar-brand" href="/">
          <div class="rf-logo-icon"><i class="fa-solid fa-hotel"></i></div>
          RoomFlow
        </a>
        <button
          class="navbar-toggler border-0"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#mainNav"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mainNav">
          <ul class="navbar-nav ms-auto align-items-center gap-1">
            <li class="nav-item">
              <a class="nav-link active" href="/"
                ><i class="fa-solid fa-house me-1"></i>Home</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/reservations"
                ><i class="fa-solid fa-list me-1"></i>Reservations</a
              >
            </li>
            <div class="rf-nav-divider d-none d-lg-block"></div>
            <li class="nav-item">
              <a
                href="/reservations/add"
                class="btn btn-warning btn-sm fw-bold px-3"
              >
                <i class="fa-solid fa-plus me-1"></i>New Booking
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero-section">
      <div class="hero-overlay"></div>
      <div class="container position-relative z-1 text-center">
        <div class="hero-badge" data-aos="fade-down" data-aos-duration="600">
          <span class="badge-dot"></span>Premium Hotel Management System
        </div>

        <h1 class="hero-title mb-3" data-aos="fade-up" data-aos-delay="100">
          Welcome to <span class="highlight">RoomFlow</span>
        </h1>
        <p
          class="hero-subtitle mx-auto"
          data-aos="fade-up"
          data-aos-delay="180"
        >
          Streamline your hotel room reservations with ease, speed, and
          elegance.
        </p>

        <div
          class="row justify-content-center g-4 mb-5"
          data-aos="fade-up"
          data-aos-delay="260"
        >
          <div class="col-md-4 col-sm-6">
            <div class="stat-card">
              <div class="stat-card-icon"><i class="fa-solid fa-bed"></i></div>
              <div class="fw-bold fs-6 text-white">3 Room Types</div>
              <div class="small" style="color: rgba(255, 255, 255, 0.5)">
                Standard, Deluxe &amp; Suite
              </div>
            </div>
          </div>
          <div class="col-md-4 col-sm-6">
            <div class="stat-card">
              <div class="stat-card-icon">
                <i class="fa-solid fa-calendar-check"></i>
              </div>
              <div class="fw-bold fs-6 text-white">Easy Booking</div>
              <div class="small" style="color: rgba(255, 255, 255, 0.5)">
                Quick &amp; Simple Process
              </div>
            </div>
          </div>
          <div class="col-md-4 col-sm-6">
            <div class="stat-card">
              <div class="stat-card-icon">
                <i class="fa-solid fa-magnifying-glass"></i>
              </div>
              <div class="fw-bold fs-6 text-white">Smart Search</div>
              <div class="small" style="color: rgba(255, 255, 255, 0.5)">
                Find Any Reservation Fast
              </div>
            </div>
          </div>
        </div>

        <div
          class="d-flex flex-wrap justify-content-center gap-3"
          data-aos="zoom-in"
          data-aos-delay="340"
        >
          <a href="/reservations" class="hero-cta-secondary">
            <i class="fa-solid fa-list me-2"></i>View Reservations
          </a>
          <a href="/reservations/add" class="hero-cta-primary">
            <i class="fa-solid fa-plus me-2"></i>Add Reservation
          </a>
        </div>
      </div>
    </div>

    <!-- Footer -->
    <footer class="rf-footer">
      <div class="container">
        <div class="row g-5">
          <!-- Brand -->
          <div class="col-lg-4 col-md-6">
            <div class="rf-footer-brand">
              <div class="rf-logo-icon"><i class="fa-solid fa-hotel"></i></div>
              RoomFlow
            </div>
            <p>
              A modern hotel room reservation system built for simplicity,
              speed, and elegance. Manage bookings with ease.
            </p>
            <div class="rf-social-links">
              <a href="#" class="rf-social-link"
                ><i class="fab fa-facebook-f"></i
              ></a>
              <a href="#" class="rf-social-link"
                ><i class="fab fa-twitter"></i
              ></a>
              <a href="#" class="rf-social-link"
                ><i class="fab fa-instagram"></i
              ></a>
              <a href="#" class="rf-social-link"
                ><i class="fab fa-linkedin-in"></i
              ></a>
            </div>
          </div>

          <!-- Quick Links -->
          <div class="col-lg-2 col-md-6 col-6">
            <div class="rf-footer-heading">Quick Links</div>
            <ul class="rf-footer-links">
              <li>
                <a href="/"><i class="fa-solid fa-chevron-right"></i>Home</a>
              </li>
              <li>
                <a href="/reservations"
                  ><i class="fa-solid fa-chevron-right"></i>Reservations</a
                >
              </li>
              <li>
                <a href="/reservations/add"
                  ><i class="fa-solid fa-chevron-right"></i>New Booking</a
                >
              </li>
            </ul>
          </div>

          <!-- Room Types -->
          <div class="col-lg-2 col-md-6 col-6">
            <div class="rf-footer-heading">Room Types</div>
            <ul class="rf-footer-links">
              <li>
                <a href="#"
                  ><i class="fa-solid fa-chevron-right"></i>Standard</a
                >
              </li>
              <li>
                <a href="#"><i class="fa-solid fa-chevron-right"></i>Deluxe</a>
              </li>
              <li>
                <a href="#"><i class="fa-solid fa-chevron-right"></i>Suite</a>
              </li>
            </ul>
          </div>

          <!-- Contact -->
          <div class="col-lg-4 col-md-6">
            <div class="rf-footer-heading">Contact</div>
            <div class="rf-footer-contact-item">
              <div class="icon-wrap">
                <i class="fa-solid fa-location-dot"></i>
              </div>
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

        <!-- Bottom bar -->
        <div class="rf-footer-bottom">
          <div
            class="d-flex flex-wrap justify-content-between align-items-center gap-2"
          >
            <p class="rf-footer-bottom-text mb-0">
              &copy; 2026 <span>RoomFlow</span>. All rights reserved.
            </p>
            <p class="rf-footer-bottom-text mb-0">
              Built with
              <i
                class="fa-solid fa-heart"
                style="color: #f59e0b; font-size: 0.75rem"
              ></i>
              using Spring Boot &amp; Bootstrap 5
            </p>
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
