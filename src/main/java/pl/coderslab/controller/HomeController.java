package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.User;
import pl.coderslab.service.UserService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class HomeController {

    @Autowired
    UserService userService;

    @GetMapping("/")
    public String home () {
        return "home";
    }

    @GetMapping("/newuser")
    public String newUser (Model model) {
        model.addAttribute("user", new User());
        return "newuser";
    }

    @PostMapping("/newuser")
    public String addUser(@Valid @ModelAttribute User user, BindingResult result) {
        if (result.hasErrors()) {
            return "newuser";
        }
        userService.addUser(user);
        return "redirect:/user/all";
    }
//    @PostMapping("/newuser")
//    public String addUser(@ModelAttribute User user) {
//        userService.addUser(user);
//        return "redirect:/user/all";
//    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password, HttpSession httpSession, Model model) {
        try {
            User user = userService.findByEmail(email);
            if (userService.checkUser(user, password)) {
                httpSession.setAttribute("id", user.getId());
                return "/home";
            } else {
                model.addAttribute("info", "wrong password");
            }
        } catch (Exception e) {
            model.addAttribute("info", "wrong email address");
        }
        return ("login");
    }

}
