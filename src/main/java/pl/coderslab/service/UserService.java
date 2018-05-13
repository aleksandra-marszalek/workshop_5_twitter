package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.BCrypt;
import pl.coderslab.entity.User;
import pl.coderslab.repository.UserRepository;

import javax.validation.Valid;
import java.util.List;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    public String encrypt (String password) {
        String encryptedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        return encryptedPassword;
    }

    public void addUser(User user) {
        String password = user.getPassword();
        user.setPassword(encrypt(password));
        userRepository.save(user);
    }

    public User findByEmail(String email) {
        User user = userRepository.findUserByEmail(email);
        return user;
    }

    public User findById(Long id) {
        User user = userRepository.findOne(id);
        return user;
    }

    public boolean checkUser(User user, String password) {
        if (BCrypt.checkpw(password, user.getPassword())) {
            return true;
        }
        return false;
    }

    public boolean checkEmail (User user) {
            String email = user.getEmail();
            User userEx = findByEmail(email);
            if (userEx == null) {
                return false;
            }
            return true;

    }

    public void save (User user) {
        userRepository.save(user);
    }

    public void setEnabled(User user) {
        Long id = user.getId();
        userRepository.setEnabled(id);
    }

    public boolean checkEnabled (User user) {
        return (user.isEnabled()) ? true : false;
    }

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public void deleteUser(User user) {
        userRepository.delete(user);
    }



}
