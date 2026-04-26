package com.example.roomflow.backend.model;

public abstract class Room{
    private String roomId;
    private String roomType;
    private double pricePerNight;

    public Room(String soomId, String roomType, double pricePerNight){
        this.roomId = roomId;
        this.roomType = roomType;
        this.pricePerNight = pricePerNight;
    }

    public String getRoomId(){

        return roomId;
    }

    public String getRoomType() {

        return roomType;
    }

    public double getPricePerNight() {

        return pricePerNight;
    }

    public void setRoomId(String roomId) {

        this.roomId = roomId;
    }

    public void setRoomType(String roomType) {

        this.roomType = roomType;
    }

    public void setPricePerNight(double pricePerNight) {

        this.pricePerNight = pricePerNight;
    }

    public abstract double calculateTotalCost(int numberOfNights);
}