package server.model;

import server.entity.UserEntity;

import java.util.List;
// С этим пока не разобрался
//????
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


    public User() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public List<Flight> getFlights() {
        return flights;
    }

    public void setFlights(List<Flight> flights) {
        this.flights = flights;
    }
}
