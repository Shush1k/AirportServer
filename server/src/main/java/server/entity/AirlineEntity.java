package server.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Сущность Авиакомпаний
 */
@Entity
@Data
@Table(name = "Airline")
public class AirlineEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;


    public AirlineEntity() {
    }
}
