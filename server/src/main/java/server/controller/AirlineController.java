package server.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import server.repository.AirlineRepository;
import server.repository.FlightRepository;



@RestController
@RequestMapping("/airlines")
public class AirlineController {

    @Autowired
    private AirlineRepository airlineRepo;


}