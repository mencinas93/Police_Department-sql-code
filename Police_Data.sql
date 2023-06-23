insert into Rank(Rank_Title,Salary)
VALUES ('Police Officer', 80000.00);

INSERT INTO Rank(Rank_Title, Salary)
VALUES ('Detective', 85000.00);

insert into Rank(Rank_Title, Salary)
VALUES ('Sergeant', 100000.00);

insert into Rank(Rank_Title, Salary)
VALUES ('Lieutenant', 130000.00);

INSERT INTO Stations (Station_Name, Phone, Station_Address, City)
VALUES ('West Sector', '859258001', '105 Oak Street', 'Lexington');

INSERT INTO Stations (Station_Name, Phone, Station_Address, City)
VALUES ('Central Sector', '8592580881', '230 W Main Street', 'Lexington');

INSERT INTO Stations (Station_Name, Phone, Station_Address, City)
VALUES ('East Sector', '8592580145', '356 Ash Drive', 'Lexington');

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
SELECT 
    CONCAT(
        CHR(FLOOR(RANDOM() * 26) + 65), 
        CHR(FLOOR(RANDOM() * 26) + 65), 
        CHR(FLOOR(RANDOM() * 26) + 65), 
        FLOOR(RANDOM() * 10)::INT, 
        FLOOR(RANDOM() * 10)::INT, 
        FLOOR(RANDOM() * 10)::INT, 
        FLOOR(RANDOM() * 10)::INT 
    ) AS Plate_Number,
    'White' AS Color,
    FLOOR(RANDOM() * 7) + 2017 AS Car_Year,
    CASE WHEN RANDOM() < 0.5 THEN 'Chevrolet Tahoe' ELSE 'Ford Taurus' END AS Brand,
    CASE WHEN RANDOM() < 0.5 THEN 'Tahoe' ELSE 'Taurus' END AS Model,
    'KY' AS Registration_State,
    CURRENT_DATE + (FLOOR(RANDOM() * 365)::INT || ' days')::INTERVAL AS Registration_Expires
FROM generate_series(1, 21);


INSERT INTO Body_Cameras (Brand)
SELECT 'AXON'
FROM generate_series(1, 21);


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
('Harry', 'Chapman', '8593107879', '410 Bingham Drive', 'KY', '1981-09-06', 'F11231789', 'KY'),
('Sharrron', 'Hardy', '8593245764', '3456 Walnut Drive', 'KY', '1969-10-10', 'P13456790', 'KY'),
('Steven', 'Lawson', '9023314563', '402 Christa Lane', 'KY', '1994-12-14', 'H73243459', 'KY'),
('Mason', 'Jackson', '7864326709', '544 Beach Road', 'FL', '1965-08-02', '876323', 'FL' ),
('Andy', 'Mason', '8596177777', '108 Lakeshore Drive', 'KY', '1956-11-17', 'T98324123', 'KY'),
('Michelle', 'Won', '8595611098', '231 Sunset Drive', 'KY', '1976-02-20', 'P76891001', 'KY'),
('Huang', 'Tzin', '8598190001', '415 Cooper Drive', 'KY', '1973-02-02', 'H98142556', 'KY'),
('Emily', 'Johnson', '8591234567', '123 Main Street', 'KY', '1998-08-15', 'L12345678', 'KY'),
('Ryan', 'Anderson', '8599876543', '456 Elm Avenue', 'KY', '1995-03-22', 'K87654321', 'KY'),
('Samantha', 'Wilson', '8595551234', '789 Oak Drive', 'KY', '1989-12-05', 'F98765432', 'KY'),
('Jacob', 'Thompson', '8597778888', '321 Pine Lane', 'KY', '1997-06-10', 'H23456789', 'KY'),
('Olivia', 'Davis', '8592223333', '654 Maple Street', 'KY', '1992-11-25', 'L54321098', 'KY'),
('Ethan', 'Harris', '8594445555', '987 Birch Road', 'KY', '1996-09-18', 'L34567890', 'KY');


INSERT INTO Offense (Offense_Name, Offense_Category)
VALUES
    ('Assault', 'Criminal'),
    ('Burglary', 'Criminal'),
    ('Robbery', 'Criminal'),
    ('Grand Theft Auto', 'Criminal'),
    ('Kidnapping', 'Criminal'),
    ('Disorderly Conduct', 'Criminal'),
    ('Alcohol Intoxication', 'Criminal'),
    ('Shoplifting', 'Criminal'),
    ('Public Intoxication', 'Criminal'),
    ('Criminal Mischief', 'Criminal'),
    ('Fraudulent Use of Credit Card', 'Criminal'),
    ('Theft by Deception', 'Criminal'),
    ('Criminal Trespass', 'Criminal'),
    ('Theft of Firearm', 'Criminal'),
    ('Larceny From Vehicle', 'Criminal'),
    ('Driving under the influence', 'Traffic'),
    ('Speeding over 15mph', 'Traffic'),
    ('Reckless Driving', 'Traffic'),
    ('Disregard Traffic Control Device', 'Traffic'),
    ('Disregard Stop Sign', 'Traffic'),
    ('Failure to yield to Emergency Vehicle', 'Traffic'),
    ('No Seatbelt', 'Traffic'),
    ('No Operator''s License', 'Traffic'),
    ('No Insurance', 'Traffic'),
    ('Expired Registration Plate', 'Traffic');

INSERT INTO Sworn_Employees (Patrol_Station_ID, Rank_ID, First_Name, Last_Name, Phone, Employee_Address, City, State, Date_Of_Birth, Body_Camera_ID, Vehicle_ID, Speciality_ID)
VALUES
    (1, 1, 'Lucas', 'Steel', '8595639801', '405 Elmwood Street', 'Lexington', 'KY', '1993-01-01', 1, 1, 4),
    (1, 1, 'Max', 'Sparks', '8591245643', '160 Nicholasville Road', 'Lexington', 'KY', '1995-02-15', 2, 2, 6),
    (1, 1, 'Michael', 'Rodriguez', '8596456449', '721 Harrodsburg Road', 'Lexington', 'KY', '1996-07-20', 3, 3, 1),
    (1, 1, 'Kurt', 'Moses', '8594569000', '57 Spring Run Road', 'Lexington', 'KY', '1997-11-30', 4, 4, 7),
    (1, 2, 'Richard', 'Lopez', '8594215690', '45 East 7th Street', 'Louisville', 'KY', '1988-05-10', 5, 5, 3),
    (1, 3, 'James', 'Suttle', '8596689992', '510 Southland Drive', 'Ashland', 'KY', '1986-09-25', 6, 6, 7),
    (1, 4, 'Thomas', 'Holland', '8590100556', '303 Clay Avenue', 'Richmond', 'KY', '1981-03-05', 7, 7, 7),

    (2, 1, 'Thomas', 'Heard', '85956645i7', '45 Rose Street', 'Versailles', 'KY', '1990-01-01', 8, 8, 1),
    (2, 1, 'Xavier', 'Loyd', '8592940001', '310 Fort Harrods Drive', 'Lexington', 'KY', '1995-02-15', 9, 9, 4),
    (2, 1, 'Jason', 'Mitchell', '8593766778', '210 E Main Street', 'Georgetown', 'KY', '1994-07-20', 10, 10, 5),
    (2, 1, 'Michael', 'Diaz', '8594447690', '121 Floyd Drive', 'Lexington', 'KY', '1992-06-10', 11, 11, 7),
    (2, 2, 'Albert', 'Macias', '8590018901', '571 Union Drive', 'Georgetown', 'KY', '1990-09-25', 12, 12, 2),
    (2, 3, 'Jacob', 'Johnson', '8595589012', '89 Winchester Road', 'Lexington', 'KY', '1987-03-15', 13, 13, 3),
    (2, 4, 'Jimmy', 'Floyd', '8592899990', '481 New Circle Road', 'Lexington', 'KY', '1982-08-20', 14, 14, 7),

    (3, 1, 'Lilly', 'Chase', '8596723345', '134 Christa Drive', 'Nicholasville', 'KY', '1985-05-25', 15, 15, 5),
    (3, 1, 'Christopher', 'Martinez', '8593456757', '375 Bingham Drive', 'Lexington', 'KY', '1998-10-10', 16, 16, 5),
    (3, 1, 'Shelly', 'White', '8594326678', '890 Starlight Lane', 'Georgetown', 'KY', '1999-04-15', 17, 17, 4),
    (3, 1, 'Ryan', 'Beloso', '8598910348', '908 Palomar Drive', 'Lexington', 'KY', '1986-09-30', 18, 18, 7),
    (3, 2, 'Brian', 'Olson', '8594213305', '3767 Rabbit Lane', 'Lexington', 'KY', '1991-12-05', 19, 19, 3),
    (3, 3, 'Allison', 'Blake', '8594763244', '657 Walter Drive', 'Versailles', 'KY', '1990-06-20', 20, 20, 7),
    (3, 4, 'Colton', 'Smith', '8594735564', '276 BrassRoad', 'Ashland', 'KY', '1983-11-25', 21, 21, 7);

