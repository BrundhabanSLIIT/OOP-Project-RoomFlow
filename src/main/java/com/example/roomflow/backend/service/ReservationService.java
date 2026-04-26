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
        List<Reservation> allReservations = fileHandler.readReservations();

        if (keyword == null || keyword.trim().isEmpty()) {
            return allReservations;
        }

        String search = keyword.trim().toLowerCase().replace("-", "");
        List<Reservation> results = new ArrayList<>();

        for (Reservation r : allReservations) {
            String reservationId = safe(r.getReservationId()).replace("-", "");
            String customerName = safe(r.getCustomerName());
            String contactNumber = safe(r.getContactNumber());
            String roomId = safe(r.getRoomId());
            String roomType = safe(r.getRoomType());
            String paymentStatus = safe(r.getPaymentStatus());
            String checkInDate = safe(r.getCheckInDate());
            String checkOutDate = safe(r.getCheckOutDate());
            String nights = String.valueOf(r.getNumberOfNights());
            String totalCost = String.valueOf(r.getTotalCost());

            if (reservationId.contains(search)
                    || customerName.contains(search)
                    || contactNumber.contains(search)
                    || roomId.contains(search)
                    || roomType.contains(search)
                    || paymentStatus.contains(search)
                    || checkInDate.contains(search)
                    || checkOutDate.contains(search)
                    || nights.contains(search)
                    || totalCost.contains(search)) {
                results.add(r);
            }
        }

        return results;
    }

    private String safe(String value) {
        return value == null ? "" : value.toLowerCase();
    }

    public String validateReservation(Reservation reservation) {
        if (reservation.getContactNumber() == null || !reservation.getContactNumber().matches("\\d{10}")) {
            return "Contact number must contain exactly 10 digits only.";
        }

        LocalDate checkInDate = LocalDate.parse(reservation.getCheckInDate());
        LocalDate checkOutDate = LocalDate.parse(reservation.getCheckOutDate());

        if (!checkOutDate.isAfter(checkInDate)) {
            return "Check-out date must be after check-in date.";
        }

        if (reservation.getNumberOfNights() <= 0) {
            return "Number of nights must be greater than 0.";
        }

        return null;
    }

    public void addReservation(Reservation reservation) {
        List<Reservation> reservations = fileHandler.readReservations();
        reservations.add(reservation);
        fileHandler.writeReservations(reservations);
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
        List<Reservation> reservations = fileHandler.readReservations();

        for (int i = 0; i < reservations.size(); i++) {
            if (reservations.get(i).getReservationId().equalsIgnoreCase(updatedReservation.getReservationId())) {
                reservations.set(i, updatedReservation);
                break;
            }
        }

        fileHandler.writeReservations(reservations);
    }

    public void deleteReservation(String id) {
        List<Reservation> reservations = fileHandler.readReservations();
        reservations.removeIf(r -> r.getReservationId().equalsIgnoreCase(id));
        fileHandler.writeReservations(reservations);
    }
}