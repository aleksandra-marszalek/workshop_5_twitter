package pl.coderslab.repository;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.Message;
import pl.coderslab.entity.User;

import java.util.List;

public interface MessageRepository  extends JpaRepository <Message, Long> {


    List<Message> findAllBySender (User sender);

    List<Message> findAllByReceiver (User receiver);
}
