package server.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;
import java.util.Set;


/**
 * Сущность Маршрутов
 * <p>
 * Поля:
 * <p>
 * route_id - id маршрута
 * <p>
 * departureCity - город отправления
 * <p>
 * arrivalCity - город прибытия
 * <p>
 * flight - рейса
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