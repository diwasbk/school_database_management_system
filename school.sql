CREATE DATABASE school;
USE school;

-- Create City table
CREATE TABLE City (
    CityID VARCHAR(10) PRIMARY KEY,
    CityName VARCHAR(100)
);
-- Insert data into City table
INSERT INTO City (CityID, CityName) VALUES
    ('C1', 'Butwal'),
    ('C2', 'Taulihawa'),
    ('C3', 'Siddharthanagar'),
    ('C4', 'Tansen'),
    ('C5', 'Bhairahawa');
-- Select all data from City table
SELECT * FROM City;


-- Create Province table
CREATE TABLE Province (
    ProvinceID VARCHAR(10) PRIMARY KEY,
    ProvinceName VARCHAR(100)
);
-- Insert data into Province table
INSERT INTO Province (ProvinceID, ProvinceName) VALUES
    ('P1', 'Lumbini');
-- Select all data from Province table
SELECT * FROM Province;


-- Create District table
CREATE TABLE District (
    DistrictID VARCHAR(10) PRIMARY KEY,
    DistrictName VARCHAR(100)
);
-- Insert data into District table
INSERT INTO District (DistrictID, DistrictName) VALUES
    ('D1', 'Rupandehi'),
    ('D2', 'Palpa'),
    ('D3', 'Kapilvastu');
-- Select all data from District table
SELECT * FROM District;


-- Create Address table
CREATE TABLE Address (
    AddressID VARCHAR(10) PRIMARY KEY,
    CityID VARCHAR(10),
    DistrictID VARCHAR(10),
    ProvinceID VARCHAR(10),
    FOREIGN KEY (CityID) REFERENCES City(CityID),
    FOREIGN KEY (DistrictID) REFERENCES District(DistrictID),
    FOREIGN KEY (ProvinceID) REFERENCES Province(ProvinceID)
);
-- Insert data into Address table
INSERT INTO Address (AddressID, CityID, DistrictID, ProvinceID) VALUES
    ('AD1', 'C1', 'D1', 'P1'),
    ('AD2', 'C2', 'D3', 'P1'),
    ('AD3', 'C3', 'D1', 'P1'),
    ('AD4', 'C4', 'D2', 'P1'),
    ('AD5', 'C5', 'D1', 'P1');
-- Select all data from Address table
SELECT * FROM Address;


-- Create Teacher table
CREATE TABLE Teacher (
    TeacherID VARCHAR(10) PRIMARY KEY,
    TeacherName VARCHAR(100),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    AddressID VARCHAR(10),
    Phone VARCHAR(15),
    Salary DECIMAL(10, 2),
    FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
);
-- Insert data into Teacher table
INSERT INTO Teacher (TeacherID, TeacherName, DateOfBirth, Gender, AddressID, Phone, Salary) VALUES
    ('T1', 'Ashok Aryal', '1980-09-05', 'Male', 'AD4', '9867389098', 40000.00),
    ('T2', 'Basanta Poudel', '1975-04-25', 'Male', 'AD5', '9876787887', 45000.00),
    ('T3', 'Lekhnath Panta', '1985-01-28', 'Male', 'AD1', '9856788993', 60000.00),
    ('T4', 'Roman Shrestha', '1990-06-02', 'Male', 'AD1', '9843678567', 55000.00),
    ('T5', 'Ritika Banjade', '1992-05-11', 'Female', 'AD4', '9841678939', 50000.00);
-- Select all data from Teacher table
SELECT * FROM Teacher;


-- Create Subject table
CREATE TABLE Subject (
    SubjectID VARCHAR(10) PRIMARY KEY,
    Subject VARCHAR(100),
    Class INT
);
-- Insert data into Subject table
INSERT INTO Subject (SubjectID, Subject, Class) VALUES
    ('S1', 'Mathematics', 10),
    ('S2', 'Science', 10),
    ('S3', 'English', 9),
    ('S4', 'Social Studies', 9),
    ('S5', 'Sanskrit',NULL),
    ('S6', 'Nepali',NULL);
-- Select all data from Subject table
SELECT * FROM Subject;


-- Create Student table
CREATE TABLE Student (
    StudentID VARCHAR(10) PRIMARY KEY,
    StudentName VARCHAR(100),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    AddressID VARCHAR(10),
    FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
);
-- Insert data into Student table
INSERT INTO Student (StudentID, StudentName, DateOfBirth, Gender, AddressID) VALUES
    ('101', 'Ramesh Acharya', '2005-03-09', 'Male', 'AD1'),
    ('102', 'Sita Sharma', '2006-06-20', 'Female', 'AD2'),
    ('103', 'Asha Rai', '2004-10-11', 'Female', 'AD5');
-- Select all data from Student table
SELECT * FROM Student;


-- Create StudentGuardian table
CREATE TABLE StudentGuardian (
    GuardianID VARCHAR(10) PRIMARY KEY,
    GuardianName VARCHAR(100),
    GuardianPhone VARCHAR(15),
    StudentID VARCHAR(10),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);
-- Insert data into StudentGuardian table
INSERT INTO StudentGuardian (GuardianID, GuardianName, GuardianPhone, StudentID) VALUES
    ('G1', 'Gita Acharya', '984701111', '101'),
    ('G2', 'Rama Sharma', '982341242', '102'),
    ('G3', 'Hari Rai', '982132414', '103');
-- Select all data from StudentGuardian table
SELECT * FROM StudentGuardian;


-- Create Attendance table
CREATE TABLE Attendance (
    AttendanceID VARCHAR(10) PRIMARY KEY,
    StudentID VARCHAR(10),
    Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);
-- Insert data into Attendance table
INSERT INTO Attendance (AttendanceID, StudentID, Date, Status) VALUES
    ('AT1', '101', '2023-07-01', 'Present'),
    ('AT2', '102', '2023-07-02', 'Absent'),
    ('AT3', '103', '2023-07-03', 'Present'),
    ('AT4', '102', '2023-07-02', 'Present'),
    ('AT5', '103', '2023-07-03', 'Absent');
-- Select all data from Attendance table
SELECT * FROM Attendance;


-- Create Result table
CREATE TABLE Result (
    ResultID VARCHAR(10) PRIMARY KEY,
    StudentID VARCHAR(10),
    SubjectID VARCHAR(10),
    DateOfExam DATE,
    Score DECIMAL(5, 2),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (SubjectID) REFERENCES Subject(SubjectID)
);
-- Insert data into Result table
INSERT INTO Result (ResultID, StudentID, SubjectID, DateOfExam, Score) VALUES
    ('R1', '101', 'S1', '2023-06-15', 85.00),
    ('R2', '102', 'S2', '2023-06-20', 78.00),
    ('R3', '103', 'S6', '2023-06-25', 92.00),
    ('R4', '102', 'S5', '2023-06-15', 78.00),
    ('R5', '103', 'S3', '2023-06-20', 90.00),
    ('R6', '103', 'S1', '2023-06-25', 65.00);
-- Select all data from Result table
SELECT * FROM Result;


-- Create Event table
CREATE TABLE Event (
    EventID VARCHAR(10) PRIMARY KEY,
    EventName VARCHAR(100),
    Date DATE,
    Location VARCHAR(100)
);
-- Insert data into Event table
INSERT INTO Event (EventID, EventName, Date, Location) VALUES
    ('E1', 'Annual Day', '2023-08-10', 'School Ground'),
    ('E2', 'Sports Day', '2023-09-20', 'Sports Complex'),
    ('E3', 'Science Fair', '2023-10-15', 'Science Lab'),
    ('E4', 'Parent-Teacher Meeting', '2023-07-30', 'School Auditorium');
-- Select all data from Event table
SELECT * FROM Event;


-- Create Author table
CREATE TABLE Author (
    AuthorID VARCHAR(10) PRIMARY KEY,
    AuthorName VARCHAR(100)
);
-- Insert data into Author table
INSERT INTO Author (AuthorID, AuthorName) VALUES
    ('A1', 'Herbert Schildt'),
    ('A2', 'Tara Calishain'),
    ('A3', 'Johnson M. Hart'),
    ('A4', 'Jon Skeet');
-- Select all data from Author table
SELECT * FROM Author;


-- Create Book table
CREATE TABLE Book (
    BookID VARCHAR(10) PRIMARY KEY,
    BookTitle VARCHAR(100),
    AuthorID VARCHAR(10),
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);
-- Insert data into Book table
INSERT INTO Book (BookID, BookTitle, AuthorID) VALUES
    ('B1', 'Java the complete reference (12th edition)', 'A1'),
    ('B2', 'Spidering HACKS', 'A2'),
    ('B3', 'Windows System Programming', 'A3'),
    ('B4', 'C# in Depth', 'A4');
-- Select all data from Book table
SELECT * FROM Book;



-- Create LibraryRecords table
CREATE TABLE LibraryRecords (
    LRID VARCHAR(10) PRIMARY KEY,
    StudentID VARCHAR(10),
    BookID VARCHAR(10),
    AuthorID VARCHAR(10),
    IssueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Book(AuthorID)
);
-- Insert data into LibraryRecords table
INSERT INTO LibraryRecords (LRID, StudentID, BookID, AuthorID, IssueDate, ReturnDate) VALUES
    ('LR1', '101', 'B1', 'A1', '2023-07-05', '2023-07-20'),
    ('LR2', '102', 'B2', 'A2', '2023-06-30', '2023-07-10'),
    ('LR3', '103', 'B3', 'A3', '2023-07-10', '2023-07-25'),
    ('LR4', '103', 'B4', 'A4', '2023-07-15', '2023-07-25');
-- Select all data from LibraryRecords table
SELECT * FROM LibraryRecords;


-- Create Fee table
CREATE TABLE Fee (
    FeeID VARCHAR(10) PRIMARY KEY,
    Class VARCHAR(50),
    Amount DECIMAL(10, 2)
);
-- Insert data into Fee table
INSERT INTO Fee (FeeID, Class, Amount) VALUES
    ('F1', 'Nursery', 1500.00),
    ('F2', 'KG', 2000.00),
    ('F3', '1', 2500.00),
    ('F4', '2', 3000.00),
    ('F5', '3', 3500.00),
    ('F6', '4', 4000.00),
    ('F7', '5', 4500.00),
    ('F8', '6', 5000.00),
    ('F9', '7', 5500.00),
    ('F10', '8', 6000.00),
    ('F11', '9', 6500.00),
    ('F12', '10', 7000.00);
-- Select all data from Fee table
SELECT * FROM Fee;


-- Create Payment table
CREATE TABLE Payment (
    PaymentID VARCHAR(10) PRIMARY KEY,
    FeeID  VARCHAR(10),
    StudentID VARCHAR(10),
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (FeeID) REFERENCES Fee(FeeID)
);
-- Insert data into Payment table
INSERT INTO Payment (PaymentID,FeeID, StudentID, Amount, PaymentDate) VALUES
    ('PM1','F9', '101', 5500.00, '2080-04-010'),
    ('PM2', 'F11','102', 6500.00, '2080-04-10'),
    ('PM3','F9','103', 5500.00, '2080-04-05');
-- Select all data from Payment table
SELECT * FROM Payment;


-- Increasing all fees by 20%
SET SQL_SAFE_UPDATES = 0;
UPDATE Fee
SET Amount = Amount * 1.20;
SELECT * FROM Fee;


-- Removing students absent over 10 consecutive days.
CREATE TEMPORARY TABLE Absentees AS
SELECT StudentID
FROM Attendance
WHERE Status = 'Absent'
GROUP BY StudentID
HAVING COUNT(Date) > 10;
DELETE FROM Attendance
WHERE StudentID IN (SELECT StudentID FROM Absentees);
SELECT * FROM Attendance;


-- Insert into Student table
INSERT INTO Student (StudentID, StudentName, DateOfBirth, Gender, AddressID)
VALUES ('104', 'Ravi Thapa', '2005-12-12', 'Male', 'AD2');
-- Insert into StudentGuardian table
INSERT INTO StudentGuardian (GuardianID, GuardianName, GuardianPhone, StudentID)
VALUES ('G4', 'Gopal Thapa', '9887876560', '104');
-- Insert into Attendance table
INSERT INTO Attendance (AttendanceID, StudentID, Date, Status)
VALUES ('AT6', '104', '2023-07-01', 'Present');
-- Insert into Payment table
INSERT INTO Payment (PaymentID, FeeID, StudentID, Amount, PaymentDate)
VALUES ('PM4', 'F1', '104', 1500.00, '2023-07-01');


-- Retrieving student’s total marks and overall percentage
SELECT 
    Student.StudentID,
    Student.StudentName,
    Subject.SubjectID,
    Subject.Subject,
    SUM(Result.Score) AS TotalMarks,
    AVG(Result.Score) AS Percentage
FROM 
    Result
JOIN 
    Student ON Result.StudentID = Student.StudentID
JOIN 
    Subject ON Result.SubjectID = Subject.SubjectID
GROUP BY 
    Student.StudentID, Subject.SubjectID;
    

-- Deducting 10% from all student grades in one transaction
START TRANSACTION;
UPDATE Result
SET Score = Score * 0.90;
COMMIT;
SELECT * FROM Result;


-- Fetching data while multiple JOINs and filters
SELECT DISTINCT
    Student.StudentID,
    Student.StudentName,
    Subject.Subject,
    Teacher.TeacherName,
    Result.Score,
    Payment.Amount AS FeePaid
FROM 
    Student
JOIN 
    Result ON Student.StudentID = Result.StudentID
JOIN 
    Subject ON Result.SubjectID = Subject.SubjectID
JOIN 
    Teacher ON Teacher.TeacherID = (
        SELECT TeacherID
        FROM Subject
        WHERE Subject.SubjectID = Result.SubjectID
    )
JOIN 
    Payment ON Student.StudentID = Payment.StudentID
WHERE 
    Result.Score > 60
    AND Subject.Class IN (9, 10)
    AND Payment.Amount > 5000;