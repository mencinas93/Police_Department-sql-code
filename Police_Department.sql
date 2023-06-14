drop table if exists Rank CASCADE;
drop table if exists Stations CASCADE;
drop table if exists Speciality CASCADE;
drop table if exists Vehciels CASCADE;
drop table if exists Body_Cameras CASCADE;
drop table if exists Citations CASCADE;
drop table if exists Offenders CASCADE;
drop table if exists Offense CASCADE;
drop table if exists Case_Reports CASCADE;
drop table if exists Court CASCADE;


create table Rank
(
    Rank_ID serial PRIMARY KEY,
    Rank_Title varchar(30) not null,
    Salary decimal(10,2)
);

create table Stations
(
    Patrol_Station_ID serial PRIMARY key,
    Station_Name varchar(20) not null,
    Phone char(10),
    Station_Address varchar(30),
    City varchar(20)
);

create table Speciality
(
    Speciality_ID serial PRIMARY KEY,
    Speciality_Skill Varchar(20)
);

create table Vehicles
(
    Vehicle_ID serial PRIMARY KEY,
    Color varchar(15),
    Car_Year char(4),
    Brand varchar(20),
    Model varchar(20),
    Registration_State char(2),
    Registration_Expires Date
    
);

create table Body_Cameras
(
    Body_Camera_ID serial PRIMARY KEY,
    Brand varchar(20)
);

Create table Offenders
(
    Offender_ID serial PRIMARY KEY,
    First_Name varchar(30) not null,
    Last_Name varchar (30) not null,
    Phone char (10),
    Offender_Address varchar (30),
    State char (2),
    D.O.B. Date,
    License varchar(20),
    License_State char(20)
);

create table Offense 
(
    Offense_ID serial PRIMARY KEY,
    Offense_Name varchar (30) not null,
    Offense_Category varchar(10) not null
);

create table Citations
(
    Citation_Book_ID serial PRIMARY KEY,
    Citation_Number varchar(7),
);

create table Sworn_Employees
(
    Employee_ID serial PRIMARY KEY,
    Patrol_Station_ID smallint,
    Rank_ID smallint,
    First_Name varchar(20) not null,
    Last_Name varchar(20) not null,
    Phone char(10),
    Employee_Address varchar(30),
    City varchar(20),
    State char(2),
    D.O.B. Date,
    Body_Camera_ID smallint,
    Vehicle_ID smallint,
    Citation_Book_ID smallint,
    Speciality_ID smallint,
    constraint FK_E_Patrol_Station_ID 
    foreign key (FK_E_Patrol_Station_ID) references Stations(Patrol_Station_ID),
    constraint 
);


create table Case_Reports
(
    Case_Report_ID serial PRIMARY KEY,
  

)