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

/**
 * Класс контроллер Авиакомпаний
 */
@RestController
@RequestMapping("/airlines")
public class AirlineController {

    private final AirlineService airlineService;

    public AirlineController(AirlineService airlineService) {
        this.airlineService = airlineService;
    }


    /**
     * Получить информацию о всех авиакомпаниях и отсортировать
     *
     * @param filter вид сортировки
     * @return список авиакомпании
     */
    @GetMapping("/all")
    public ResponseEntity<List<AirlineEntity>> getAirlines(@RequestParam(name = "filter") boolean filter) {
        List<AirlineEntity> airlines = airlineService.getAllAirlines(filter);
        return new ResponseEntity<>(airlines, HttpStatus.OK);
    }


    /**
     * Получить информацию о всех авиакомпаниях по имени авиакомпании и отсортировать их
     *
     * @param companyName имя авиакомпании
     * @param filter      вид сортировки
     * @return список авиакомпании
     */
    @GetMapping("/like")
    public ResponseEntity<List<AirlineEntity>> getAirlinesByName(@RequestParam(name = "name") String companyName,
                                                                 @RequestParam(name = "filter") boolean filter) {
        List<AirlineEntity> airlines = airlineService.getAirlinesByName(companyName, filter);
        return new ResponseEntity<>(airlines, HttpStatus.OK);
    }
}