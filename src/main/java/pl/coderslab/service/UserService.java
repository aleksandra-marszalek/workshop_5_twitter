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

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;


    public void addUser(User user) {
        String password = user.getPassword();
        user.setEmail(BCrypt.hashpw(password, BCrypt.gensalt()));
        userRepository.save(user);
    }




}
