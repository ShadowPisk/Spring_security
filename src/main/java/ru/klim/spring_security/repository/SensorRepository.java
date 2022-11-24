package ru.klim.spring_security.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
//import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import ru.klim.spring_security.model.Sensor;

import java.util.List;
import java.util.Optional;

public interface SensorRepository extends PagingAndSortingRepository<Sensor, Long> {
    Sensor findSensorByName(String name);

    Optional<Sensor> findSensorById(Long id);

    Page<Sensor> findAll(Pageable pageable);

    List<Sensor> findAll();


}
