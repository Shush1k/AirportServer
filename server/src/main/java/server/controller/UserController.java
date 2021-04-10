package server.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import server.entity.UserEntity;
import server.exceptions.UserAlreadyExistException;
import server.exceptions.UserNotFoundException;
import server.service.UserService;

/**
 * Контроллер Пользователя
 */
@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * Регистрации для пользователя
     *
     * @param user - сущность пользователя
     * @return ResponseEntity
     */
    @PostMapping("/registration")
    public ResponseEntity registration(@RequestBody UserEntity user) {
        try {
            userService.saveUser(user);
            return ResponseEntity.ok("Пользователь успешно сохранен");
        } catch (UserAlreadyExistException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Произошла ошибка");
        }
    }

//    @PostMapping("/enter")
//    public ResponseEntity enter(@RequestBody UserEntity user){
//
//    }

//    @PutMapping("/update")
//    public ResponseEntity update( ){
//        try {
//            userService.updateUser()
//        }
//    }


//    /users/info/5 получим id, login, flights.
//    А что нужно получать?
    @GetMapping("/info/{id}")
    public ResponseEntity getOneUser(@PathVariable Long id) throws UserNotFoundException {
        try {
            return ResponseEntity.ok(userService.getById(id));
        } catch (UserNotFoundException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Произошла ошибка");
        }
    }
}
