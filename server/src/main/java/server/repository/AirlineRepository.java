package server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import server.entity.AirlineEntity;

/**
 * Репозиторий Авиакомпаний
 */
public interface AirlineRepository extends JpaRepository<AirlineEntity, Long> {
}
