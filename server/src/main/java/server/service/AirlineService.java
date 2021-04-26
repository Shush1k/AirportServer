package server.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.entity.AirlineEntity;
import server.repository.AirlineRepository;

import java.util.List;

/**
 * Сервис Авиакомпаний
 */
@Service
public class AirlineService {
    private AirlineRepository airlineRepo;

    public AirlineService(AirlineRepository airlineRepo) {
        this.airlineRepo = airlineRepo;
    }

    /**
     * Найти все авиакомпании по имени компании и отсортировать их по имени компании
     *
     * @param filter вид сортировки
     * @return список авиакомпании
     */
    @Transactional(readOnly = true)
    public List<AirlineEntity> getAllAirlines(boolean filter) {
        if (filter) {
            return airlineRepo.findAllByOrderByCompanyNameDesc();
        } else {
            return airlineRepo.findAllByOrderByCompanyName();
        }
    }

    /**
     * Найти все авиакомпании по вхождению подстроки в название авиакомпании и отсортировать их по имени компании
     *
     * @param filter  вид сортировки
     * @param subName часть имени
     * @return список авиакомпании
     */
    @Transactional(readOnly = true)
    public List<AirlineEntity> getAirlinesByName(String subName, boolean filter) {
        if (filter) {
            return airlineRepo.findAirlineEntitiesByCompanyNameContainsOrderByCompanyNameDesc(subName);
        } else {
            return airlineRepo.findAirlineEntitiesByCompanyNameContains(subName);
        }
    }
}
