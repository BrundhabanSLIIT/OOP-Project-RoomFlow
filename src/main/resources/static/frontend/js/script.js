document.addEventListener("DOMContentLoaded", function (){
    const form = document.quarySelectorAll("form");

    form.forEach(from -> {
        form.addEventListener("submit", function(){
            console.log("Form submitted successfully.");
        });
    });
});