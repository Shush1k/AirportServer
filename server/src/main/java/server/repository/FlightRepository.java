package server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import server.entity.FlightEntity;

import java.time.LocalDateTime;
import java.util.List;

/**
 * Репозиторий Рейсов
 */
@Repository
public interface FlightRepository extends JpaRepository<FlightEntity, Long> {

// Пока пусть будет, как аналог
//    @Query(value = "select * from flights f where f.arrival_date >= :startDate AND f.arrival_date <= :endDate", nativeQuery = true)
//    List<FlightEntity> findArrivalFlightsBetweenDates(Date startDate, Date endDate);

    /**
     * Найти прибывающие рейсы между датами
     *
     * @param startDate начальная дата
     * @param endDate   конечная дата
     * @return список рейсов
     */
    List<FlightEntity> findFlightEntityByArrivalDateBetween(LocalDateTime startDate, LocalDateTime endDate);

    /**
     * Найти отправляющиеся рейсы между датами
     *
     * @param startDate начальная дата
     * @param endDate   конечная дата
     * @return список рейсов
     */
    List<FlightEntity> findFlightEntityByDepartureDateBetween(LocalDateTime startDate, LocalDateTime endDate);
}
