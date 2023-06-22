insert into Rank(Rank_Title,Salary)
VALUES ('Police Officer', 80000.00);

insert INTO Rank(Rank_Title, Salary)
VALUES (Detective', 85000.00');

insert into Rank(Rank_Title, Salary)
VALUES ('Sergeant', 100000.00);

insert into Rank(Rank_Title, Salary)
VALUES ('Lieutenant', 130000.00);

INSERT INTO Stations (Station_Name, Phone, Station_Address, City)
VALUES ('West Sector', '859-000-0001', '105 Oak Street', 'Lexington');

INSERT INTO Stations (Station_Name, Phone, Station_Address, City)
VALUES ('Central Sector', '859-000-0002', '230 W Main Street', 'Lexington');

INSERT INTO Stations (Station_Name, Phone, Station_Address, City)
VALUES ('East Sector', '859-000-0003', '356 Ash Drive', 'Lexington');

INSERT INTO Speciality (Speciality_Skill)
VALUES ('Bilingual');

INSERT INTO Speciality (Speciality_Skill)
VALUES ('Narcotics');

INSERT INTO Speciality (Speciality_Skill)
VALUES ('Person Crimes');

INSERT INTO Speciality (Speciality_Skill)
VALUES ('Field Training Officer');

INSERT INTO Speciality (Speciality_Skill)
VALUES ('K9');

INSERT INTO Speciality (Speciality_Skill)
VALUES ('Traffic');

INSERT INTO Speciality (Speciality_Skill)
VALUES ('None');

INSERT INTO Vehicles (Plate_Number, Color, Car_Year, Brand, Model, Registration_State, Registration_Expires)
SELECT CONCAT(
        CHAR(FLOOR(RAND() * 26) + 65), 
        CHAR(FLOOR(RAND() * 26) + 65), 
        CHAR(FLOOR(RAND() * 26) + 65), 
        FLOOR(RAND() * 10), 
        FLOOR(RAND() * 10), 
        FLOOR(RAND() * 10), 
        FLOOR(RAND() * 10) 
    ) AS Plate_Number,
    'White' AS Color,
    FLOOR(RAND() * 7) + 2017 AS Car_Year,
    CASE WHEN RAND() < 0.5 THEN 'Chevrolet Tahoe' ELSE 'Ford Taurus' END AS Brand,
    CASE WHEN RAND() < 0.5 THEN 'Tahoe' ELSE 'Taurus' END AS Model,
    'KY' AS Registration_State,
    CURDATE() + INTERVAL FLOOR(RAND() * 365) DAY AS Registration_Expires
FROM generate_series(1, 21);


INSERT INTO Body_Cameras(Brand)
VALUES
('AXON'),
FROM generate_Series(1,21);


INSERT INTO Offenders (First_Name, Last_Name, Phone, Offender_Address, State, Date_Of_Birth, License,License_State)
VALUES('Shawn', 'Wilkens', '4212123052', '543 East Conlon Avenue', 'CA', '1962-09-12', 'P13453472', 'CA' ),
('David', 'Iverson', '3125641112', '712 Honolulu Drive', 'HI', '1996-12-01', 'ATHI324877', 'HI' ),
('Stephanie', 'Hollin', '8592341000', '1110 West Short Strret', 'KY', '1986-10-01', 'K12456988', 'KY'),
('Cameron', 'Isaacs', '8594561110', '310 Walton Avenue', 'KY', '1988-01-15', 'F13452908', 'KY'),
('James', 'Teller', '8590014567', '52 South Ashland Drive', 'KY', '1999-06-02', 'H12670877', 'KY'),
('Devin', 'Martin', '8595673231', '76 East Loudon Avenue', 'KY', '1979-05-17', 'F61879101', 'KY'),
('Rick', 'Martinez', '8593412451', '1110 Race Street', 'KY', '1993-04-27', 'T87999232', 'KY'),
('Michael', 'Smith', '8597678999', '820 Clays Mill Road', 'KY', '1991-02-10', 'H98111675', 'KY'),
('Kevin', 'James', '8594546777', '110 North Shore', 'KY', '2000-03-01', 'P12555677', 'KY'),
('Richard', 'Hotz', '8592317890', '710 Man O War', 'KY', '1990-03-07', 'P567894490', 'KY'),
('Danny', 'Diaz', '7128900009', '233 Eastland Drive', 'OH', '1992-07-19', 'IU89081012', 'OH'),
('Noah', 'Meaghor', '6127779099', '45 East 52nd Street', 'IL', '1987-10-28', '756312356745', 'IL'),

