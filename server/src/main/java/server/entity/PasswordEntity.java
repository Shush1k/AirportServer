package server.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;

/**
 * Сущность Паролей
 */
@Entity
@Setter
@Getter
@Table(name = "password")
@NoArgsConstructor
public class PasswordEntity {
    @Id
    private Long id;

    @Column(nullable = false, length = 1000)
    private String hash;

    @Column(nullable = false, length = 1000)
    private String salt;

    @OneToOne(fetch = FetchType.LAZY)
    @MapsId
    @JoinColumn(name = "id")
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    private UserEntity user;

    public PasswordEntity(String hash,
                          String salt) {
        this.hash = hash;
        this.salt = salt;
    }
}


