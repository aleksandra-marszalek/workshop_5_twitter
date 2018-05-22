package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.entity.Message;
import pl.coderslab.entity.User;
import pl.coderslab.repository.MessageRepository;

import java.util.List;

@Service
public class MessageService {

    @Autowired
    MessageRepository messageRepository;

    public List<Message> findAllBySender (User sender) { return messageRepository.findAllBySender(sender);}

    public List<Message> findAllByReceiver (User receiver) { return messageRepository.findAllByReceiver(receiver);}

    public void sendMessage (Message message) {
        messageRepository.save(message);
    }

    public Message findById (Long id) {
        return messageRepository.findOne(id);
    }
}
