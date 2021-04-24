package server.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;
import java.util.Set;


/**
 * Сущность Маршрутов
 */
@Entity
@Table(name = "routes")
@Setter
@Getter
@NoArgsConstructor
public class RouteEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long route_id;
    @Column(nullable = false)
    private String departureCity;
    @Column(nullable = false)
    private String arrivalCity;


    @JoinTable
    @OneToMany
    private Set<FlightEntity> flight;
}