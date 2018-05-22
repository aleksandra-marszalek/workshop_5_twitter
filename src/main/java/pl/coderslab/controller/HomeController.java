package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;
import pl.coderslab.service.TweetService;
import pl.coderslab.service.UserService;
import pl.coderslab.validationGroups.ValidationMessage;
import pl.coderslab.validationGroups.ValidationUser;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.Validator;
import java.time.LocalDateTime;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    UserService userService;

    @Autowired
    TweetService tweetService;


    @GetMapping("/")
    public String home (HttpSession httpSession) {
        if (httpSession.getAttribute("id") == null) {
            return "login";
        } else {
            return "redirect:/home";
        }
    }


    @GetMapping("/home")
    public String index (Model model, HttpSession httpSession) {
        if (httpSession.getAttribute("id") == null) {
            return "login";
        } else {
            model.addAttribute("tweet", new Tweet());
            Long userId = tweetService.castObjectToLong(httpSession.getAttribute("id"));
            User userLogged = userService.findById(userId);
            model.addAttribute("userLog", userLogged);
            return "home";
        }
    }


    @PostMapping("/home")
    public String index(@Validated(ValidationMessage.class) @ModelAttribute Tweet tweet, BindingResult result, HttpSession httpSession) {
        Long userId = tweetService.castObjectToLong(httpSession.getAttribute("id"));
        User user = userService.findById(userId);
        tweet.setCreated(LocalDateTime.now());
        tweet.setUser(user);
        if (result.hasErrors()) {
            return "redirect:/home";
        }
        tweetService.save(tweet);
        return "redirect:/user/"+userId+"/all";
    }

    @GetMapping("/logout")
    public String logout(HttpSession httpSession) {
        httpSession.setAttribute("id", null);
        return "redirect:/login";
    }


    /////////////// MODEL ////////////////////
    @ModelAttribute("users")
    public List<User> users() {
        return userService.findAll();
    }

    @ModelAttribute("alltweets")
    public  List<Tweet> tweets() {return tweetService.findAllSorted();}

}
