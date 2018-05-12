package pl.coderslab.repository;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.coderslab.entity.Tweet;

import java.util.List;

public interface TweetRepository extends JpaRepository<Tweet, Long> {

    List<Tweet> findAllByUserId(Long id);

    @Query("SELECT t from Tweet t where t.user.id=:id order by t.created desc")
    List<Tweet> findAllByUserIdSorted(@Param("id") Long id);

    @Query("SELECT t from Tweet t order by t.created desc")
    List<Tweet> findAllOrderByCreated();
}
