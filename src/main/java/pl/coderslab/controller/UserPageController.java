package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Comment;
import pl.coderslab.entity.Message;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;
import pl.coderslab.service.CommentService;
import pl.coderslab.service.MessageService;
import pl.coderslab.service.TweetService;
import pl.coderslab.service.UserService;
import pl.coderslab.validationGroups.ValidationMessage;
import pl.coderslab.validationGroups.ValidationMessagePrivate;
import pl.coderslab.validationGroups.ValidationUser;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Controller
public class UserPageController {


    @Autowired
    UserService userService;

    @Autowired
    TweetService tweetService;

    @Autowired
    CommentService commentService;

    @Autowired
    MessageService messageService;

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

    @GetMapping("/allUsers")
    public String allUsers (HttpSession httpSession, Model model) {
        if (httpSession.getAttribute("id")==null) {
            return "redirect:/index";
        } else {
            List<User> allUsers = userService.findAll();
            model.addAttribute("users", allUsers);
            return "AllUsers";
        }
    }


    @GetMapping("/userpanel/{id}")
    public String welcomePanel (@PathVariable Long id, HttpSession httpSession, Model model) {
        if (httpSession.getAttribute("id")==null) {
            return "redirect:/index";
        } else if (tweetService.castObjectToLong(httpSession.getAttribute("id"))!=id) {
            return "redirect:/home";
        } else {
            model.addAttribute("id", id);
            return "userPanel";
        }
    }

    @GetMapping("/user/edit/{id}")
    public String editUser (@PathVariable Long id, HttpSession httpSession, Model model) {
        if (httpSession.getAttribute("id")==null) {
            return "redirect:/index";
        } else if (tweetService.castObjectToLong(httpSession.getAttribute("id"))!=id) {
            return "redirect:/home";
        } else {
            User user = userService.findById(id);
            model.addAttribute("user", user);
            return "UserEdit";
        }
    }

    @PostMapping("/user/edit/{id}")
    public String editUser (@Validated({ValidationUser.class})
                                @ModelAttribute User user, BindingResult result, Model model, @PathVariable Long id) {
        if (result.hasErrors()) {
            return "UserEdit";
        }
        userService.addUser(user);
        model.addAttribute("user", user);
        return "redirect:/userpanel/"+id;
    }


    @GetMapping("/user/delete/{id}")
    public String delete(Model model, @PathVariable long id, HttpSession httpSession) {
        if (httpSession.getAttribute("id")==null) {
            return "redirect:/index";
        } else if (tweetService.castObjectToLong(httpSession.getAttribute("id"))!=id) {
            return "redirect:/home";
        } else {
            User user = userService.findById(id);
            model.addAttribute("user", user);
            return "UserDelete";
        }
    }

    @Transactional
    @PostMapping("/user/delete/{id}")
    public String delete(@ModelAttribute User user, @PathVariable long id,
                         @RequestParam String agree, Model model, HttpSession httpSession) {
        if (agree.equals("yes")) {
            try {
                userService.deleteUserById(id);
                httpSession.setAttribute("id", null);
            } catch (Exception e){
                model.addAttribute("error", "user");
                return "Error";
            }
        }
        return "redirect:/home";
    }

    @GetMapping("/user/deleteTweets/{id}")
    public String deleteTweets(Model model, @PathVariable long id, HttpSession httpSession) {
        if (httpSession.getAttribute("id") == null) {
            return "redirect:/index";
        } else if (tweetService.castObjectToLong(httpSession.getAttribute("id")) != id) {
            return "redirect:/home";
        } else {
            User user = userService.findById(id);
            model.addAttribute("user", user);
            return "TweetDelete";
        }
    }

    @Transactional
    @PostMapping("/user/deleteTweets/{id}")
    public String deleteTweets(@ModelAttribute User user, @PathVariable long id,
                         @RequestParam String agree, Model model, HttpSession httpSession) {
        if (agree.equals("yes")) {
            try {
                tweetService.deleteAllTweets(user);
            } catch (Exception e){
                model.addAttribute("error", "userpanel");
                return "Error";
            }
        }
        return "redirect:/userpanel/"+id;
    }

//    @GetMapping("/user/{id}/showMessages")
//    public String showAllMsg (@PathVariable Long id, HttpSession httpSession, Model model) {
//        if (httpSession.getAttribute("id") == null) {
//            return "index";
//        } else {
//            User receiver = userService.findById(id);
//            List<Message> messages = messageService.findAllByReceiver(receiver);
//            model.addAttribute("messages", messages);
//            return "UserMessage";
//        }
//    }



}
