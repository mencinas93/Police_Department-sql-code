BEGIN;

DROP TABLE IF EXISTS Court CASCADE;
DROP TABLE IF EXISTS Case_Reports CASCADE;
DROP TABLE IF EXISTS Sworn_Employees CASCADE;
DROP TABLE IF EXISTS Offense CASCADE;
DROP TABLE IF EXISTS Offenders CASCADE;
DROP TABLE IF EXISTS Body_Cameras CASCADE;
DROP TABLE IF EXISTS Vehicles CASCADE;
DROP TABLE IF EXISTS Speciality CASCADE;
DROP TABLE IF EXISTS Stations CASCADE;
DROP TABLE IF EXISTS Rank CASCADE;


create table Rank
(
    Rank_ID serial PRIMARY KEY,
    Rank_Title varchar(30) not null,
    Salary decimal(10,2)
);

CREATE INDEX Index_Rank_Titles ON Rank (Rank_Title);


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
    Speciality_Skill Varchar(30) not null
);

create table Vehicles
(
    Vehicle_ID serial PRIMARY KEY,
    Plate_Number varchar(6) UNIQUE not null,
    Color varchar(15),
    Car_Year char(4) not null,
    Make_and_Model varchar(20) not null,
    Registration_State char(2) not null,
    Registration_Expires Date
);

CREATE INDEX Index_Plate_Number ON Vehicles (Plate_Number);


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
    Date_Of_Birth Date,
    License varchar(20),
    License_State char(20)
);

CREATE INDEX Infex_Offenders_FirstName_LastName ON Offenders (First_Name, Last_Name);


create table Offense 
(
    Offense_ID serial PRIMARY KEY,
    Offense_Name varchar (60) not null,
    Offense_Category varchar(10) not null,
);

CREATE INDEX INDEX_Offense_Category ON Offense (Offense_Category);


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
    Date_Of_Birth Date not null,
    Body_Camera_ID smallint,
    Vehicle_ID smallint,
    Speciality_ID smallint,
    constraint FK_E_Patrol_Station_ID 
    foreign key (Patrol_Station_ID) references Stations(Patrol_Station_ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    constraint FK_E_Rank_ID
    foreign key (Rank_ID) references Rank(Rank_ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    constraint FK_E_Body_Camera_ID 
    foreign key (Body_Camera_ID) references Body_Cameras(Body_Camera_ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    constraint FK_E_Vehicle_ID
    foreign key(Vehicle_ID) references Vehicles(Vehicle_ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    constraint E_Speciality 
    foreign key (Speciality_ID) references Speciality(Speciality_ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    constraint UC_SwornEmployees_BodyCamera UNIQUE (Body_Camera_ID),
    constraint UC_SwornEmployees_Vehicle UNIQUE (Vehicle_ID)
    );

CREATE INDEX Index_SwornEmployees_FirstName_LastName ON Sworn_Employees (First_Name, Last_Name);
CREATE INDEX FK_E_Patrol_Station_ID ON Sworn_Employees (Patrol_Station_ID);
CREATE INDEX FK_E_Rank_ID ON Sworn_Employees (Rank_ID);
CREATE INDEX FK_E_Body_Camera_ID ON Sworn_Employees (Body_Camera_ID);
CREATE INDEX FK_E_Vehicle_ID ON Sworn_Employees (Vehicle_ID);


create table Case_Reports
(
    Case_Report_ID serial PRIMARY KEY,
    Employee_ID smallint,
    Offense_ID smallint,
    Offender_ID smallint,
    Date_Occurred DATE,
    Time_Occurred timestamp,
    Location_Address varchar(30) not null,
    Locate_City varchar(30) not null,
    Location_State char(2) not null,
    constraint FK_E_Employee_ID
    foreign key (Employee_ID) references Sworn_Employees(Employee_ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    constraint FK_Case_Offense_ID 
    foreign key (Offense_ID) references Offense(Offense_ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    constraint FK_C_Offender_ID
    foreign key (Offender_ID) references Offenders (Offender_ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    INDEX Index_Employee_ID (Employee_ID),
    INDEX Index_Offense_ID (Offense_ID),
    INDEX Index_Offender_ID (Offender_ID)
);

CREATE INDEX Index_Employee_ID ON Case_Reports (Employee_ID);
CREATE INDEX Index_Offense_ID ON Case_Reports (Offense_ID);
CREATE INDEX Index_Offender_ID ON Case_Reports (Offender_ID);

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
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    INDEX Index_Cases(Case_Report_ID)
);

CREATE INDEX Index_Cases ON Court (Case_Report_ID);

ROLLBACK;
