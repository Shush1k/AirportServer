package server.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

/**
 * Сущность Авиакомпаний
 */
@Entity
@Setter
@Getter
@Table(name = "Airline")
@NoArgsConstructor
public class AirlineEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


}
