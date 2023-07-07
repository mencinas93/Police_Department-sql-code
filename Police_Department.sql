
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
    City varchar(20),
    CONSTRAINT CHK_Stations_Name_Location CHECK (Station_Name IS NOT NULL AND Station_Address IS NOT NULL AND City IS NOT NULL)
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
    Registration_Expires Date,
    CONSTRAINT CHK_Vehicle_PlateYearMakeModel CHECK (Plate_Number IS NOT NULL AND 
    Car_Year IS NOT NULL AND Make_and_Model IS NOT NULL)
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
    License_State char(20),
    CONSTRAINT CHK_Offender_Name_DateOfBirth
    CHECK (First_Name IS NOT NULL AND Last_Name IS NOT NULL AND Date_Of_Birth IS NOT NULL)
);

CREATE INDEX Infex_Offenders_FirstName_LastName ON Offenders (First_Name, Last_Name);


create table Offense 
(
    Offense_ID serial PRIMARY KEY,
    Offense_Name varchar (60) not null,
    Offense_Category varchar(10) not null,
    CONSTRAINT CHK_Offense CHECK (Offense_Name IS NOT NULL AND Offense_Category IS NOT NULL)
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
    constraint UC_SwornEmployees_Vehicle UNIQUE (Vehicle_ID),
    CONSTRAINT CHK_SwornEmployee_Name_DateOfBirth CHECK (First_Name IS NOT NULL AND
    Last_Name IS NOT NULL AND Date_Of_Birth IS NOT NULL)
    );

CREATE INDEX Index_SwornEmployees_FirstName_LastName ON Sworn_Employees (First_Name, Last_Name);
CREATE INDEX INDEX_E_Patrol_Station_ID ON Sworn_Employees (Patrol_Station_ID);
CREATE INDEX INDEX_E_Rank_ID ON Sworn_Employees (Rank_ID);
CREATE INDEX INDEX_E_Body_Camera_ID ON Sworn_Employees (Body_Camera_ID);
CREATE INDEX INDEX_E_Vehicle_ID ON Sworn_Employees (Vehicle_ID);


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
    CONSTRAINT CHK_CaseReport_Location_Offense_Offender CHECK (Location_Address IS NOT NULL AND Locate_City IS NOT NULL AND Location_State IS NOT NULL AND Offense_ID IS NOT NULL AND Offender_ID 
    IS NOT NULL AND Employee_ID IS NOT NULL and Date_Occurred IS NOT NULL AND Time_Occurred IS NOT NULL)
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
    CONSTRAINT CHK_Court_Date_Time_Report_Address CHECK (Court_Date IS NOT NULL 
    AND Court_Time IS NOT NULL AND Case_Report_ID IS NOT NULL AND Court_Name IS NOT NULL)
);

CREATE INDEX Index_Cases ON Court (Case_Report_ID);
