package server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import server.entity.FlightEntity;

import java.util.Date;
import java.util.List;

/**
 * Репозиторий Рейсов
 */
@Repository
public interface FlightRepository extends JpaRepository<FlightEntity, Long> {

    /**
     * Найти рейсы между датами
     * @param startDate - начальная дата
     * @param endDate - конечная дата
     * @return список рейсов
     */
    @Query(value = "select * from flight f where f.arrival_date >= :startDate AND f.departure_date <= :endDate", nativeQuery = true)
    List<FlightEntity> findFlightsBetweenDates(Date startDate, Date endDate);
}
