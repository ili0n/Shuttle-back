-------------- Pseudo-enum tables

insert into vehicle_type(name, price_PerKM) values ('STANDARD', 40);
insert into vehicle_type(name, price_PerKM) values ('LUXURY', 80);
insert into vehicle_type(name, price_PerKM) values ('VAN', 60);
insert into role(name) values('passenger');
insert into role(name) values('driver');
insert into role(name) values('admin');

-------------- Users

insert into generic_user(email, password, enabled, blocked, active, name) values ('bob@gmail.com', '$2a$10$j2988SIGRINo0s4/F1ivJ.zBcyn39ap3sizeRs38z.zwzx9nxMpmm', true, false, true, 'Bob');
insert into generic_user(email, password, enabled, blocked, active, name) values ('john@gmail.com', '$2a$10$XrWH9VDQR2aCn9tThclQJOrNwhKYs525HG3X.9zI1MlG21F8mKw/2', true, false, false, 'John');
insert into generic_user(email, password, enabled, blocked, active, name) values ('troy@gmail.com', '$2a$10$RNBI5BuqlU8iUFoOCdeGc.V.afrcNyQSEs1t43JJ5TdXu9/wz86mi', true, false, false, 'Troy');
insert into generic_user(email, password, enabled, blocked, active, name) values ('admin@gmail.com', '$2a$10$GxRpGz0dRDEK52.VeoiDA.azoCStgfAZjficcK/El5hxKCDtUWHBm', true, false, false, 'Admin');
insert into user_role(user_id, role_id) values (1, 2);
insert into user_role(user_id, role_id) values (2, 1);
insert into user_role(user_id, role_id) values (3, 1);
insert into user_role(user_id, role_id) values (4, 3);
insert into driver(id, available, time_worked_today) values (1, true, 0);
insert into passenger(id) values (2);
insert into passenger(id) values (3);

--------------- Ride, location, etc.

insert into location(address, latitude, longitude) values ('AAAAAAAAAAAAAAAAAA', 24.267136, 39.833549);
insert into location(address, latitude, longitude) values ('BBBBBBBBBBBBBBBBBB', 25.267136, 30.833549);

insert into vehicle(driver_id, current_location_id, vehicle_type_id, baby_transport, pet_transport, passenger_seats) values(1, 1, 1, true, true, 1);

insert into route default values;
insert into route_locations(route_id, locations_id) values(1, 1);
insert into route_locations(route_id, locations_id) values(1, 2);
insert into ride(status, driver_id, route_id, vehicle_type_id, pet_transport, baby_transport, end_time) values (0, 1, 1, 1, true, false, CURRENT_TIMESTAMP);
insert into ride_passengers(ride_id, passengers_id) values (1, 2);
insert into ride_passengers(ride_id, passengers_id) values (1, 3);

--------------- Reports(?)


-- Rule of thumb: DON'T PUT CUSTOM IDs FOR ENTITIES THAT YOU WILL BE INSERTING MANUALLY
-- save(Entity) will use 'default' for ID. If you manually have ID 1,2,etc. used up here,
-- hibernate will throw primary key violation. Setting the ID manually for the Entity, in
-- code doesn't work either.
-- Which entites are OK to manually put IDs for: users (if any other table: ask first!!!)
--