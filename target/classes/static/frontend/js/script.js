document.addEventListener("DOMContentLoaded", function () {
    const checkIn = document.getElementById("checkInDate");
    const checkOut = document.getElementById("checkOutDate");

    if (checkIn && checkOut) {
        checkIn.addEventListener("change", function () {
            checkOut.min = checkIn.value;
        });

        checkOut.addEventListener("change", function () {
            if (checkIn.value && checkOut.value <= checkIn.value) {
                alert("Check-out date must be after check-in date.");
                checkOut.value = "";
            }
        });
    }
});