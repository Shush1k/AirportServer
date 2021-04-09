package server.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Сущность Паролей
 */
@Entity
@Data
@Table(name = "password")
public class Password {
    @Id
    private Long id;

    @Column(nullable = false, length = 1000)
    private String hash;

    @Column(nullable = false, length = 1000)
    private String salt;

//    private User user;??

    public Password() {}

    public Password(String hash,
                    String salt) {
        this.hash = hash;
        this.salt = salt;
    }
}
