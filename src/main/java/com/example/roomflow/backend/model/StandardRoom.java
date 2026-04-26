package com.example.roomflow.backend.model;

public class StandardRoom extends Room{

    public StandardRoom(String roomId){
        super(roomId, "Standard", 5000.00);
    }

    @Override
    public double calculateTotalCost(int numberOfNights){
        return getPricePerNight() * numberOfNights;
    }
}

