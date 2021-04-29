package server.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

/**
 * Сущность Авиакомпаний
 * <p>
 * Поля:
 * <p>
 * airline_id - id авиакомпании
 * <p>
 * companyCode - код авиакомпании
 * <p>
 * companyName - название организации
 * <p>
 * website - вебсайт
 * <p>
 * phone - телефон организации
 * <p>
 * email - почта организации
 */
@Entity
@Setter
@Getter
@Table(name = "airlines")
@NoArgsConstructor
public class AirlineEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long airline_id;

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

    @JoinTable
    @OneToMany
    private Set<FlightEntity> flight;
}
