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


    @Autowired
    private Validator jsr303Validator;

    @GetMapping("/home")
    public String index (Model model, HttpSession httpSession) {
        if (httpSession.getAttribute("id") == null) {
            return "index";
        } else {

            model.addAttribute("tweet", new Tweet());
            Long userId = tweetService.castObjectToLong(httpSession.getAttribute("id"));
            User userLogged = userService.findById(userId);
            model.addAttribute("userLog", userLogged);
            return "home";
        }
    }

    @GetMapping("/add")
    public String addTweet(Model model) {
        model.addAttribute("tweet", new Tweet());
        return "TweetForm";
    }

    @PostMapping("/add")
    public String addTweet(@Valid @ModelAttribute Tweet tweet, BindingResult result) {
        if (result.hasErrors()) {
            return "TweetForm";
        }
        tweet.setCreated(LocalDateTime.now());
        tweetService.save(tweet);
        return "redirect:/";
    }

    @PostMapping("/home")
    public String index(@Valid @ModelAttribute Tweet tweet, BindingResult result, HttpSession httpSession) {


        if (result.hasErrors()) {
            return "home";
        }
        tweet.setCreated(LocalDateTime.now());
        tweetService.save(tweet);
        Long userId = tweetService.castObjectToLong(httpSession.getAttribute("id"));
        return "redirect:/user/"+userId+"/all";
    }


    /////////////// MODEL ////////////////////
    @ModelAttribute("users")
    public List<User> users() {
        return userService.findAll();
    }

    @ModelAttribute("alltweets")
    public  List<Tweet> tweets() {return tweetService.findAll();}

}
