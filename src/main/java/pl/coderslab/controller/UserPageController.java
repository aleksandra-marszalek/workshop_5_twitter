package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Tweet;
import pl.coderslab.service.TweetService;
import pl.coderslab.service.UserService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class UserPageController {


    @Autowired
    UserService userService;

    @Autowired
    TweetService tweetService;

    @GetMapping("/user/{id}/all")
    public String getAll (@PathVariable Long id, HttpSession httpSession, Model model) {
        if (httpSession.getAttribute("id") == null) {
            return "index";
        } else {
            List<Tweet> tweets = tweetService.findAllByUser(id);
            model.addAttribute("usertweets", tweets);
            return "UserTweet";
        }
    }
}
