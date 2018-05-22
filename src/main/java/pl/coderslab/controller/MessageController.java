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
import pl.coderslab.entity.Message;
import pl.coderslab.entity.User;
import pl.coderslab.service.MessageService;
import pl.coderslab.service.TweetService;
import pl.coderslab.service.UserService;
import pl.coderslab.validationGroups.ValidationMessagePrivate;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MessageController {

    @Autowired
    TweetService tweetService;

    @Autowired
    MessageService messageService;

    @Autowired
    UserService userService;


    @GetMapping("/user/{id}/myMessages")
    public String allMessages (@PathVariable Long id, HttpSession httpSession, Model model) {
        if (httpSession.getAttribute("id")==null) {
            return "redirect:/index";
        } else if (tweetService.castObjectToLong(httpSession.getAttribute("id"))!=id) {
            return "redirect:/home";
        } else {
            tweetService.userLog(httpSession, model);
            User user = userService.findById(id);
            List<Message> messagesReceived = messageService.findAllByReceiver(user);
            List<Message> messagesSent = messageService.findAllBySender(user);
            model.addAttribute("messagesReceived", messagesReceived);
            model.addAttribute("messagesSent", messagesSent);
            return "AllMessages";
        }
    }

    @GetMapping("/user/{id}/sendMessage")
    public String sendMessage(Model model, @PathVariable Long id, HttpSession httpSession) {
        if (httpSession.getAttribute("id") == null) {
            return "redirect:/index";
        } else if (tweetService.castObjectToLong(httpSession.getAttribute("id")) == id) {
            return "redirect:/home";
        } else {
            tweetService.userLog(httpSession, model);
            User sender = userService.findById(Long.parseLong((String)httpSession.getAttribute("id")));
            User receiver = userService.findById(id);
            Message message = new Message();
            message.setSender(sender);
            message.setReceiver(receiver);
            model.addAttribute("message", message);
            return "MessageForm";
        }
    }

    @PostMapping("/user/{id}/sendMessage")
    public String sendMessage(@Validated(ValidationMessagePrivate.class) @ModelAttribute Message message,
                              BindingResult result, HttpSession httpSession) {
        if (result.hasErrors()) {
            return "MessageForm";
        }
        User currentUser = userService.findById(Long.parseLong((String) httpSession.getAttribute("id")));
        Long id = currentUser.getId();
        message.setReaded(0);
        message.setCreated(LocalDateTime.now());
        messageService.sendMessage(message);
        return "redirect:/user/"+id+"/myMessages";
    }

    @GetMapping("/newMessage")
    public String newMessage(Model model, HttpSession httpSession) {
        if (httpSession.getAttribute("id") == null) {
            return "redirect:/index";
        } else {
            tweetService.userLog(httpSession, model);
            User sender = userService.findById(Long.parseLong((String) httpSession.getAttribute("id")));
            Message message = new Message();
            message.setSender(sender);
            model.addAttribute("message", message);
            model.addAttribute("receivers", findReceivers(sender));
        }
        return "NewMessage";
    }

    @PostMapping("/newMessage")
    public String newMessage(@Validated(ValidationMessagePrivate.class) @ModelAttribute Message message, BindingResult result, HttpSession httpSession) {
        if (result.hasErrors()) {
            return "NewMessage";
        }
        User currentUser = userService.findById(Long.parseLong((String) httpSession.getAttribute("id")));
        Long id = currentUser.getId();
        message.setReaded(0);
        message.setCreated(LocalDateTime.now());
        messageService.sendMessage(message);
        return "redirect:/user/"+id+"/myMessages";
    }

    @GetMapping("/message/{id}/show")
    public String showMessage(Model model, HttpSession httpSession, @PathVariable Long id) {
        if (httpSession.getAttribute("id") == null) {
            return "redirect:/index";
        }
        tweetService.userLog(httpSession, model);
        User currentUser = userService.findById(Long.parseLong((String) httpSession.getAttribute("id")));
        Message message = messageService.findById(id);
        User sender = message.getSender();
        User receiver = message.getReceiver();
        model.addAttribute("message", message);
        if (sender.getId()==(currentUser.getId())) {
            return "OneMessage";
        } else if (receiver.getId()==(currentUser.getId())) {
            message.setReaded(1);
            messageService.sendMessage(message);
            return "OneMessage";
        } else {
            return "redirect:/home";
        }
    }


    public List<User> findReceivers(User currentUser) {
        List<User> receivers = userService.findAll();
        receivers.remove(currentUser);
        return receivers;
//        List<User> receiversExceptCurrentUser = new ArrayList<>();
//        for (User receiver: receivers) {
//            if (!receiver.equals(currentUser)) {
//                receiversExceptCurrentUser.add(receiver);
//            }
//            else {
//                receiversExceptCurrentUser.remove(currentUser);
//            }
//        }
//        return receiversExceptCurrentUser;
    }




}
