package server.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.entity.FlightEntity;
import server.repository.FlightRepository;

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
     * Найти все рейсы между датами
     * @return список рейсов
     */
    @Transactional(readOnly = true)
    public List<FlightEntity> getFlightsBetweenDates(Date startDate, Date endDate) {
        return flightRepo.findFlightsBetweenDates(startDate, endDate);
    }
}
