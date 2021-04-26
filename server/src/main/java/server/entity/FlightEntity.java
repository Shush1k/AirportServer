package server.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * Сущность Рейсов
 * <p>
 * Поля рейсов:
 * <p>
 * id - уникальный идентификатор;
 * <p>
 * flightNumber - номер рейса;
 * <p>
 * departure_date - дата и время отправления;
 * <p>
 * arrival_date - дата и время прибытия;
 * <p>
 * status - статус рейса;
 */
@Entity
@Setter
@Getter
@Table(name = "flights")
@NoArgsConstructor
@AllArgsConstructor
public class FlightEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long flight_id;

    @Column(nullable = false, unique = true)
    private String flightNumber;
    @Column(nullable = false)
    private LocalDateTime departureDate;
    @Column(nullable = false)
    private LocalDateTime arrivalDate;

    private String status;

    @Column(nullable = false)
    private String type;

    @Column(nullable = false)
    private String planeModel;
    
    @ManyToOne
    @JoinColumn(name = "route_id")
    private RouteEntity route;

    @ManyToOne
    @JoinColumn(name = "company_code")
    private AirlineEntity airline;
}
