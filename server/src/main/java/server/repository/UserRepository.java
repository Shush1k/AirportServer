package server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import server.entity.UserEntity;

/**
 * Репозиторий Пользователя
 */
public interface UserRepository extends JpaRepository<UserEntity, Long> {
    /**
     * Найти пользователя по логину
     *
     * @param login - логин пользователя
     * @return сущность пользователя
     */
    UserEntity findUserByLogin(String login);
}
