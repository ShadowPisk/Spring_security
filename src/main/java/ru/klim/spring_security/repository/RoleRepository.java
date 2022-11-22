package ru.klim.spring_security.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.klim.spring_security.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);
}
