package server.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;


/**
 * Сущность Маршрутов
 */
@Entity
@Table(name = "Route")
@Setter
@Getter
@NoArgsConstructor
public class RouteEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;


}