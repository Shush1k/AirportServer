package server.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import server.repository.FlightRepository;
import server.repository.UserRepository;

@RestController
@RequestMapping("/flights")
public class FlightController {

    @Autowired
    private FlightRepository flightRepo;


}
