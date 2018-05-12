package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.tags.HtmlEscapeTag;
import pl.coderslab.entity.Tweet;
import pl.coderslab.service.TweetService;
import pl.coderslab.service.UserService;

import javax.servlet.http.HttpSession;

@Controller
public class TweetController {

    @Autowired
    TweetService tweetService;

    @Autowired
    UserService userService;

    @GetMapping("/tweet/{id}/show")
    public String showTweet(@PathVariable Long id, Model model, HttpSession httpSession) {
        if (httpSession.getAttribute("id") == null) {
            return "index";
        } else {
            Tweet tweet = tweetService.findById(id);
            model.addAttribute("tweet", tweet);
        }
        return "TweetPage";
    }
}
