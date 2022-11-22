package ru.klim.spring_security.service;


import ru.klim.spring_security.model.Sensor;

import java.util.List;

public interface SensorService {
    Sensor findByName(String name);
    void save(Sensor sensor);

    public List<Sensor> searchBy(String name);
}
