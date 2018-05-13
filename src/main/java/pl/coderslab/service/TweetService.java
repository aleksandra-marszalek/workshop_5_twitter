package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;
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

    public List<Tweet> findAllSorted() {
        List<Tweet> tweets = tweetRepository.findAllOrderByCreated();
        return tweets;
    }

    public void save(Tweet tweet) {
        tweetRepository.save(tweet);
    }

    public List<Tweet> findAllByUser(Long id) {
        List<Tweet> tweets = tweetRepository.findAllByUserIdSorted(id);
        return tweets;
    }

    public Tweet findById(Long id) {
        Tweet tweet = tweetRepository.findOne(id);
        return tweet;
    }

    public void deleteAllTweets(User user) {
        tweetRepository.deleteAllByUser(user);
    }
}
