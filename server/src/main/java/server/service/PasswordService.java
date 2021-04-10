package server.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import server.entity.PasswordEntity;
import server.entity.UserEntity;
import server.repository.PasswordRepository;

@Service
public class PasswordService {

    @Autowired
    private PasswordRepository passwordRepo;

    /**
     * Добавить пароль в БД
     *
     * @param password
     * @return
     */
    public PasswordEntity savePassword(PasswordEntity password) {
        return passwordRepo.saveAndFlush(password);
    }

    /**
     * Обновить пароль в БД
     * (хэш, соль)
     *
     * @param password
     * @return
     */
    public PasswordEntity updatePassword(PasswordEntity password) {
        PasswordEntity passwordEntity = passwordRepo.findById(password.getId()).orElse(null);
        passwordEntity.setHash(password.getHash());
        passwordEntity.setSalt(password.getSalt());
        return passwordRepo.save(passwordEntity);
    }

    /**
     * Удалить пароль из БД
     *
     * @param password - сущность пароля
     */
    public void deletePassword(PasswordEntity password) {
        passwordRepo.delete(password);
    }

    /**
     * Найти пароль по id
     * @param id - id пароля
     * @return пароль с заданным id
     */
    public PasswordEntity getById(Long id) { return passwordRepo.getOne(id); }

    public PasswordEntity getPasswordByUser(UserEntity user) { return passwordRepo.findByUserId(user.getId()); }
}
