package server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import server.entity.AirlineEntity;

import java.util.List;

/**
 * Репозиторий Авиакомпаний
 */
@Repository
public interface AirlineRepository extends JpaRepository<AirlineEntity, Long> {

//    Оставил, как пример nativeQuery
//    @Query(value = "select * from airlines a where a.company_name like :companyName", nativeQuery = true)

    /**
     * Найти все авиакомпании, которые содержат подстроку
     *
     * @param subName часть названия авиакомпании
     * @return список авиакомпаний
     */
    List<AirlineEntity> findAirlineEntitiesByCompanyNameContains(String subName);

    /**
     * Найти все авиакомпании, которые содержат подстроку и отсортированы по имени в порядке убывания
     *
     * @param subName часть названия авиакомпании
     * @return список авиакомпаний
     */
    List<AirlineEntity> findAirlineEntitiesByCompanyNameContainsOrderByCompanyNameDesc(String subName);

    /**
     * Найти все авиакомпании, отсортированные по имени компании в порядке возрастания
     *
     * @return список авиакомпаний
     */
    List<AirlineEntity> findAllByOrderByCompanyName();

    /**
     * Найти все авиакомпании, отсортированные по имени компании в порядке убывания
     *
     * @return список авиакомпаний
     */
    List<AirlineEntity> findAllByOrderByCompanyNameDesc();
}
