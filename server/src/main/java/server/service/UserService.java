package server.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.entity.UserEntity;
import server.exceptions.UserAlreadyExistException;
import server.exceptions.UserNotFoundException;
import server.repository.UserRepository;

import java.util.List;

/**
 * Логика работы с сущностью Пользователя
 */
@Service
public class UserService {

    private static final String USER_ALREADY_EXIST = "Пользователь уже зарегистрирован";
    private static final String USER_NOT_FOUND_BY_EMAIL = "Пользователь с почтой %s не найден";
    private static final String USER_NOT_FOUND_BY_ID = "Пользователь c id %d не найден";
    private final UserRepository userRepo;

    public UserService(UserRepository userRepo) {
        this.userRepo = userRepo;
    }

    /**
     * Добавить пользователя в БД
     *
     * @param user - сущность пользователя
     * @return сохраненного пользователя
     */
    @Transactional
    public UserEntity saveUser(UserEntity user) throws UserAlreadyExistException {
        if (userRepo.findUserByEmail(user.getEmail()).isPresent()) {
            throw new UserAlreadyExistException(USER_ALREADY_EXIST);
        }
        return userRepo.saveAndFlush(user);
    }

    /**
     * Обновить пользователя в БД
     * (логин, имя, фамилия, почта)
     *
     * @param user - сущность пользователя
     */
    @Transactional
    public void updateByEmail(UserEntity user) {
        userRepo.findUserByEmail(user.getEmail())
                .orElseThrow(() -> new UserNotFoundException(String.format(USER_NOT_FOUND_BY_EMAIL, user.getEmail())));
        String email = user.getEmail();
        String password = user.getPassword();
        String firstName = user.getFirstName();
        String lastName = user.getLastName();
        userRepo.updateByEmail(email, password, firstName, lastName);
    }

    /**
     * Удалить пользователя из БД по id
     *
     * @param user - сущность пользователя
     */
    @Transactional
    public void deleteByEmail(UserEntity user) {
        userRepo.deleteByEmail(user.getEmail());
    }

    /**
     * Найти пользователя по id
     *
     * @param id - id пользователя
     * @return - модель пользователя
     * @throws UserNotFoundException - Пользователь не найден
     */
    @Transactional(readOnly = true)
    public UserEntity getById(Long id) throws UserNotFoundException {
        UserEntity user = userRepo.findById(id)
                .orElseThrow(() -> new UserNotFoundException(String.format(USER_NOT_FOUND_BY_ID, id)));
        return user;
    }

    /**
     * Найти всех пользователей
     *
     * @return список пользователей
     */
    @Transactional(readOnly = true)
    public List<UserEntity> getAllUsers() {
        return userRepo.findAll();
    }


}
