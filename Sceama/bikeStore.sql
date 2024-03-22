create database BikeStore;
use BikeStore;
--here i created  a table which  stores details of stores
create table Sales.stores(
store_id int IDENTITY(1,1) PRIMARY KEY,
store_name varchar(20) not null,
phoneNumber varchar(25)unique,
emil varchar(20) unique,
street varchar(25),
city VARCHAR (255),
state VARCHAR (10),
zip_code VARCHAR (5)
);
--here i created  a table which  stores details of staffs in store
create table Sales.staffs(
staff_id int identity(1,1) primary key,
fist_name varchar(255) not null,
last_name varchar(25) not null,
phoneNumber varchar(20)not null unique,
email varchar(20) unique not null,
active tinyint not null,
store_id int not null unique,
manager_id int  not null ,
foreign key (store_id) references Sales.stores(store_id),
foreign key (manager_id) references Sales.staffs(staff_id)
);
--here i created  a table which  stores details of coustmers of bike store
create table Sales.coustomer(
coustomer_id int identity(1,1) primary key,
firstName varchar(20) not null,
lastName varchar(20) ,
phoneNumber varchar(20) not null unique,
email varchar(30) not null unique,
street varchar(30) ,
city varchar(20),
state varchar(20),
pinode varchar(10) 
);
insert into Sales.coustomer values
('Rachel', 'Sanchez', '9990001110', 'rachel.sanchez@example.com', '123 Comet St', 'Jupitercity', 'CA', '76543'),
('Justin', 'Gomez', '1112223331', 'justin.gomez@example.com', '456 Saturn St', 'Plutoville', 'NY', '32109'),
('Kimberly', 'Rivera', '7778889992', 'kimberly.rivera@example.com', '789 Mars St', 'Uranuscity', 'FL', '65432'),
('Brandon', 'Torres', '4445556663', 'brandon.torres@example.com', '890 Venus St', 'Mercuryville', 'TX', '21098'),
('Megan', 'Peterson', '8889990004', 'megan.peterson@example.com', '123 Earth St', 'Neptunecity', 'CA', '87612'),
('Eric', 'Reyes', '3334445555', 'eric.reyes@example.com', '456 Pluto St', 'Satelliteville', 'AZ', '54321'),
('Brian', 'Hernandez', '8889990007', 'brian.hernandez@example.com', '456 Moon St', 'Meteorville', 'NV', '54321'),
('Laura', 'Lopez', '3334445558', 'laura.lopez@example.com', '789 Sun St', 'Nebulatown', 'WA', '98765'),
('Jason', 'Perez', '6667778889', 'jason.perez@example.com', '890 Galaxy St', 'Saturncity', 'TX', '23456'),
('Kevin', 'Rodriguez', '7778889995', 'kevin.rodriguez@example.com', '901 Apple St', 'Asteroidville', 'CA', '21098'),
('David', 'Clark', '9990001111', 'david.clark@example.com', '890 Cherry St', 'Starcity', 'NY', '23456'),
('Jennifer', 'Young', '3334445552', 'jennifer.young@example.com', '123 Kiwi St', 'Galaxytown', 'CA', '76543'),
('James', 'Lee', '6665554443', 'james.lee@example.com', '456 Mango St', 'Planetville', 'TX', '32109'),
('Stephanie', 'Gonzalez', '1112223334', 'stephanie.gonzalez@example.com', '789 Pear St', 'Universecity', 'FL', '65432'),
('Matthew', 'Martin', '7776665557', 'matthew.martin@example.com', '123 Plum St', 'Cloudcity', 'OH', '21098'),
('Nicole', 'Thompson', '2223334448', 'nicole.thompson@example.com', '890 Lemon St', 'Fogtown', 'OR', '87612'),
('Andrew', 'White', '8887776669', 'andrew.white@example.com', '456 Grape St', 'Raincity', 'WA', '54321'),
('Michelle', 'Harris', '4443332220', 'michelle.harris@example.com', '789 Banana St', 'Breezecity', 'TN', '98765'),
('Amanda', 'Moore', '5554443336', 'amanda.moore@example.com', '678 Peach St', 'Sunnytown', 'NC', '76543'),
('Christopher', 'Anderson', '1112223335', 'christophe@example.com', '345 Orange St', 'Anyville', 'MI', '43210'),
('Jessica', 'Wilson', '6667778884', 'jessica.wilson@example.com', '901 Pineapple St', 'Citytown', 'LA', '65432'),
('Sarah', 'Taylor', '3332221112', 'sarah.taylor@example.com', '456 Cedar St', 'Townville', 'CO', '87654'),
('Daniel', 'Miller', '9998887773', 'daniel.miller@example.com', '678 Walnut St', 'Villageville', 'GA', '34567'),
('Robert', 'Davis', '7778889991', 'robert.davis@example.com', '890 Birch St', 'Anothercity', 'AZ', '23456'),
('Emily', 'Jones', '4445556666', 'emily.jones@example.com', '567 Pine St', 'Othercity', 'WA', '98765'),
( 'John', 'Doe', '1234567890', 'john.doe@example.com', '123 Main St', 'Anytown', 'CA', '12345'),
('jayanth','v','949403405','vant@gmail',
'new siva','nellore','ap','524201');
;
select * from Sales.coustomer;
--here i created  a table which  stores details of 
--coustmers orders statusof bike store
create table Sales.orders(
order_id int identity(1,1)primary key,
order_date varchar(20) not null,
order_status varchar(20) not null,
shipped_date varchar(10) not null,
delvery_date varchar(10) not null,
store_id int ,staff_id int,coustomer_id int,
foreign key (store_id) references Sales.stores(store_id),
foreign key (staff_id) references Sales.staffs(staff_id),
foreign key (coustomer_id) references Sales.coustomer(coustomer_id)
);
--here i created  a table which  stores details of 
--coustmers order_items details of bike store
create table Sales.order_items(
order_id int not null,
item_id int not null unique,
product_id int unique,
quantity int not null,
price varchar(7)not null,
discount int not null
foreign key (order_id) references Sales.orders(order_id),
foreign key (product_id) references Production.products(product_id)
);
-- i created a table which stores the  what are the categories or models
--of bikes avabile  in store 
create table Production.models(
model_id int identity(1,1) primary key,
model_name varchar(20) not null
);
-- i created a table which stores the  what are the brands 
--of bikes avabile  in store 
create table Production.brands(
brand_id int identity(1,1) primary key,
brand_name varchar(20) not null unique,
count_of_bikes int not null
);
--i created a table which stores the  what are the products avabile
-- in store 
create table Production. products(
product_id int identity (1,1) primary key,
product_name varchar(20) not null,
brand_id int not null,
model_id int not null,
model_year varchar(4) not null,
price varchar(10) not null
foreign key (model_id) references Production.models(model_id),
foreign key (brand_id) references Production.brands(brand_id)
);
--i created a table which stores the  what are the brands 
--this table shows what are the products avabile in a particular store
create table Production.stocks(
store_id int not null,
product_id int not null,
quantity int not null
primary key (store_id,product_id),
foreign key (store_id) references Sales.stores(store_id),
foreign key (product_id) references Production.Products(product_id)
);
