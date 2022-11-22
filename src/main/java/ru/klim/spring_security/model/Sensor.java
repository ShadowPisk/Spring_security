package ru.klim.spring_security.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "sensors")
public class Sensor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @NotNull(message = "Name may not be null")
    @Size(max = 30)
    private String name;
    @NotNull
    @Size(max = 15)
    private String model;
    @Size(max = 40)
    private String location;
    @Size(max = 200)
    private String description;
    @ManyToOne(fetch = FetchType.LAZY)
    private Type type;

    private String typeName;
    private String unit;

    private Integer rangeMin;
    private Integer rangeMax;


    public Sensor() {
    }

    public Sensor(String name, String model, String location, String description, int rangeMin, int rangeMax) {
        this.name = name;
        this.model = model;
        this.location = location;
        this.description = description;
        this.rangeMin = rangeMin;
        this.rangeMax = rangeMax;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getUnit() {
        return type.getUnit();
    }

    public void setUnit(String unit) {this.unit = unit;}

    public int getRangeMin() {
        return rangeMin;
    }

    public void setRangeMin(int rangeMin) {
        this.rangeMin = rangeMin;
    }

    public int getRangeMax() {
        return rangeMax;
    }

    public void setRangeMax(int rangeMax) {
        this.rangeMax = rangeMax;
    }

    @Override
    public String toString() {
        return name + model + location + description + type.getName() + type.getUnit() + rangeMin.toString() + rangeMax.toString() ;
    }
}
