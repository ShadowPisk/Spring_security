package ru.klim.spring_security.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.klim.spring_security.model.Role;
import ru.klim.spring_security.repository.RoleRepository;
import ru.klim.spring_security.repository.UserRepository;

@Service
public class RoleServiceImpl implements RoleService{
    @Autowired
    private RoleRepository roleRepository;

    @Override
    public Role findByName(String name) {
        return roleRepository.findByName(name);
    }
}
