package server.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

/**
 * Сущность дат
 * <p>
 * startDate - начальная дата
 * endDate - конечная дата
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DateFilter {

    private Date startDate;

    private Date endDate;
}
