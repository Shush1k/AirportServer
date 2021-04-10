package server.model;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import server.entity.UserEntity;

import java.util.List;

// С этим пока не разобрался
//????
@Setter
@Getter
@NoArgsConstructor
public class User {
    private Long id;
    private String login;
    private List<Flight> flights;

    public static User toModel(UserEntity entity) {
        User model = new User();
        model.setId(entity.getId());
        model.setLogin(entity.getLogin());
        return model;
    }


}
