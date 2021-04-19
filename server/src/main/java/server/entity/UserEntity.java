package server.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

/**
 * Сущность Пользователя
 * <p>
 * Поля пользователя:
 * id - уникальный идентификатор
 * login - логин
 * firstName - имя
 * lastName - фамилия
 * email - почта
 * <p>
 * Длина полей 40 символов
 */
@Entity
@Table(name = "users")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class UserEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long user_id;

    @Column(length = 40, nullable = false, unique = true)
    private String login;
    @Column(length = 40, nullable = false)
    private String firstName;
    @Column(length = 40, nullable = false)
    private String lastName;
    @Column(length = 40, nullable = false, unique = true)
    private String email;
    @Column(nullable = false)
    private String password;
    @Column(length = 20)
    private String phoneNumber;
    @Column
    private Date birthDate;
}
