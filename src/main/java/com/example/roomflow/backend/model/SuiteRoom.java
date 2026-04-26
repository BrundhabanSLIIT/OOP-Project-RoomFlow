package com.example.roomflow.backend.model;

public class SuiteRoom extends Room {

    public SuiteRoom(String roomId){
        super(roomId, "Suite", 12000.00);
    }

    @Override
    public double calculateTotalCost(int numberOfNights) {
        return (getPricePerNight() * numberOfNights) * 1.10;
    }
}

