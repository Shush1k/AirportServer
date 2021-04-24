package server.controller;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import server.dto.UserAuthDTO;
import server.entity.UserEntity;
import server.service.UserService;
import server.utils.StringToHashUtil;

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
    /*TODO:
       убрать try catch. переделать, пока не знаю как
       Хешировать пароль при регистрации пользователя!
     */
    @PostMapping("/registration")
    public ResponseEntity<?> registration(@RequestBody UserEntity user) {
        String hashPassword = StringToHashUtil.convert(user.getPassword());
        UserEntity result = userService.checkAuth(user.getLogin(), hashPassword);
        Map<String, Object> map = new HashMap<>();
        if (result == null) {
            userService.saveUser(user);
            map.put("success", true);
            return new ResponseEntity<>(map, HttpStatus.OK);
        } else {
            map.put("success", false);
            return new ResponseEntity<>(map, HttpStatus.OK);
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
        if (user.getPassword() == null) return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        String hashPassword = StringToHashUtil.convert(user.getPassword());
        UserEntity result = userService.checkAuth(user.getLogin(), hashPassword);
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


    // Вместо DeleteMapping использую GetMapping
    // с ним работает удаление корректно

    /**
     * Удаление пользователя
     *
     * @param email    почта
     * @param password пароль
     * @return ResponseEntity
     */
    @GetMapping("/delete")
    public ResponseEntity<?> deleteUserByEmail(@RequestParam(name = "email") String email,
                                               @RequestParam(name = "password") String password) {
        String hashPassword = StringToHashUtil.convert(password);
        if (userService.checkAuth(email, hashPassword) != null) {
            userService.deleteByEmail(email);
            return new ResponseEntity<>(HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);

    }
}
