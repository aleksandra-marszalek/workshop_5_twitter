package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.tags.HtmlEscapeTag;
import pl.coderslab.entity.Comment;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;
import pl.coderslab.service.CommentService;
import pl.coderslab.service.TweetService;
import pl.coderslab.service.UserService;
import pl.coderslab.validationGroups.ValidationMessage;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.List;

@Controller
public class TweetController {

    @Autowired
    TweetService tweetService;

    @Autowired
    UserService userService;

    @Autowired
    CommentService commentService;

    @GetMapping("/tweet/{id}/show")
    public String showTweet(@PathVariable Long id, Model model, HttpSession httpSession) {
        if (httpSession.getAttribute("id") == null) {
            return "index";
        } else {
            Tweet tweet = tweetService.findById(id);
            model.addAttribute("tweet", tweet);
            List<Comment> comments = commentService.findAllByTweet(tweet);
            model.addAttribute("comments", comments);
            model.addAttribute("comment", new Comment());
            return "TweetPage";
        }
    }

    @PostMapping("/tweet/{id}/show")
    public String index(@Valid @ModelAttribute Comment comment, @PathVariable Long id, BindingResult result, HttpSession httpSession) {
        Long userId = tweetService.castObjectToLong(httpSession.getAttribute("id"));
        User user = userService.findById(userId);
        Tweet tweet = tweetService.findById(id);
        comment.setCreated(LocalDateTime.now());
        comment.setUser(user);
        comment.setTweet(tweet);
        if (result.hasErrors()) {
            return "error";
        }
        commentService.save(comment);
        return "redirect:/tweet/"+id+"/show";
    }

}
