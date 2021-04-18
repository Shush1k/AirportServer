package server.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import server.entity.AirlineEntity;
import server.service.AirlineService;

import java.util.List;


@RestController
@RequestMapping("/airlines")
public class AirlineController {

    private final AirlineService airlineService;

    public AirlineController(AirlineService airlineService) {
        this.airlineService = airlineService;
    }


    /**
     * Вывод информации о всех авиакомпаниях
     *
     * @return - список авиакомпании
     */
    @GetMapping("/all")
    public ResponseEntity<List<AirlineEntity>> getAirlines() {
        List<AirlineEntity> airlines = airlineService.getAllAirlines();
        return new ResponseEntity<>(airlines, HttpStatus.OK);
    }


    /**
     * Вывод информации об авиакомпаниях по имени
     *
     * @param companyName - имя авиакомпании
     * @return - список авиакомпании
     */
//   example /airlines/like?name=s7
    @GetMapping("/like")
    public ResponseEntity<List<AirlineEntity>> getAirlinesByName(@RequestParam(name = "name") String companyName) {
        List<AirlineEntity> airlines = airlineService.getAirlinesByName(companyName);
        return new ResponseEntity<>(airlines, HttpStatus.OK);
    }

}