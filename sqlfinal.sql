CREATE TABLE invoice_guest(
invoice_id INT,
invoice DECIMAL(12),
PRIMARY KEY(invoice_id));
CREATE TABLE reservation_status(
status_id INT,
status VARCHAR(32),
PRIMARY KEY (status_id));
CREATE TABLE reservation(
reservation_id INT,
status_id INT,
PRIMARY KEY (reservation_id),
FOREIGN KEY (status_id)
	REFERENCES reservation_status (status_id));
CREATE TABLE guest (
guest_id INT,
guest_fname VARCHAR(12),
guest_lname VARCHAR(20),
reservation_id INT,
invoice_id INT,
PRIMARY KEY (guest_id),
FOREIGN KEY (reservation_id)
	REFERENCES reservation(reservation_id),
FOREIGN KEY (invoice_id)
	REFERENCES invoice_guest(invoice_id));
CREATE TABLE room_type(
type_id INT,
type VARCHAR (12),
invoice_id INT,
PRIMARY KEY (type_id),
FOREIGN KEY (invoice_id)
	REFERENCES invoice_guest (invoice_id));
CREATE TABLE room(
room_id INT,
capacity DECIMAL(5),
type_id INT,
guest_id INT,
PRIMARY KEY (room_id),
FOREIGN KEY (type_id)
	REFERENCES room_type (type_id),
FOREIGN KEY (guest_id)
	REFERENCES guest (guest_id));
CREATE TABLE hotel (
hotel_id INT,
hotel_quality VARCHAR(12),
capacity DECIMAL(32),
room_id INT,
PRIMARY KEY (hotel_id),
FOREIGN KEY (room_id)
	REFERENCES room (room_id));
CREATE TABLE company (
company_id INT,
hotel_id INT,
PRIMARY KEY (company_id),
FOREIGN KEY (hotel_id)
	REFERENCES hotel(hotel_id));
CREATE TABLE city (
city_id INT,
postal_code DECIMAL(12),
company_id INT,
PRIMARY KEY (city_id) ,
FOREIGN KEY (company_id)
	REFERENCES company (company_id));
CREATE TABLE country(
country_id INT,
city_id INT,
PRIMARY KEY (country_id),
FOREIGN KEY (city_id)
	REFERENCES city (city_id));
ALTER TABLE country drop column city_id;
ALTER TABLE guest add column phone_number decimal (11);
ALTER TABLE room drop column capacity;
ALTER TABLE hotel drop column hotel_quality;
ALTER TABLE hotel add column hotel_stars decimal(5);
insert into invoice_guest (invoice_id, invoice) values (101, '16576');
insert into invoice_guest (invoice_id, invoice) values (102, '23145');
insert into invoice_guest (invoice_id, invoice) values (103, '10524');
insert into invoice_guest (invoice_id, invoice) values (104, '68639');
insert into invoice_guest (invoice_id, invoice) values (105, '55432');
insert into invoice_guest (invoice_id, invoice) values (106, '28724');
insert into invoice_guest (invoice_id, invoice) values (107, '73947');
insert into invoice_guest (invoice_id, invoice) values (108, '54867');
insert into invoice_guest (invoice_id, invoice) values (109, '29762');
insert into invoice_guest (invoice_id, invoice) values (110, '35314');
2)insert into reservation_status (status_id, status) values (111, true);
insert into reservation_status (status_id, status) values (112, true);
insert into reservation_status (status_id, status) values (113, false);
insert into reservation_status (status_id, status) values (114, true);
insert into reservation_status (status_id, status) values (115, true);
insert into reservation_status (status_id, status) values (116, true);
insert into reservation_status (status_id, status) values (117, true);
insert into reservation_status (status_id, status) values (118, true);
insert into reservation_status (status_id, status) values (119, true);
insert into reservation_status (status_id, status) values (120, false);
3)insert into reservation (reservation_id, status_id) values (11, 111);
insert into reservation (reservation_id, status_id) values (12, 112);
insert into reservation (reservation_id, status_id) values (13, 113);
insert into reservation (reservation_id, status_id) values (14, 114);
insert into reservation (reservation_id, status_id) values (15, 115);
insert into reservation (reservation_id, status_id) values (16, 116);
insert into reservation (reservation_id, status_id) values (17, 117);
insert into reservation (reservation_id, status_id) values (18, 118);
insert into reservation (reservation_id, status_id) values (19, 119);
insert into reservation (reservation_id, status_id) values (20, 120);
4)insert into guest (guest_id, guest_fname, guest_lname, reservation_id, invoice_id) values (1, 'Caryl', 'Lisett', 11, 101);
insert into guest (guest_id, guest_fname, guest_lname, reservation_id, invoice_id) values (2, 'Hazel', 'Fullstone', 12, 102);
insert into guest (guest_id, guest_fname, guest_lname, reservation_id, invoice_id) values (3, 'Bay', 'Cowterd', 13, 103);
insert into guest (guest_id, guest_fname, guest_lname, reservation_id, invoice_id) values (4, 'Una', 'Faltskog', 14, 104);
insert into guest (guest_id, guest_fname, guest_lname, reservation_id, invoice_id) values (5, 'Rosina', 'Toon', 15, 105);
insert into guest (guest_id, guest_fname, guest_lname, reservation_id, invoice_id) values (6, 'Marlo', 'Alpe', 16, 106);
insert into guest (guest_id, guest_fname, guest_lname, reservation_id, invoice_id) values (7, 'Mandi', 'Boutflour', 17, 107);
insert into guest (guest_id, guest_fname, guest_lname, reservation_id, invoice_id) values (8, 'Frazier', 'Losel', 18, 108);
insert into guest (guest_id, guest_fname, guest_lname, reservation_id, invoice_id) values (9, 'Thaddeus', 'Sexstone', 19, 109);
insert into guest (guest_id, guest_fname, guest_lname, reservation_id, invoice_id) values (10, 'Edmon', 'Haresnaip', 20, 110);
5)insert into room_type (type_id, type, invoice_id) values (41, 'simple', 101);
insert into room_type (type_id, type, invoice_id) values (42, 'simple', 102);
insert into room_type (type_id, type, invoice_id) values (43, 'simple', 103);
insert into room_type (type_id, type, invoice_id) values (44, 'luxury', 104);
insert into room_type (type_id, type, invoice_id) values (45, 'luxury', 105);
insert into room_type (type_id, type, invoice_id) values (46, 'simple', 106);
insert into room_type (type_id, type, invoice_id) values (47, 'luxury', 107);
insert into room_type (type_id, type, invoice_id) values (48, 'luxury', 108);
insert into room_type (type_id, type, invoice_id) values (49, 'simple', 109);
insert into room_type (type_id, type, invoice_id) values (50, 'simple', 110);
6)insert into room (room_id, capacity, type_id, guest_id) values (2, 3, 42, 2);
insert into room (room_id, capacity, type_id, guest_id) values (3, 5, 43, 3);
insert into room (room_id, capacity, type_id, guest_id) values (4, 2, 44, 4);
insert into room (room_id, capacity, type_id, guest_id) values (5, 2, 45, 5);
insert into room (room_id, capacity, type_id, guest_id) values (6, 4, 46, 6);
insert into room (room_id, capacity, type_id, guest_id) values (7, 2, 47, 7);
insert into room (room_id, capacity, type_id, guest_id) values (8, 2, 48, 8);
insert into room (room_id, capacity, type_id, guest_id) values (9, 4, 49, 9);
insert into room (room_id, capacity, type_id, guest_id) values (10, 2, 50, 10);
7)insert into hotel (hotel_id, hotel_quality, capacity, room_id) values (71, 4, 175, 1);
insert into hotel (hotel_id, hotel_quality, capacity, room_id) values (72, 3, 102, 2);
insert into hotel (hotel_id, hotel_quality, capacity, room_id) values (73, 4, 208, 3);
insert into hotel (hotel_id, hotel_quality, capacity, room_id) values (74, 5, 377, 4);
insert into hotel (hotel_id, hotel_quality, capacity, room_id) values (75, 5, 188, 5);
insert into hotel (hotel_id, hotel_quality, capacity, room_id) values (76, 3, 246, 6);
insert into hotel (hotel_id, hotel_quality, capacity, room_id) values (77, 5, 132, 7);
insert into hotel (hotel_id, hotel_quality, capacity, room_id) values (78, 5, 293, 8);
insert into hotel (hotel_id, hotel_quality, capacity, room_id) values (79, 5, 358, 9);
insert into hotel (hotel_id, hotel_quality, capacity, room_id) values (80, 4, 280, 10);
8)insert into company (company_id, hotel_id) values (1, 71);
insert into company (company_id, hotel_id) values (2, 72);
insert into company (company_id, hotel_id) values (3, 73);
insert into company (company_id, hotel_id) values (4, 74);
insert into company (company_id, hotel_id) values (5, 75);
insert into company (company_id, hotel_id) values (6, 76);
insert into company (company_id, hotel_id) values (7, 77);
insert into company (company_id, hotel_id) values (8, 78);
insert into company (company_id, hotel_id) values (9, 79);
insert into company (company_id, hotel_id) values (10, 80);
9)insert into city (city_id, postal_code, company_id) values (1, null, 1);
insert into city (city_id, postal_code, company_id) values (2, '2325', 2);
insert into city (city_id, postal_code, company_id) values (3, '34400000', 3);
insert into city (city_id, postal_code, company_id) values (4, '4890372', 4);
insert into city (city_id, postal_code, company_id) values (5, null, 5);
insert into city (city_id, postal_code, company_id) values (6, '5507', 6);
insert into city (city_id, postal_code, company_id) values (7, '9921202', 7);
insert into city (city_id, postal_code, company_id) values (8, '215807', 8);
insert into city (city_id, postal_code, company_id) values (9, '25187', 9);
insert into city (city_id, postal_code, company_id) values (10, '92883', 10);
10)insert into country (country_id, city_id) values (1111, 1);
insert into country (country_id, city_id) values (1112, 2);
insert into country (country_id, city_id) values (1113, 3);
insert into country (country_id, city_id) values (1114, 4);
insert into country (country_id, city_id) values (1115, 5);
insert into country (country_id, city_id) values (1116, 6);
insert into country (country_id, city_id) values (1117, 7);
insert into country (country_id, city_id) values (1118, 8);
insert into country (country_id, city_id) values (1119, 9);
insert into country (country_id, city_id) values (1120, 10);
update invoice_guest set  invoice = 20000 where invoice_id = 103;
update reservation_status set status = false where status_id = 111;
update city set postal_code = 130000 where city_id=8;
update hotel set capacity = 300 where hotel_id = 73;
update room_type set type = 'luxury' where type_id =41;
update city set postal_code = 333000 where city_id = 1;
update reservation_status set status = true where status_id = 120; 
update room_type set type = 'simple' where type_id =44;
update hotel set hotel_stars = 5 where hotel_id = 78;
update invoice_guest set  invoice = 230000 where invoice_id = 108;

delete from country where country_id  =1112;
delete from company where company_id  =1;
delete from city where postal_code  ='9921202';
delete from hotel where capacity  =377;
delete from room where type_id  =42;
delete from country where country_id  =1114;
delete from city where city_id  =10;
delete from company where company_id  =10;
delete from hotel where capacity  =280;
delete from room where type_id  =50;
SELECT guest_fname, guest_lname, room_id FROM guest INNER JOIN room ON guest.guest_id = room.guest_id
select distinct type, count   (*) from room_type group by type_id   
select type, invoice from invoice_guest join room_type on invoice_guest.invoice_id=room_type.invoice_id where type <> 'luxury'
select round (avg (invoice),2 ) from invoice_guest 
select hotel_stars, hotel.capacity from room inner join hotel on room.room_id=hotel.room_id where hotel.capacity < 300;