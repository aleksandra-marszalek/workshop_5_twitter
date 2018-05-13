package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.coderslab.entity.Comment;
import pl.coderslab.entity.Tweet;

import java.util.Collection;
import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {

    @Query("select c from Comment c where c.tweet=:tweet")
    List<Comment> findAllByPost(@Param("tweet") Tweet tweet);

    @Query("select c from Comment c where c.tweet.id=:id order by c.created desc")
    List<Comment> findAllByPostId(@Param("id") Long id);

    List<Comment> findAllByTweetOrderByCreatedDesc(Tweet tweet);

}
