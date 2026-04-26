package com.example.roomflow.backend.controller;

import com.example.roomflow.backend.model.Reservation;
import com.example.roomflow.backend.service.ReservationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ReservationController {

    private final ReservationService reservationService;

    public ReservationController(ReservationService reservationService) {
        this.reservationService = reservationService;
    }

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @GetMapping("/reservations")
    public String viewReservations(@RequestParam(value = "keyword", required = false) String keyword,
                                   Model model) {
        List<Reservation> reservations = reservationService.searchReservations(keyword);
        model.addAttribute("reservations", reservations);
        model.addAttribute("keyword", keyword);
        return "view-reservations";
    }

    @GetMapping("/reservations/add")
    public String addForm(Model model) {
        model.addAttribute("reservation", new Reservation());
        return "add-reservation";
    }

    @PostMapping("/reservations/add")
    public String addReservation(@ModelAttribute Reservation reservation, Model model) {
        String error = reservationService.validateReservation(reservation);

        if (error != null) {
            model.addAttribute("error", error);
            model.addAttribute("reservation", reservation);
            return "add-reservation";
        }

        reservationService.addReservation(reservation);
        return "redirect:/reservations";
    }

    @GetMapping("/reservations/edit/{id}")
    public String editForm(@PathVariable String id, Model model) {
        Reservation reservation = reservationService.getReservationById(id);

        if (reservation == null) {
            return "redirect:/reservations";
        }

        model.addAttribute("reservation", reservation);
        return "edit-reservation";
    }

    @PostMapping("/reservations/update")
    public String updateReservation(@ModelAttribute Reservation reservation, Model model) {
        String error = reservationService.validateReservation(reservation);

        if (error != null) {
            model.addAttribute("error", error);
            model.addAttribute("reservation", reservation);
            return "edit-reservation";
        }

        reservationService.updateReservation(reservation);
        return "redirect:/reservations";
    }

    @GetMapping("/reservations/delete/{id}")
    public String deleteReservation(@PathVariable String id) {
        reservationService.deleteReservation(id);
        return "redirect:/reservations";
    }
}