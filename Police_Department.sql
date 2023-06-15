drop table if exists Rank CASCADE;
drop table if exists Stations CASCADE;
drop table if exists Speciality CASCADE;
drop table if exists Vehicles CASCADE;
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
    Citation_Number varchar(7)
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
    foreign key (Patrol_Station_ID) references Stations(Patrol_Station_ID),
    constraint FK_E_Rank_ID
    foreign key (Rank_ID) references Rank(Rank_ID),
    constraint FK_E_Body_Camera_ID 
    foreign key (Body_Camera_ID) references Body_Cameras(Body_Camera_ID),
    constraint FK_E_Vehicle_ID
    foreign key(Vehicle_ID) references Vehicles(Vehicle_ID),
    constraint E_Citation_ID
    foreign key (Citation_Book_ID) references Citations(Citation_Book_ID),
    constraint E_Speciality 
    foreign key (Speciality_ID) references Speciality(Speciality_ID)
    );


create table Case_Reports
(
    Case_Report_ID serial PRIMARY KEY,
    Employee_ID smallint,
    Offense_ID smallint,
    Citation_Book_ID smallint,
    Offender_ID smallint,
    Date_Occurred DATE,
    Time_Occurred timestamp,
    Location_Address varchar(30) not null,
    Locate_City varchar(30) not null,
    Location_State char(2) not null,
    constraint FK_E_Employee_ID
    foreign key (Employee_ID) references Sworn_Employees(Employee_ID),
    constraint FK_Case_Offense_ID 
    foreign key (Offense_ID) references Offense(Offense_ID),
    constraint FK_C_Citation_ID
    foreign key (Citation_Book_ID) references Citations(Citation_Book_ID),
    constraint FK_C_Offender_ID
    foreign key (Offender_ID) references Offenders (Offender_ID)

);

create table Court
(
    Court_ID serial PRIMARY KEY,
    Case_Report_ID smallint,
    Court_Date DATE not null,
    Court_Time timestamp not null,
    Court_Name varchar(30) not null,
    Court_Address varchar(30) not null,
    Phone char(10),
    constraint C_Case_Report_ID
    foreign key (Case_Report_ID) references Case_Reports(Case_Report_ID)
);