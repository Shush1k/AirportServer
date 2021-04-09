package server.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

/**
 * Сущность Пользователя
 */
@Entity
@Data
@Table(name = "user")
public class UserEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 40, nullable = false, unique = true)
    private String login;
    @Column(length = 40, nullable = false)
    private String firstName;
    @Column(length = 40, nullable = false)
    private String lastName;
    @Column(length = 40, nullable = false, unique = true)
    private String email;

//    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
//    private List<FlightEntity> flights;
    @OneToOne(mappedBy = "user")
    private Password password;
    public UserEntity() {
    }
}
