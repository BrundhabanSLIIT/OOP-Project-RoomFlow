package com.example.roomflow.backend.model;

public class DeluxeRoom extends Room {

    public DeluxeRoom(String roomId){
        super(roomId, "Deluxe", 8000.00);
    }

    @Override
    public double calculateTotalCost(int numberOfNights) {
        return getPricePerNight() * numberOfNights;
    }
}