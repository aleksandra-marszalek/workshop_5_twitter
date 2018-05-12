package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.entity.Tweet;
import pl.coderslab.repository.TweetRepository;

import java.util.List;

@Service
public class TweetService {

    @Autowired
    TweetRepository tweetRepository;

    public Long castObjectToLong(Object object) {
        return Long.parseLong(object.toString());
    }

    public List<Tweet> findAll() {
        List<Tweet> tweets = tweetRepository.findAll();
        return tweets;
    }

    public void save(Tweet tweet) {
        tweetRepository.save(tweet);
    }

    public List<Tweet> findAllByUser(Long id) {
        List<Tweet> tweets = tweetRepository.findAllByUserId(id);
        return tweets;
    }
}
