package server.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.entity.FlightEntity;
import server.repository.FlightRepository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;

/**
 * Логика работы с сущностью Рейсы
 */
@Service
public class FlightService {
    private final String PATTERN = "yyyy-MM-dd HH:mm";
    private final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern(PATTERN);

    private final FlightRepository flightRepo;

    public FlightService(FlightRepository flightRepo) {
        this.flightRepo = flightRepo;
    }

    /**
     * Найти все прибывающие/вылетающие рейсы по типу рейса и полю поиска, за промежуток времени
     * вчера-завтра
     *
     * @param search  поиск по номеру рейса или городу прибытия/отправления
     * @param arrival true если прибывающий рейс, иначе вылетающий
     * @return список рейсов
     */
    @Transactional(readOnly = true)
    public List<FlightEntity> getAllFlightsBySearchText(String search, boolean arrival) {
        LocalDate today = LocalDate.now();

        LocalDateTime yesterdayTime = today.minusDays(1).atTime(00, 00, 00);
        LocalDateTime tomorrowTime = today.plusDays(1).atTime(23, 59, 59);

        if (arrival) {
            return flightRepo.findArrivalFlightsBySearchAndArrivalDateBetween('%' + search + '%', yesterdayTime, tomorrowTime, "прилет");
        } else {
            return flightRepo.findDepartureFlightsBySearchAndDepartureDateBetween('%' + search + '%', yesterdayTime, tomorrowTime, "вылет");
        }
    }

    /**
     * Найти все прибывающие/вылетающие рейсы по типу рейса и полю поиска за указанный промежуток времени
     *
     * @param search          поиск по номеру рейса или городу прибытия/отправления
     * @param startStringDate начальная дата
     * @param endStringDate   конечная дата
     * @param arrival         true если прибывающий рейс, иначе вылетающий
     * @return список рейсов
     */
    @Transactional
    public List<FlightEntity> getFlightsBySearchBetweenDates(String search, String startStringDate, String endStringDate, boolean arrival) {

        LocalDateTime endDate;
        LocalDateTime startDate;
        try {
            endDate = LocalDateTime.parse(endStringDate, FORMATTER);
            startDate = LocalDateTime.parse(startStringDate, FORMATTER);
        } catch (DateTimeParseException e) {
            return null;
        }
        if (arrival) {
            return flightRepo.findArrivalFlightsBySearchAndArrivalDateBetween('%' + search + '%', startDate, endDate, "прилет");
        } else {
            return flightRepo.findDepartureFlightsBySearchAndDepartureDateBetween('%' + search + '%', startDate, endDate, "вылет");
        }
    }
}
