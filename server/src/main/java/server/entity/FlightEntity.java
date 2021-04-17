package server.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
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
    private Long id;

    @Column(nullable = false, unique = true)
    private String flightNumber;
    @Column(nullable = false)
    private Date departure_date;
    @Column(nullable = false)
    private Date arrival_date;

    private String status;

    @Column//(nullable = false)
    private String planeModel;


//    как связать таблицу рейсов с маршрутами?
//    Не работает
//    @ManyToOne(fetch = FetchType.EAGER)
//    @JoinColumn(name = "route_id")
//    private RouteEntity route;


}
