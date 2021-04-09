package server.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Сущность рейсов
 */
@Entity
@Data
@Table(name = "Flight")
public class FlightEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;


    public FlightEntity() {
    }
}
