document.addEventListener("DOMContentLoaded", function () {
  /* ── AOS (Animate on Scroll) ── */
  if (typeof AOS !== "undefined") {
    AOS.init({
      duration: 550,
      once: true,
      easing: "ease-out-cubic",
      offset: 60,
    });
  }

  /* ── Navbar: add "scrolled" class on scroll ── */
  var navbar = document.querySelector(".rf-navbar");
  if (navbar) {
    var onScroll = function () {
      if (window.scrollY > 20) {
        navbar.classList.add("scrolled");
      } else {
        navbar.classList.remove("scrolled");
      }
    };
    window.addEventListener("scroll", onScroll, { passive: true });
    onScroll(); // run once on load
  }

  /* ── Mark active nav link ── */
  var path = window.location.pathname;
  document.querySelectorAll(".rf-navbar .nav-link").forEach(function (link) {
    var href = link.getAttribute("href") || "";
    if (href === path || (href !== "/" && path.startsWith(href))) {
      link.classList.add("active");
    }
  });

  /* ── Check-out date must be after check-in ── */
  var checkIn = document.getElementById("checkInDate");
  var checkOut = document.getElementById("checkOutDate");

  if (checkIn && checkOut) {
    checkIn.addEventListener("change", function () {
      checkOut.min = checkIn.value;
      if (checkOut.value && checkOut.value <= checkIn.value) {
        checkOut.value = "";
      }
    });
    // Set today as min for check-in on add form (if empty)
    if (!checkIn.value) {
      var today = new Date().toISOString().split("T")[0];
      checkIn.min = today;
    }
  }

  /* ── Form submit: loading state ── */
  document.querySelectorAll("#reservationForm").forEach(function (form) {
    form.addEventListener("submit", function () {
      var btn = form.querySelector("button[type='submit']");
      if (btn) {
        btn.disabled = true;
        var icon = btn.querySelector("i");
        if (icon) icon.className = "spinner-border spinner-border-sm me-2";
        btn.childNodes[btn.childNodes.length - 1].textContent = " Saving...";
      }
    });
  });

  /* ── Auto-dismiss alerts after 4 s ── */
  document.querySelectorAll(".alert").forEach(function (el) {
    setTimeout(function () {
      el.style.transition = "opacity 0.5s ease, transform 0.5s ease";
      el.style.opacity = "0";
      el.style.transform = "translateY(-8px)";
      setTimeout(function () {
        el.remove();
      }, 500);
    }, 4000);
  });

  /* ── Table row stagger animation ── */
  document.querySelectorAll(".rf-table-row").forEach(function (row, i) {
    row.style.animationDelay = i * 35 + "ms";
    row.style.animation = "rf-fadeIn 0.35s ease both";
  });

  /* ── Smooth page exit transition on link clicks ── */
  document.querySelectorAll("a[href]").forEach(function (link) {
    var href = link.getAttribute("href");
    if (
      !href ||
      href.startsWith("#") ||
      href.startsWith("javascript") ||
      link.getAttribute("onclick") ||
      link.target === "_blank"
    )
      return;
    link.addEventListener("click", function (e) {
      var isInternal = href.startsWith("/") || href.startsWith(".");
      if (isInternal) {
        e.preventDefault();
        document.body.style.transition = "opacity 0.2s ease";
        document.body.style.opacity = "0";
        setTimeout(function () {
          window.location.href = href;
        }, 200);
      }
    });
  });
});
