package server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import server.entity.UserEntity;

import java.util.Optional;

/**
 * Репозиторий Пользователя
 */
@Repository
public interface UserRepository extends JpaRepository<UserEntity, Long> {
    /**
     * Найти пользователя по email
     *
     * @param email - почта пользователя
     * @return сущность пользователя
     */
    Optional<UserEntity> findUserByEmail(String email);

    /**
     * Обновить пользователя в БД
     *
     * @param email     - почта
     * @param password  - пароль
     * @param firstName - имя
     * @param lastName  - фамилия
     */
    @Modifying
    @Query(value = "update user u set u.email=:email, u.first_name=:firstName," +
            " u.last_name= :lastName, u.login=:email, u.password=:password where u.email=:email", nativeQuery = true)
    void updateByEmail(String email, String password, String firstName, String lastName);

    /**
     * Удалить пользователя из БД по email
     *
     * @param email - почта
     */
    void deleteByEmail(String email);

    Optional<UserEntity> findUserEntityByEmailAndPassword(String email, String password);
}
