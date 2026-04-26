package com.example.roomflow.backend.model;

public class Reservation {
    private String reservationId;
    private String customerId;
    private String customerName;
    private String contactNumber;
    private String roomId;
    private String roomType;
    private int numberOfNights;
    private String checkInDate;
    private String checkOutDate;
    private String paymentStatus;

    public Reservation() {}

    public Reservation(String reservationId, String customerId, String customerName, String contactNumber,
                       String roomId, String roomType, int numberOfNights,
                       String checkInDate, String checkOutDate, String paymentStatus) {
        this.reservationId = reservationId;
        this.customerId = customerId;
        this.customerName = customerName;
        this.contactNumber = contactNumber;
        this.roomId = roomId;
        this.roomType = roomType;
        this.numberOfNights = numberOfNights;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.paymentStatus = paymentStatus;
    }

    public String getReservationId() { return reservationId; }
    public String getCustomerId() { return customerId; }
    public String getCustomerName() { return customerName; }
    public String getContactNumber() { return contactNumber; }
    public String getRoomId() { return roomId; }
    public String getRoomType() { return roomType; }
    public int getNumberOfNights() { return numberOfNights; }
    public String getCheckInDate() { return checkInDate; }
    public String getCheckOutDate() { return checkOutDate; }
    public String getPaymentStatus() { return paymentStatus; }

    public void setReservationId(String reservationId) { this.reservationId = reservationId; }
    public void setCustomerId(String customerId) { this.customerId = customerId; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }
    public void setContactNumber(String contactNumber) { this.contactNumber = contactNumber; }
    public void setRoomId(String roomId) { this.roomId = roomId; }
    public void setRoomType(String roomType) { this.roomType = roomType; }
    public void setNumberOfNights(int numberOfNights) { this.numberOfNights = numberOfNights; }
    public void setCheckInDate(String checkInDate) { this.checkInDate = checkInDate; }
    public void setCheckOutDate(String checkOutDate) { this.checkOutDate = checkOutDate; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }

    public String toFileString() {
        return reservationId + "," +
                customerId + "," +
                customerName + "," +
                contactNumber + "," +
                roomId + "," +
                roomType + "," +
                numberOfNights + "," +
                checkInDate + "," +
                checkOutDate + "," +
                paymentStatus;
    }

    public double getTotalCost() {
        double price;

        switch (roomType.toLowerCase()) {
            case "deluxe":
                price = 8000;
                break;
            case "suite":
                price = 12000;
                break;
            default:
                price = 5000;
                break;
        }

        return price * numberOfNights;
    }
}