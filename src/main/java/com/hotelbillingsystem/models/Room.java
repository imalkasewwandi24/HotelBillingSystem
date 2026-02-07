package com.hotelbillingsystem.models;

public class Room {
    private int roomId;
    private String roomCode;
    private String roomName;
    private String description;
    private double pricePerNight;
    private int numberOfRooms;
    private int maxGuests;
    private String roomStatus;

    public int getRoomId() { return roomId;}
    public void setRoomId(int roomId) { this.roomId = roomId;}

    public String getRoomCode() { return roomCode;}
    public void setRoomCode(String roomCode) { this.roomCode = roomCode;}

    public String getRoomName() { return roomName;}
    public void setRoomName(String roomName) { this.roomName = roomName;}

    public String getDescription() { return description;}
    public void setDescription(String description) { this.description = description;}

    public double getPricePerNight() { return pricePerNight;}
    public void setPricePerNight(double pricePerNight) { this.pricePerNight = pricePerNight;}

    public int getNumberOfRooms() { return numberOfRooms;}
    public void setNumberOfRooms(int numberOfRooms) { this.numberOfRooms = numberOfRooms;}

    public int getMaxGuests() { return maxGuests;}
    public void setMaxGuests(int maxGuests) { this.maxGuests = maxGuests;}

    public String getRoomStatus() { return roomStatus;}
    public void setRoomStatus(String roomStatus) { this.roomStatus = roomStatus;}
}
