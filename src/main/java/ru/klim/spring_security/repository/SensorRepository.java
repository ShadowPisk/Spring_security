package ru.klim.spring_security.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.klim.spring_security.model.Sensor;

import java.util.Optional;

public interface SensorRepository extends JpaRepository<Sensor, Long> {
    Sensor findSensorByName(String name);

    Optional<Sensor> findSensorById(Long id);


}
