create database DBMS ;
use DBMS;

create table Seminar(
Seminar_code varchar(10) primary key,
Seminar_name varchar(60) not null,
Seminar_date date not null,
Subjectcode varchar(15) not null,
foreign key(Subjectcode) references Subject(Subject_code)
);
	
insert into Seminar values ('S1001','Upcoming Projects of SpaceX and STARSHIP','2022-12-03','Subject1001');
insert into Seminar values ('S1002','Upcoming Projects of Tesla and Cybertruck 2.0','2022-12-04','Subject1001');
insert into Seminar values ('S1003','Depletion of Environment and Human Contibution','2022-12-05','Subject1002');
insert into Seminar values ('S1004','Ways to restore Human-Environment Balance','2022-12-06','Subject1002');
insert into Seminar values ('S1005','Global Affairs and its affect on World Economy','2022-12-07','Subject1003');
insert into Seminar values ('S1006','Recession and affect of Inflation','2022-12-08','Subject1003');

select * from Seminar;

create table Subject(
Subject_code varchar(15) primary key,
Subject_topic varchar(30) not null,
Speaker_name varchar(30) not null,
Speaker_designation varchar(50) not null
);

insert into Subject values ('Subject1001','Tesla And SpaceX','Elon Musk','CEO of Tesla and CEO of SpaceX');
insert into Subject values ('Subject1002','Environmental Damage','Alfie Norris','CEO of Everglades Restoration');
insert into Subject values ('Subject1003','World Economy','Will West','HR Manager at Global Affairs Monitor');

select * from Subject;

create table Venue(
Venue_code varchar(10) primary key,
Venue_name varchar(40) not null,
Capacity int not null,
Airconditioner_flag int not null,
Parking_flag int not null,
Citycode varchar(10) not null,
foreign key(Citycode) references City(City_code)
);

insert into Venue values ('V1001','Macys 4th of July Fireworks',15000,1,1,'C1001');
insert into Venue values ('V1002','Fiesta Braodway',14000,1,1,'C1001');
insert into Venue values ('V1003','The Pearl',13000,1,1,'C1002');
insert into Venue values ('V1004','Marigold Event Space',13500,1,1,'C1002');
insert into Venue values ('V1005','Harbor View Loft',15000,1,1,'C1003');
insert into Venue values ('V1006','Ultimate Skybox at Diamondview Tower',15000,1,1,'C1003');

select * from Venue;

create table City(
City_code varchar(10) primary key,
City_name varchar(30) not null
);

insert into city values ('C1001','Los Angeles');
insert into city values ('C1002','San Fransisco');
insert into city values ('C1003','San Diego');
select * from city;


create table Members(
Member_code varchar(10) primary key,
Member_name varchar(40) not null,
Designation varchar(30) not null,
Age int not null
);

insert into Members values('M1001','Osbert Ingram','Event Manager',28);
insert into Members values('M1002','Mandy Hodges','HR Co-ordinator',30);
insert into Members values('M1003','Jasmine Jarvis','Social Media Manager',26);
insert into Members values('M1004','Howard Lawson','Marketing Co-ordinator',28);
insert into Members values('M1005','Brooke Warren','Activities Director',30);

select * from Members;

create table Organized_activities(
OA_code varchar(10) primary key,
OA_name varchar(50) not null,
Membercode varchar(10) not null,
foreign key (Membercode) references Members(Member_code)
);

insert into Organized_activities values('OA1001','Introduction fields on work based on seminars','M1002');
insert into Organized_activities values('OA1002','Marketing in the Future - Workshop','M1004');
insert into Organized_activities values('OA1003','Interaction on Efficient Event Co-ordination','M1005');
insert into Organized_activities values('OA1004','Resource Handling and Team Management','M1001');
insert into Organized_activities values('OA1005','Importance of Social Media Marketing','M1003');

select * from Organized_activities;


Create table Applicant(
Applicant_code varchar(10) primary key,
Applicant_name varchar(40) not null,
Applicant_email varchar(40) not null,
OAcode varchar(10) not null,
foreign key(OAcode) references Organized_activities(OA_code)
);

insert into Applicant values ('A1001','Bob Horton','Bobhorton@gmail.com','OA1002');
insert into Applicant values ('A1002','Prunella Rehbein','Prunella50490@gmail.com','OA1003');
insert into Applicant values ('A1003','Alice Wade','Alicewade1990@gmail.com','OA1004');
insert into Applicant values ('A1004','Alexander Kemp','KempAlexander@gmail.com','OA1001');
insert into Applicant values ('A1005','Priscilla Lucas','PriscillaLucas@gmail.com','OA1002');
insert into Applicant values ('A1006','Isaiah Richards','TtsIsaiahRichards@gmail.com','OA1001');
insert into Applicant values ('A1007','Beata Oliver','BeataOliver2000@gmail.com','OA1003');
insert into Applicant values ('A1008','Hector Curry','1999HectorCurry@gmail.com','OA1005');
insert into Applicant values ('A1009','Cedric Malone','Cedricmalone@gmail.com','OA1001');
insert into Applicant values ('A1010','Philip Guzman','PhilipGuzman@gmail.com','OA1005');

select * from Applicant;


create table Booking(
Booking_code varchar(10) primary key,
Booking_name varchar(40) not null,
Booking_date date not null,
Demand_draft_numnber int not null,
Applicationcode varchar(10) not null,
foreign key (Applicationcode) references Applicant(Applicant_code)
);

insert into Booking values ('B1000','Bob Horton','2022-12-05',123456789,'A1001');
insert into Booking values ('B1001','Alexander Kemp','2022-12-06',234567891,'A1004');
insert into Booking values ('B1002','Cedric Malone','2022-12-05',345678912,'A1009');
insert into Booking values ('B1003','Prunella Rehbein','2022-12-05',456789123,'A1002');
insert into Booking values ('B1004','Hector Curry','2022-12-03',567891234,'A1008');
insert into Booking values ('B1005','Priscilla Lucas','2022-12-04',678912345,'A1005');
insert into Booking values ('B1006','Beata Oliver','2022-12-05',789123456,'A1007');
insert into Booking values ('B1007','Alice Wade','2022-12-07',891234567,'A1003');

select* from Booking;


#For getting to know which Member has orgasized which activities use following query 
#1 {By using direct search or nested query}
select OA_code,OA_name from Organized_activities
where Membercode = (select Member_code from Members where Member_name='Mandy Hodges');
#2 {By using join statements}
select OA_code,OA_name,Member_name from Organized_activities RIGHT join Members
on Members.Member_code = Organized_activities.Membercode;

#For getting to know all details of applicants who have signed up for a specific member's Organized activity
select OAcode,Applicant_code,Applicant_name,Applicant_email from Applicant where OAcode = 
(Select OA_code from organized_activities where Membercode =
(select Member_code from Members where Member_name = 'Mandy Hodges'));

#For checking booking for a specific Event/Organized Activity on a specified date
Select * from booking where Booking_date = '2022-12-05';

#For checking booking details of a specific Organized activity
Select * from booking where Applicationcode in 
(select Applicant_code from Applicant where OAcode in 
(select OA_code from Organized_activities where OA_name = 'Introduction fields on work based on seminars'));
