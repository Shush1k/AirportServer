package server.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
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
    @GetMapping("/all")
    public ResponseEntity<List<FlightEntity>> getFlights() {
        List<FlightEntity> flights = flightService.getAllFlights();
        return new ResponseEntity<>(flights, HttpStatus.OK);
    }
// TODO: настроить связи между таблицами, без связей методы работают корректно

    /**
     * Найти все рейсы между датами
     * фильтрация по датам
     *
     * @param dateFilter - сущность дат
     * @return список рейсов
     */
//    @GetMapping("/dates")
//    public ResponseEntity<List<FlightEntity>> getFlightsByDates(@RequestBody DateFilter dateFilter) {
//        List<FlightEntity> flights = flightService.getFlightsBetweenDates(dateFilter.getStartDate(), dateFilter.getEndDate(), dateFilter.getIsArrive());
//        return new ResponseEntity<>(flights, HttpStatus.OK);
//    }
    @GetMapping("/dates")
    public ResponseEntity<List<FlightEntity>> getFlightsByDates(@RequestParam(name = "startDate") String startDate,
                                                                @RequestParam(name = "endDate") String endDate,
                                                                @RequestParam(name = "isArrive") boolean isArrive) {
        List<FlightEntity> flights = flightService.getFlightsBetweenDates(startDate, endDate, isArrive);
        if (flights == null)
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        return new ResponseEntity<>(flights, HttpStatus.OK);
    }
}
