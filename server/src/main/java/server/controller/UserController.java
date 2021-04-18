package server.controller;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import server.dto.UserAuthDTO;
import server.entity.UserEntity;
import server.exceptions.UserAlreadyExistException;
import server.exceptions.UserNotFoundException;
import server.service.UserService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public ResponseEntity<?> registration(@RequestBody UserEntity user) {
        Map<String, Object> map = new HashMap<>();
        try {
            userService.saveUser(user);
            map.put("success", true);
            return new ResponseEntity<>(map, HttpStatus.CREATED);
        } catch (UserAlreadyExistException e) {
            map.put("success", false);
//            map.put("errorMessage", e.getMessage());
            return new ResponseEntity<>(map, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping("/auth")
    public ResponseEntity<?> auth(@RequestBody UserAuthDTO user){
        UserEntity result = userService.checkAuth(user.getLogin(), user.getPassword());
        Map<String, Object> map = new HashMap<>();
        if (result == null){
            map.put("success", false);
            return new ResponseEntity<>(map, HttpStatus.OK);
        }
        map.put("success", true);
        map.put("result", result);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    /**
     * Обновление пользователя
     *
     * @param user - сущность пользователя
     * @return ResponseEntity
     */
    @PutMapping("/update")
    public ResponseEntity<?> updateByEmail(@RequestBody UserEntity user) {
        userService.updateByEmail(user);
        return new ResponseEntity<>("Пользователие данные обновлены",HttpStatus.OK);
    }


    @GetMapping("/info/{id}")
    public ResponseEntity<?> getOneUser(@PathVariable Long id) throws UserNotFoundException {
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
    public ResponseEntity<List<UserEntity>> getUsers() {
        List<UserEntity> users = userService.getAllUsers();
        return new ResponseEntity<>(users, HttpStatus.OK);
    }

    /**
     * Удаление пользователя
     *
     * @param user - сущность пользователя
     * @return ResponseEntity
     */
    @DeleteMapping("/delete")
    public ResponseEntity<?> deleteUser(@RequestBody UserEntity user) {
        userService.deleteByEmail(user);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
