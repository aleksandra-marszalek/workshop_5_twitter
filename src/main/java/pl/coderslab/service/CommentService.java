package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.entity.Comment;
import pl.coderslab.entity.Tweet;
import pl.coderslab.repository.CommentRepository;

import java.util.List;

@Service
public class CommentService {

    @Autowired
    CommentRepository commentRepository;

    public List<Comment> findAllByTweetId (Long id) {
        return commentRepository.findAllByPostId(id);
    }

    public List<Comment> findAllByTweet (Tweet tweet) {
        List<Comment> comments = commentRepository.findAllByTweetOrderByCreatedDesc(tweet);
        return comments;
    }

    public void save(Comment comment) {
        commentRepository.save(comment);
    }


}
