package ru.klim.spring_security.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.klim.spring_security.model.Sensor;
import ru.klim.spring_security.repository.SensorRepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class SensorServiceImpl implements SensorService {
    @Autowired
    private SensorRepository sensorRepository;

    @Override
    public void save(Sensor sensor) {
        sensorRepository.save(sensor);
    }

    @Override
    public Sensor findByName(String name) {
        return sensorRepository.findSensorByName(name);
    }

    @Override
    public List<Sensor> searchBy(String text) {
        List<Sensor> resultSet = new ArrayList<>();
        for (Sensor sensor :
                sensorRepository.findAll()) {
            if (sensor.toString().toUpperCase().contains(text.toUpperCase())) {
                resultSet.add(sensor);
            }
        }
        return resultSet;
    }
}