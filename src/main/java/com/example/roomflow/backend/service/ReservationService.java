package com.example.roomflow.backend.service;

import com.example.roomflow.backend.model.Reservation;
import com.example.roomflow.backend.util.FileHandler;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service
public class ReservationService {

    private final FileHandler fileHandler;

    public ReservationService(FileHandler fileHandler) {
        this.fileHandler = fileHandler;
    }

    public List<Reservation> getAllReservations() {
        return fileHandler.readReservations();
    }

    public List<Reservation> searchReservations(String keyword) {
        List<Reservation> reservations = fileHandler.readReservations();

        if (keyword == null || keyword.trim().isEmpty()) {
            return reservations;
        }

        String searchText = keyword.toLowerCase();
        List<Reservation> results = new ArrayList<>();

        for (Reservation r : reservations) {
            if (r.getReservationId().toLowerCase().contains(searchText)
                    || r.getCustomerName().toLowerCase().contains(searchText)
                    || r.getContactNumber().toLowerCase().contains(searchText)
                    || r.getRoomId().toLowerCase().contains(searchText)
                    || r.getRoomType().toLowerCase().contains(searchText)
                    || r.getPaymentStatus().toLowerCase().contains(searchText)) {
                results.add(r);
            }
        }

        return results;
    }

    public String validateReservation(Reservation reservation) {
        if (!reservation.getContactNumber().matches("\\d{10}")) {
            return "Contact number must contain exactly 10 digits and no other characters.";
        }

        LocalDate checkIn = LocalDate.parse(reservation.getCheckInDate());
        LocalDate checkOut = LocalDate.parse(reservation.getCheckOutDate());

        if (!checkOut.isAfter(checkIn)) {
            return "Check-out date must be after check-in date.";
        }

        if (reservation.getNumberOfNights() <= 0) {
            return "Number of nights must be greater than 0.";
        }

        return null;
    }

    public void addReservation(Reservation reservation) {
        List<Reservation> list = fileHandler.readReservations();
        list.add(reservation);
        fileHandler.writeReservations(list);
    }

    public Reservation getReservationById(String id) {
        for (Reservation r : fileHandler.readReservations()) {
            if (r.getReservationId().equalsIgnoreCase(id)) {
                return r;
            }
        }
        return null;
    }

    public void updateReservation(Reservation updatedReservation) {
        List<Reservation> list = fileHandler.readReservations();

        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getReservationId().equalsIgnoreCase(updatedReservation.getReservationId())) {
                list.set(i, updatedReservation);
                break;
            }
        }

        fileHandler.writeReservations(list);
    }

    public void deleteReservation(String id) {
        List<Reservation> list = fileHandler.readReservations();
        list.removeIf(r -> r.getReservationId().equalsIgnoreCase(id));
        fileHandler.writeReservations(list);
    }
}