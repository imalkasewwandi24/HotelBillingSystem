package com.hotelbillingsystem.services;

import com.hotelbillingsystem.models.Room;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

public class RoomServiceTest {

    private RoomService roomService;

    @Before
    public void setup() {
        roomService = new RoomService();
    }

    // Test get all rooms
    @Test
    public void testGetAllRooms() {
        List<Room> rooms = roomService.getAllRooms();

        Assert.assertNotNull(rooms);
        Assert.assertTrue(rooms.size() > 0);

        System.out.println("Total rooms fetched: " + rooms.size());
        for (Room room : rooms) {
            System.out.println("ID: " + room.getRoomId() +
                    ", Code: " + room.getRoomCode() +
                    ", Name: " + room.getRoomName() +
                    ", Status: " + room.getRoomStatus());
        }
    }

    // Test get room by ID
    @Test
    public void testGetRoomById() {
        Room room = roomService.getRoomById(2);

        Assert.assertNotNull(room);

        System.out.println("Fetched room by ID:");
        System.out.println("ID: " + room.getRoomId());
        System.out.println("Code: " + room.getRoomCode());
        System.out.println("Name: " + room.getRoomName());
        System.out.println("Price: " + room.getPricePerNight());
        System.out.println("Status: " + room.getRoomStatus());
    }

    // Test search rooms
    @Test
    public void testSearchRooms() {
        String keyword = "Deluxe";
        List<Room> rooms = roomService.searchRooms(keyword);

        Assert.assertNotNull(rooms);
        Assert.assertTrue(rooms.size() > 0);

        System.out.println("Rooms found for keyword \"" + keyword + "\":");
        for (Room r : rooms) {
            System.out.println("ID: " + r.getRoomId() +
                    ", Code: " + r.getRoomCode() +
                    ", Name: " + r.getRoomName() +
                    ", Status: " + r.getRoomStatus());
        }
    }
    @Test
    public void testAddRoom() {
        Room room = new Room();
        room.setRoomCode("TEST101");
        room.setRoomName("Test Room");
        room.setPricePerNight(5000);
        room.setRoomStatus("Available");
        room.setDescription("This is a test room");

        Assert.assertTrue(roomService.addRoom(room));
    }

    @Test
    public void testUpdateRoom() {
        Room room = roomService.getRoomById(13);
        room.setRoomName("Updated Name");
        room.setPricePerNight(6000);

        roomService.updateRoom(room);

        Room updated = roomService.getRoomById(13);
        Assert.assertEquals("Updated Name", updated.getRoomName());
        Assert.assertEquals(6000, updated.getPricePerNight(), 0.01);
    }

    @Test
    public void testDeleteRoomById() {
        int roomIdToDelete = 13;

        roomService.deleteRoom(roomIdToDelete);

        Room deleted = roomService.getRoomById(roomIdToDelete);
        Assert.assertNull(deleted);
    }
}