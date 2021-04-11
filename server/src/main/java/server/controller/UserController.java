package server.controller;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import server.entity.UserEntity;
import server.exceptions.UserAlreadyExistException;
import server.exceptions.UserNotFoundException;
import server.service.UserService;

import java.util.List;

/**
 * Контроллер Пользователя
 */
@RestController
@RequestMapping("/users")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

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

    /**
     * Обновление пользователя
     *
     * @param user - сущность пользователя
     * @return ResponseEntity
     */
    @PutMapping("/update")
    public ResponseEntity updateByEmail(@RequestBody UserEntity user) {
        userService.updateByEmail(user);
        return new ResponseEntity(HttpStatus.OK);
    }


//    лучше с email, id приходить не должен
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

    /**
     * Вывод информации о всех пользователях
     *
     * @return ResponseEntity
     */
    @GetMapping("/all")
    public ResponseEntity getUsers() {
        List<UserEntity> users = userService.getAllUsers();
        return new ResponseEntity(users, HttpStatus.OK);
    }

    /**
     * Удаление пользователя
     *
     * @param user - сущность пользователя
     * @return ResponseEntity
     */
    @DeleteMapping("/delete")
    public ResponseEntity deleteUser(@RequestBody UserEntity user) {
        userService.deleteByEmail(user);
        return new ResponseEntity(HttpStatus.OK);
    }
}
