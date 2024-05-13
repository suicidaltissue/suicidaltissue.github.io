-- *********************************************
-- This script creates an example database
--        for CS27020 practical 2023/2024. 
--
-- *********************************************
-- If using your own server you can create a seperate 
-- database to hold this data. If using the central or
-- dcs servers you will not have permission
--

DROP TABLE IF EXISTS studentmodules CASCADE;
DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS modules CASCADE;
DROP TABLE IF EXISTS degrees CASCADE;
DROP TABLE IF EXISTS lecturers CASCADE;

CREATE TABLE degrees (
  Degree varchar(10) PRIMARY key,
  DegreeName Varchar(50)
  );
  
CREATE TABLE lecturers (
  LecturerID varchar(5) PRIMARY KEY,
  LecturerName varchar(50),
  Email varchar(50)
);

CREATE TABLE students (
  StudentID varchar(5) PRIMARY Key,
  Student_Name Varchar(50),
  Degree varchar(10),
  year integer,
  FOREIGN key(Degree) REFERENCES degrees(degree)
  );
  
CREATE TABLE modules (
  ModuleID varchar(5) PRIMARY KEY,
  Module_Name varchar(50),
  Credits INTEGER,
  Level Integer,
  LecturerID varchar(5),
  FOREIGN KEY (LecturerID) REFERENCES lecturers(LecturerID)
);


CREATE TABLE studentmodules (
    StudentID varchar(5),
    ModuleID varchar(5),
    FOREIGN key(StudentID) REFERENCES students(StudentID),
    FOREIGN key(ModuleID) REFERENCES modules(ModuleID),
    PRIMARY key(StudentID, ModuleID)
);



INSERT INTO degrees VALUES
('CS', 'Computer Science'),
('MT', 'Mathematics')
;

INSERT INTO lecturers VALUES
(1,'Andy Starr', 'aos@aber.ac.uk'),
(2,'Christine Zarges', 'chz8@aber.ac.uk'),
(3,'Rudi Winter', 'ruw@aber.ac.uk');

INSERT INTO students VALUES
('y2112','Anne Cleeves','CS', 1),
('y2009','Dave Fern','CS', 2),
('y2106','Gerald Iggeldun','MT', 1),
('y2020','Jane Leek','MT', 2);



INSERT INTO modules VALUES
('CS120','Introduction to Programming',20, 1, 1),
('CS123','Object Oriented Programming',20, 1, 1),
('CS180','Professional Issues',10, 1, 1),
('CS104','Maths Driving License',10, 1, 2),
('CS125','Functional Programming',10, 1, 2),
('CS211','Algorithms and Data Structures',20, 2, 2),
('CS270','Modelling Persistent Data',20, 2, 1),
('CS244','Scientific Programming',20, 3, 2),
('CS260','Artificial Intelligence',20, 2, 1),
('MT100','Introduction to Forces',20, 1, 3),
('MT120','Introduction to Electromagnetism',20, 1, 3),
('MT150','Professional Issues',10, 1, 3),
('MT180','Laboratory Techniques',20, 3, 3),
('MT200','Thermodynamics',20, 3, 3),
('MT240','Electricity and Magnetism',20, 2, 3);

INSERT INTO studentmodules VALUES
('y2112','CS120'),
('y2112','CS123'),
('y2112','CS180'),
('y2112','CS104'),
('y2112','CS125'),
('y2009','CS211'),
('y2009','CS270'),
('y2009','CS244'),
('y2009','CS260'),
('y2106','MT100'),
('y2106','MT120'),
('y2106','MT150'),
('y2106','MT180'),
('y2106','MT200'),
('y2020','MT240'),
('y2020','CS244');



