package server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import server.entity.AirlineEntity;

import java.util.List;

/**
 * Репозиторий Авиакомпаний
 */
@Repository
public interface AirlineRepository extends JpaRepository<AirlineEntity, Long> {
    /**
     * Найти все записи по названию компании
     *
     * @param companyName - название компании
     * @return - список авиакомпаний
     */
    @Query(value = "select * from airline a where a.company_name like :companyName", nativeQuery = true)
    List<AirlineEntity> findAirlineEntitiesByCompanyName(String companyName);
}
