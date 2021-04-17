package server.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;


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
    private Long id;
    @Column(nullable = false)
    private String departureCity;
    @Column(nullable = false)
    private String arrivalCity;

//    @OneToMany(mappedBy = "route")
//    private List<FlightEntity> flights;
}