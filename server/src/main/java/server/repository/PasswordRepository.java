package server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import server.entity.PasswordEntity;

/**
 * Репозиторий Паролей
 */
public interface PasswordRepository extends JpaRepository<PasswordEntity, Long> {
    /**
     * Получить пароль пользователя по его id
     * @param id - userId - id пользователя
     * @return
     */
    PasswordEntity findByUserId(Long id);
}
