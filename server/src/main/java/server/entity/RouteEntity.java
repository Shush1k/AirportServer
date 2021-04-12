package server.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;


/**
 * Сущность Маршрутов
 */
@Entity
@Table(name = "route")
@Setter
@Getter
@NoArgsConstructor
public class RouteEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false)
    private String departure_city;
    @Column(nullable = false)
    private String arrival_city;

//    @OneToMany(mappedBy = "route", cascade = CascadeType.ALL)
//    private Set<RouteEntity> routes;
}