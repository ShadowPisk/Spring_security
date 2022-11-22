package ru.klim.spring_security.service;


import ru.klim.spring_security.model.Sensor;

import java.util.List;
import java.util.Optional;
import java.util.Set;

public interface SensorService {
    Sensor findByName(String name);
    void save(Sensor sensor);

    public List<Sensor> searchBy(String name);
}
