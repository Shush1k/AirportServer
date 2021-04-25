package server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
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


    /**
     * Найти прилетающие рейсы между датами прилета
     *
     * @param type      тип рейса
     * @param startDate начальная дата
     * @param endDate   конечная дата
     * @return список рейсов
     */
    List<FlightEntity> findFlightEntitiesByTypeAndArrivalDateBetween(String type, LocalDateTime startDate, LocalDateTime endDate);

    /**
     * Найти отправляющиеся рейсы между датами вылета
     *
     * @param type      тип рейса
     * @param startDate начальная дата
     * @param endDate   конечная дата
     * @return список рейсов
     */
    List<FlightEntity> findFlightEntitiesByTypeAndDepartureDateBetween(String type, LocalDateTime startDate, LocalDateTime endDate);

    /**
     * Найти все рейсы по типу рейса
     *
     * @param type тип рейса
     * @return список рейсов
     */
    List<FlightEntity> findFlightEntitiesByType(String type);

    /**
     * Найти все прибывающие рейсы по типу рейса и полю поиска, за указанный промежуток времени
     *
     * @param search    поле поиска по номеру рейса или городу отправления
     * @param startDate начальная дата
     * @param endDate   конечная дата
     * @param type      тип рейса
     * @return список рейсов
     */
    @Query(value = "select * from flights f join routes r using(route_id) " +
            "where f.type = :type and (f.flight_number like :search or r.departure_city like :search) and " +
            "(f.arrival_date >= :startDate and f.arrival_date <= :endDate)", nativeQuery = true)
    List<FlightEntity> findArrivalFlightsBySearchAndArrivalDateBetween(String search, LocalDateTime startDate, LocalDateTime endDate, String type);

    /**
     * Найти все вылетающие рейсы по типу рейса и полю поиска, за указанный промежуток времени
     *
     * @param search    поле поиска по номеру рейса или городу прибытия
     * @param startDate начальная дата
     * @param endDate   конечная дата
     * @param type      тип рейса
     * @return список рейсов
     */
    @Query(value = "select * from flights f join routes r using(route_id) " +
            "where f.type = :type and (f.flight_number like :search or r.arrival_city like :search) and " +
            "(f.departure_date >= :startDate and f.departure_date <= :endDate)", nativeQuery = true)
    List<FlightEntity> findDepartureFlightsBySearchAndDepartureDateBetween(String search, LocalDateTime startDate, LocalDateTime endDate, String type);
}
