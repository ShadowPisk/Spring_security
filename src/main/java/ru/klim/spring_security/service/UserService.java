package ru.klim.spring_security.service;

import ru.klim.spring_security.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
