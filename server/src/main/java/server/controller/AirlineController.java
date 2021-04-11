package server.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import server.repository.AirlineRepository;




@RestController
@RequestMapping("/airlines")
public class AirlineController {

    private final AirlineRepository airlineRepo;


    public AirlineController(AirlineRepository airlineRepo) {
        this.airlineRepo = airlineRepo;
    }
}