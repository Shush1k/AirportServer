package server.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import server.dto.DateFilter;
import server.entity.FlightEntity;
import server.service.FlightService;

import java.util.List;

@RestController
@RequestMapping("/flights")
public class FlightController {

    private final FlightService flightService;

    public FlightController(FlightService flightService) {
        this.flightService = flightService;
    }

    /**
     * Вывод информации о всех рейсах
     *
     * @return ResponseEntity
     */
//    Сейчас работает не корректно
    @GetMapping("/all")
    public ResponseEntity getFlights() {
        List<FlightEntity> flights = flightService.getAllFlights();
        return new ResponseEntity(flights, HttpStatus.OK);
    }

    /**
     * Найти все рейсы между датами
     * фильтрация по датам
     * @param dateFilter - сущность дат
     * @return список рейсов
     */
    @GetMapping("/dates")
    public ResponseEntity getFlightsByDates(@RequestBody DateFilter dateFilter){
        List<FlightEntity> flights = flightService.getFlightsBetweenDates(dateFilter.getStartDate(), dateFilter.getEndDate());
        return new ResponseEntity(flights, HttpStatus.OK);
    }
    
}
