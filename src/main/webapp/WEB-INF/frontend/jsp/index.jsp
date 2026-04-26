<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<link rel="stylesheet" href="<c:url value='/frontend/css/style.css?v=4' />">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewpoint" content="width=device-width, initial-scale=1.0">
    <title>RoomFlow - Hotel Room Reservation System</title>
    <link rel="stylesheet" href="/frontend/css/style/css">
</head>
<body>
<div class="container center-box">
    <div class="card home-card">
        <h1>RoomFlow</h1>
        <p class="subtitle">Hotel Room Reservation System</p>
        <div class="button-group">
            <a href="/reservations" class="btn btn-primary">View Reservation</a>
            <a href="/reservations/add" class="btn btn-success">Add Reservation</a>
        </div>
    </div>
</div>
</body>
</html>