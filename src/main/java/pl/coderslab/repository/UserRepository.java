package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.coderslab.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {

    User findUserByEmail(String email);

    @Query(value="UPDATE User SET enabled = true WHERE id=:id", nativeQuery = true)
    User setEnabled(@Param("id") Long id);


}
