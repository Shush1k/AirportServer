package server.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.entity.FlightEntity;
import server.repository.FlightRepository;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
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
     * Найти все рейсы по типу рейса
     *
     * @param arrival true если прибывающий рейс, иначе вылетающий
     * @return список рейсов
     */
    @Transactional(readOnly = true)
    public List<FlightEntity> getAllFlights(boolean arrival) {

        if (arrival) {
            return flightRepo.findFlightEntitiesByType("прилет");
        } else {
            return flightRepo.findFlightEntitiesByType("вылет");
        }
    }

    /**
     * Найти все рейсы между датами по типу рейса
     *
     * @param startStringDate начальная дата
     * @param endStringDate   конечная дата
     * @param arrival         true если прибывающий рейс, иначе вылетающий
     * @return список рейсов
     */
    @Transactional(readOnly = true)
    public List<FlightEntity> getFlightsBetweenDates(String startStringDate, String endStringDate, boolean arrival) {


        String format = "yyyy-MM-dd HH:mm";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(format);
        LocalDateTime endDate;
        LocalDateTime startDate;
        try {
            endDate = LocalDateTime.parse(endStringDate, formatter);
            startDate = LocalDateTime.parse(startStringDate, formatter);
        } catch (DateTimeParseException e) {
            return null;
        }

        if (arrival) {
            return flightRepo.findFlightEntitiesByTypeAndArrivalDateBetween("прилет", startDate, endDate);
        } else {
            return flightRepo.findFlightEntitiesByTypeAndDepartureDateBetween("вылет", startDate, endDate);
        }

    }
}
