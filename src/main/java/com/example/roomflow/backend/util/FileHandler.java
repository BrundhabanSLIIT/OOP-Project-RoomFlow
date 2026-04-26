package com.example.roomflow.backend.util;

import com.example.roomflow.backend.model.Reservation;
import org.springframework.stereotype.Component;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Component
public class FileHandler {

    private static final String FILE_PATH = "src/main/resources/data/reservations.txt";

    public List<Reservation> readReservations() {
        List<Reservation> reservations = new ArrayList<>();
        File file = new File(FILE_PATH);

        if (!file.exists()) {
            return reservations;
        }

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {

            String line;

            while ((line = br.readLine()) != null) {
                if (line.trim().isEmpty()) continue;

                String[] data = line.split(",");

                if (data.length == 10) {
                    Reservation r = new Reservation(
                            data[0], data[1], data[2], data[3],
                            data[4], data[5], Integer.parseInt(data[6]),
                            data[7], data[8], data[9]
                    );
                    reservations.add(r);
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return reservations;
    }

    public void writeReservations(List<Reservation> reservations) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {

            for (Reservation r : reservations) {
                bw.write(r.toFileString());
                bw.newLine();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}