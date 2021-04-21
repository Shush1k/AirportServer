package server.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.entity.FlightEntity;
import server.repository.FlightRepository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Date;
import java.util.List;

/**
 * Логика работы с сущностью Рейсы
 */
@Service
public class FlightService {


    private final FlightRepository flightRepo;

    public FlightService(FlightRepository flightRepo) {
        this.flightRepo = flightRepo;
    }

    /**
     * Найти все рейсы
     *
     * @return список рейсов
     */
    @Transactional(readOnly = true)
    public List<FlightEntity> getAllFlights() {
        return flightRepo.findAll();
    }

    /**
     * Найти все рейсы по дате прибытия/отправления между датами
     *
     * @return список рейсов
     */
    @Transactional(readOnly = true)
    public List<FlightEntity> getFlightsBetweenDates(String startStringDate, String endStringDate, boolean arrival) {


        String format = "yyyy-MM-dd HH:mm";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(format);
        LocalDateTime endDate = null;
        LocalDateTime startDate = null;
        try {
            endDate = LocalDateTime.parse(endStringDate, formatter);
            startDate = LocalDateTime.parse(startStringDate, formatter);
        } catch (DateTimeParseException e){
            return null;
        }

        if (arrival) {
            return flightRepo.findFlightEntityByArrivalDateBetween(startDate, endDate);
        } else {
            return flightRepo.findFlightEntityByDepartureDateBetween(startDate, endDate);
        }

    }
}
