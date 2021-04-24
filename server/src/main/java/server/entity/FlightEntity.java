package server.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;

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

    @Column//(nullable = false)
    private String planeModel;


//    @ManyToOne(fetch = FetchType.EAGER)
//    name = "route_id" - ссылка на внешний ключ в таблице flights
//    @JoinColumn(name = "route_id")
//    private RouteEntity route;


}
