package server.entity;

import lombok.Data;

import javax.persistence.*;


/**
 * Сущность Маршрутов
 */
@Entity
@Data
@Table(name = "Route")
public class RouteEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    public RouteEntity() {
    }
}