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

/**
 * Класс контроллер Рейсов
 */
@RestController
@RequestMapping("/flights")
public class FlightController {


    private final FlightService flightService;

    public FlightController(FlightService flightService) {
        this.flightService = flightService;
    }

    /**
     * Получить все рейсы по полю поиска (номер рейса/город) и типу рейса за промежуток времени
     * вчера-завтра
     *
     * @param searchText поле поиска
     * @param isArrive   true если рейс прибывающие, иначе вылетающий
     * @return ResponseEntity со списком рейсов
     */
    @GetMapping("/all")

    public ResponseEntity<List<FlightEntity>> getFlights(@RequestParam(name = "searchText") String searchText,
                                                         @RequestParam(name = "isArrive") boolean isArrive) {
        List<FlightEntity> flights = flightService.getAllFlightsBySearchText(searchText, isArrive);
        return new ResponseEntity<>(flights, HttpStatus.OK);
    }

    /**
     * Получить все рейсы по полю поиска (номер рейса/город) между датами по типу рейса
     *
     * @param startDate поле поиска
     * @param startDate начальная дата
     * @param endDate   конечная дата
     * @param isArrive  true если рейс прибывающие, иначе вылетающий
     * @return ResponseEntity со списком рейсов
     */
    @GetMapping("/dates")
    public ResponseEntity<List<FlightEntity>> getFlightsBySearchTextBetweenDates(@RequestParam(name = "searchText") String searchText,
                                                                                 @RequestParam(name = "startDate") String startDate,
                                                                                 @RequestParam(name = "endDate") String endDate,
                                                                                 @RequestParam(name = "isArrive") boolean isArrive
    ) {
        List<FlightEntity> flights = flightService.getFlightsBySearchBetweenDates(searchText, startDate, endDate, isArrive);
        if (flights == null)
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        return new ResponseEntity<>(flights, HttpStatus.OK);
    }
}
