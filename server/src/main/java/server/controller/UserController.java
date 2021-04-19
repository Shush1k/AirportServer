package server.controller;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import server.dto.UserAuthDTO;
import server.entity.UserEntity;
import server.exceptions.UserAlreadyExistException;
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
//    TODO: убрать try catch. переделать, пока не знаю как
    @PostMapping("/registration")
    public ResponseEntity<?> registration(@RequestBody UserEntity user) {
        Map<String, Object> map = new HashMap<>();
        try {
            userService.saveUser(user);
            map.put("success", true);
            return new ResponseEntity<>(map, HttpStatus.CREATED);
        } catch (UserAlreadyExistException e) {
            map.put("success", false);
            return new ResponseEntity<>(map, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    /**
     * Авторизация пользователя
     *
     * @param user - userAuthDTO, поля авторизации
     * @return ResponseEntity
     */
    @PostMapping("/auth")
    public ResponseEntity<?> auth(@RequestBody UserAuthDTO user) {
        UserEntity result = userService.checkAuth(user.getLogin(), user.getPassword());
        Map<String, Object> map = new HashMap<>();
        if (result == null) {
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
        Map<String, Object> map = new HashMap<>();
        userService.updateByEmail(user);
        map.put("success", true);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }


    /**
     * Вывод информации о всех пользователях
     *
     * @return ResponseEntity
     */
//    TODO: убрать после того, как отладим данный контроллер
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
