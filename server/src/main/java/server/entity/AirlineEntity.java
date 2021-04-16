package server.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

/**
 * Сущность Авиакомпаний
 * <p>
 * Поля авиакомпании:
 * <p>
 * id - уникальный идентификатор;
 * <p>
 * <p>
 * companyCode - код авиакомпании;
 * <p>
 * companyName - название организации;
 * <p>
 * phone - телефон организации;
 * <p>
 * email - почта организации;
 * <p>
 */
@Entity
@Setter
@Getter
@Table(name = "airline")
@NoArgsConstructor
public class AirlineEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String companyCode;

    @Column(nullable = false, unique = true)
    private String companyName;

    @Column(nullable = false, unique = true)
    private String website;
    @Column
    private String phone;
    @Column
    private String email;


}
