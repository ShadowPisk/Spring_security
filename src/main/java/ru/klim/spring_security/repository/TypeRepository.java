package ru.klim.spring_security.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.klim.spring_security.model.Type;

import java.util.Optional;

public interface TypeRepository extends JpaRepository<Type, Long> {
    Type findTypeById(Long id);
    Type findTypeByName(String name);
}
