package server.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import server.repository.FlightRepository;

@RestController
@RequestMapping("/flights")
public class FlightController {

    private final FlightRepository flightRepo;


    public FlightController(FlightRepository flightRepo) {
        this.flightRepo = flightRepo;
    }
}
