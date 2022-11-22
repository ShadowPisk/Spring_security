package ru.klim.spring_security.service;

import ru.klim.spring_security.model.Role;

public interface RoleService {
    Role findByName(String name);
}
