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
    public String index (HttpSession httpSession) {
        if (httpSession.getAttribute("id") == null) {
            return "index";
        } else {
            return "home";
        }

    }

    @GetMapping("/newuser")
    public String newUser (Model model) {
        model.addAttribute("user", new User());
        return "newuser";
    }

    @PostMapping("/newuser")
    public String addUser(@Valid @ModelAttribute User user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "newuser";
        }
        if (userService.checkEmail(user)){
            model.addAttribute("info", "This email already exists");
            return "newuser";
        }
        userService.addUser(user);
        return "index";
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
                httpSession.setAttribute("id", user.getId().toString());
                return "/home";
            } else {
                model.addAttribute("info", "wrong password");
            }
        } catch (Exception e) {
            model.addAttribute("info", "wrong email address");
        }
        return ("login");
    }


//    @PostMapping("/user/enable/{id}")
//    public String enable(@ModelAttribute User user, @PathVariable long id, @RequestParam String agree, Model model, HttpSession httpSession) {
//        if (agree.equals("yes")) {
//            userService.setEnabled(user);
//            httpSession.setAttribute("id", user.getId());
//            return "home";
//        } else {
//            return "index";
//        }
//    }

}
