package server.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class UserRegistrationDTO {
    private String login;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
}
