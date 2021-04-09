package server.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import server.entity.UserEntity;
import server.exceptions.UserNotFoundException;
import server.model.User;
import server.repository.UserRepository;

import java.util.List;

/**
 * Логика работы с сущностью Пользователя
 */
@Service
public class UserService {

    @Autowired
    private UserRepository userRepo;

    /**
     * Добавить пользователя в БД
     *
     * @param user - сущность пользователя
     * @return сохраненного пользователя
     */
    public UserEntity saveUser(UserEntity user) {
        return userRepo.saveAndFlush(user);
    }

    /**
     * Обновить пользователя в БД
     * (логин, имя, фамилия, почта)
     *
     * @param user - сущность пользователя
     * @return
     */
    public UserEntity updateUser(UserEntity user) {
        UserEntity userEntity = userRepo.findById(user.getId()).orElse(null);
        userEntity.setLogin(user.getLogin());
        userEntity.setFirstName(user.getFirstName());
        userEntity.setLastName(user.getLastName());
        userEntity.setEmail(user.getEmail());
        return userRepo.save(userEntity);
    }

    /**
     * Удалить пользователя из БД
     *
     * @param user - сущность пользователя
     */
    public void deleteUser(UserEntity user) {
        userRepo.delete(user);
    }

    /**
     * Найти пользователя по id
     *
     * @param id - id пользователя
     * @return - модель пользователя
     * @throws UserNotFoundException - Пользователь не найден
     */
    public User getById(Long id) throws UserNotFoundException {
        UserEntity user = userRepo.findById(id).get();
        if (user == null) {
            throw new UserNotFoundException("Пользователь не найден");
        }
        return User.toModel(user);
    }

    /**
     * Найти всех пользователей
     * @return список пользователей
     */
    public List<UserEntity> getAllUsers() { return userRepo.findAll(); }
}
