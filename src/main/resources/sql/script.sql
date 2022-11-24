

INSERT INTO `table_task`.`role` (`id`, `name`) VALUES ('1', 'ROLE_ADMIN');
INSERT INTO `table_task`.`role` (`id`, `name`) VALUES ('2', 'ROLE_USER');


INSERT INTO `table_task`.`user` (`id`, `password`, `username`) VALUES ('1', 'admin', 'admin');
INSERT INTO `table_task`.`user` (`id`, `password`, `username`) VALUES ('2', 'user', 'user');


INSERT INTO `table_task`.`user_roles` (`users_id`, `roles_id`) VALUES ('1', '1');
INSERT INTO `table_task`.`user_roles` (`users_id`, `roles_id`) VALUES ('2', '2');


INSERT INTO `table_task`.`types` (`id`, `name`, `unit`) VALUES ('1', 'Pressure', 'bar');
INSERT INTO `table_task`.`types` (`id`, `name`, `unit`) VALUES ('2', 'Voltage', 'voltage');
INSERT INTO `table_task`.`types` (`id`, `name`, `unit`) VALUES ('3', 'Temperature', '°С');
INSERT INTO `table_task`.`types` (`id`, `name`, `unit`) VALUES ('4', 'Humidity', '%');

INSERT INTO `table_task`.`sensors` (`id`, `description`, `location`, `model`, `name`, `range_max`, `range_min`, `type_name`, `unit`, `type_id`) VALUES ('1', 'Description 1', 'Room1', '14DPS', 'Sensor1', '33', '45', 'Pressure', 'bar', '2');
INSERT INTO `table_task`.`sensors` (`id`, `description`, `location`, `model`, `name`, `range_max`, `range_min`, `type_name`, `unit`, `type_id`) VALUES ('2', 'Description 2', 'Room2', 'P81SD', 'Sensor2', '210', '230', 'Voltage', 'voltage', '2');
INSERT INTO `table_task`.`sensors` (`id`, `description`, `location`, `model`, `name`, `range_max`, `range_min`, `type_name`, `unit`, `type_id`) VALUES ('3', 'Description 3', 'Room3', 'F12PP', 'Sensor3', '46', '98', 'Temperature', '°С', '2');
INSERT INTO `table_task`.`sensors` (`id`, `description`, `location`, `model`, `name`, `range_max`, `range_min`, `type_name`, `unit`, `type_id`) VALUES ('4', 'Description 4', 'Room4', 'AA84S', 'Sensor4', '0', '100', 'Humidity', '%', '2');
INSERT INTO `table_task`.`sensors` (`id`, `description`, `location`, `model`, `name`, `range_max`, `range_min`, `type_name`, `unit`, `type_id`) VALUES ('5', 'Description 5', 'Room3', 'B22CZ', 'Sensor5', '18', '36', 'Pressure', 'bar', '2');
INSERT INTO `table_task`.`sensors` (`id`, `description`, `location`, `model`, `name`, `range_max`, `range_min`, `type_name`, `unit`, `type_id`) VALUES ('6', 'Description 6', 'Room2', '2P31S', 'Sensor6', '33', '45', 'Voltage', 'voltage', '2');
INSERT INTO `table_task`.`sensors` (`id`, `description`, `location`, `model`, `name`, `range_max`, `range_min`, `type_name`, `unit`, `type_id`) VALUES ('7', 'Description 7', 'Room1', 'ATOM', 'Sensor7', '45', '90', 'Temperature', '°С', '2');
INSERT INTO `table_task`.`sensors` (`id`, `description`, `location`, `model`, `name`, `range_max`, `range_min`, `type_name`, `unit`, `type_id`) VALUES ('8', 'Description 8', 'Room2', 'ZEUS', 'Sensor8', '0', '45', 'Humidity', '%', '2');
INSERT INTO `table_task`.`sensors` (`id`, `description`, `location`, `model`, `name`, `range_max`, `range_min`, `type_name`, `unit`, `type_id`) VALUES ('9', 'Description 9', 'Room3', 'ATLAS-M', 'Sensor9', '33', '40', 'Pressure', 'bar', '2');
INSERT INTO `table_task`.`sensors` (`id`, `description`, `location`, `model`, `name`, `range_max`, `range_min`, `type_name`, `unit`, `type_id`) VALUES ('10', 'Description 10', 'Room4', 'MAD-3S', 'Sensor10', '14', '16', 'Voltage', 'voltage', '2');
INSERT INTO `table_task`.`sensors` (`id`, `description`, `location`, `model`, `name`, `range_max`, `range_min`, `type_name`, `unit`, `type_id`) VALUES ('11', 'Description 11', 'Room3', '3PLS', 'Sensor11', '20', '45', 'Temperature', '°С', '2');
INSERT INTO `table_task`.`sensors` (`id`, `description`, `location`, `model`, `name`, `range_max`, `range_min`, `type_name`, `unit`, `type_id`) VALUES ('12', 'Description 12', 'Room2', 'ZERO', 'Sensor12', '0', '71', 'Humidity', '%', '2');