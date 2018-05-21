package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.User;
import pl.coderslab.service.UserService;
import pl.coderslab.validationGroups.ValidationUser;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class UserController {

    @Autowired
    UserService userService;


    @GetMapping("/newuser")
    public String newUser (Model model) {
        model.addAttribute("user", new User());
        return "newuser";
    }

    @PostMapping("/newuser")
    public String addUser(@Validated({ValidationUser.class}) @ModelAttribute User user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "newuser";
        }
        if (userService.checkEmail(user)){
            model.addAttribute("info", "This email already exists");
            return "newuser";
        }
        user.setEnabled(false);
        userService.addUser(user);
        model.addAttribute("user", user);
        return "confirmation";
    }


    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password, HttpSession httpSession, Model model) {
        try {
            User user = userService.findByEmail(email);
            if (userService.checkUser(user, password)) {
                if (userService.checkEnabled(user)) {
                    httpSession.setAttribute("id", user.getId().toString());
                    return "redirect:/home";
                } else {
                    return "redirect:/user/enable/"+user.getId();
                }
            } else {
                model.addAttribute("info", "wrong password");
            }
        } catch (Exception e) {
            model.addAttribute("info", "wrong email address");
        }
        return "login";
    }

    @GetMapping("user/enable/{id}")
    public String enable(@PathVariable long id, Model model) {
        User user = userService.findById(id);
        model.addAttribute("user", user);
        return "confirmation";
    }


    @PostMapping("/user/enable/{id}")
    public String enable(@PathVariable long id, @RequestParam String agree, Model model, HttpSession httpSession) {
        if (agree.equals("yes")) {
//            userService.setEnabled(user);
            User user = userService.findById(id);
            user.setEnabled(true);
//            user.setPassword(user.getPassword());
//            user.setEmail(user.getEmail());
//            user.setUsername(user.getUsername());
//            user.setId(user.getId());
            userService.save(user);
            httpSession.setAttribute("id", user.getId());
            return "redirect:/home";
        } else {
            return "index";
        }
    }


}
