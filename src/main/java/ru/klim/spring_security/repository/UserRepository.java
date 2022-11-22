package ru.klim.spring_security.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.klim.spring_security.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
