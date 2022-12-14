package ru.klim.spring_security.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ru.klim.spring_security.model.Sensor;
import ru.klim.spring_security.model.User;
import ru.klim.spring_security.repository.SensorRepository;
import ru.klim.spring_security.repository.TypeRepository;
import ru.klim.spring_security.service.SecurityService;
import ru.klim.spring_security.service.SensorService;
import ru.klim.spring_security.service.UserService;
import ru.klim.spring_security.validator.UserValidator;

import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.Min;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private SensorService sensorService;

    @Autowired
    private SensorRepository sensorRepository;

    @Autowired
    private TypeRepository typeRepository;
    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());
        return "registration";
    }

    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/sensor/1";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null) model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null) model.addAttribute("message", "You have been logged ouy successfully.");
        return "login";
    }

    @GetMapping({"/{page}", "/sensor/{page}","/adminSensor/{page}"})
    public String welcome(HttpServletRequest httpServletRequest, Model model,Pageable pageable, @PathVariable(value = "page") @Min(1) int page) {
        pageable = PageRequest.of(0, 4);
        if (sensorRepository.findAll(pageable).getTotalPages()<=page){
            pageable = PageRequest.of(sensorRepository.findAll(pageable).getTotalPages() - 1, 4);
        }else pageable = PageRequest.of(page - 1, 4);
        List<Integer> pageList = new ArrayList<>();
        for (int i = 0; i < sensorRepository.findAll(pageable).getTotalPages(); i++) {
            pageList.add(i+1);
        }
        model.addAttribute("pages", sensorRepository.findAll(pageable).get().collect(Collectors.toList()));
        model.addAttribute("pageList", pageList);
        model.addAttribute("sensors", sensorRepository.findAll());
        model.addAttribute("type", typeRepository.findAll());
        if (httpServletRequest.isUserInRole("ROLE_ADMIN")) {
            return "adminSensor";
        }
        return "sensor";
    }

    @GetMapping({"/", "/sensor", "/adminSensor"})
    public String redirect(HttpServletRequest httpServletRequest, Model model) {
        if (httpServletRequest.isUserInRole("ROLE_ADMIN")) {
            return "redirect:/adminSensor/1";
        }
        return "redirect:/sensor/1";
    }

    @GetMapping("/adminSensor/addSensor")
    public String addSensor(Model model) {
        model.addAttribute("type", typeRepository.findAll());
        return "addSensor";
    }

    @PostMapping("/adminSensor/addSensor")
    public String registration(
             @RequestParam String name
            ,@RequestParam String model
            ,@RequestParam String location
            ,@RequestParam String description
            ,@RequestParam String type
            ,@RequestParam String unit
            ,@RequestParam int rangeMin
            ,@RequestParam int rangeMax) {
        Sensor sensor = new Sensor(name, model, location, description, rangeMin, rangeMax);
        sensor.setType(typeRepository.findTypeByName(type));
        sensor.setTypeName(typeRepository.findTypeByName(type).getName());
        sensor.setUnit(sensor.getType().getUnit());
        sensorService.save(sensor);
        return "redirect:/adminSensor";
    }

    @GetMapping("/adminSensor/{id}/editSensor")
    public String editSensor(@PathVariable(value = "id") Long id, Model model) {
        if (!sensorRepository.existsById(id)) {
            return "redirect:/adminSensor";
        }
        Optional<Sensor> sensor = sensorRepository.findById(id);
        ArrayList<Sensor> res = new ArrayList<>();
        sensor.ifPresent(res::add);
        model.addAttribute("sensor", res);
        model.addAttribute("type", typeRepository.findAll());
        return "editSensor";

    }

    @PostMapping("/adminSensor/{id}/editSensor")
    public String editSensorPost(
            @PathVariable Long id
            , @RequestParam String name
            , @RequestParam String model
            , @RequestParam String location
            , @RequestParam String description
            , @RequestParam String type
            , @RequestParam String unit
            , @RequestParam int rangeMin
            , @RequestParam int rangeMax
            , Model mod ) {
        Sensor sensor = sensorRepository.findById(id).orElseThrow();
        sensor.setName(name);
        sensor.setDescription(description);
        sensor.setModel(model);
        sensor.setLocation(location);
        sensor.setType(typeRepository.findTypeByName(type));
        sensor.setTypeName(typeRepository.findTypeByName(type).getName());
        sensor.setUnit(sensor.getType().getUnit());
        sensor.setRangeMax(rangeMax);
        sensor.setRangeMin(rangeMin);
        sensorService.save(sensor);
        return "redirect:/adminSensor";
    }

    @PostMapping("/adminSensor/{id}/remove")
    public String blogPostDelete(@PathVariable(value = "id") long id, Model model){
        Sensor sensor = sensorRepository.findById(id).orElseThrow();
        sensorRepository.delete(sensor);
        return "redirect:/adminSensor";
    }

    @GetMapping("/adminSensor/search")
    public String search(@RequestParam(value = "search") String search, Model model){
        if (sensorService.searchBy(search)!=null) {
            model.addAttribute("result", sensorService.searchBy(search));
        }
        return "search";
    }

    @GetMapping( "/sensor/search")
    public String searchUser(@RequestParam(value = "search") String search, Model model){
        if (sensorService.searchBy(search)!=null) {
            model.addAttribute("result", sensorService.searchBy(search));
        }
        return "searchUser";
    }

}
