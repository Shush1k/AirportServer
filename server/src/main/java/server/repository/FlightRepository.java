package server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import server.entity.FlightEntity;

/**
 * Репозиторий Рейсов
 */
public interface FlightRepository extends JpaRepository<FlightEntity, Long> {
}
