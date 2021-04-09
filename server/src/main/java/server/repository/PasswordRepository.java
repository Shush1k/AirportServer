package server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import server.entity.Password;

/**
 * Репозиторий Паролей
 */
public interface PasswordRepository extends JpaRepository<Password, Long> {
}
