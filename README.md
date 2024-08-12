# School Database Management System

## Overview

This project creates a comprehensive school database management system using MySQL. The database includes various tables to manage information about cities, provinces, districts, addresses, teachers, students, subjects, results, events, library records, fees, and payments.

## Tables and Relationships

1. **City**
   - Stores city information.
   - Columns: `CityID`, `CityName`

2. **Province**
   - Stores province information.
   - Columns: `ProvinceID`, `ProvinceName`

3. **District**
   - Stores district information.
   - Columns: `DistrictID`, `DistrictName`

4. **Address**
   - Stores address details linking city, district, and province.
   - Columns: `AddressID`, `CityID`, `DistrictID`, `ProvinceID`

5. **Teacher**
   - Stores teacher information.
   - Columns: `TeacherID`, `TeacherName`, `DateOfBirth`, `Gender`, `AddressID`, `Phone`, `Salary`

6. **Subject**
   - Stores subject information.
   - Columns: `SubjectID`, `Subject`, `Class`

7. **Student**
   - Stores student information.
   - Columns: `StudentID`, `StudentName`, `DateOfBirth`, `Gender`, `AddressID`

8. **StudentGuardian**
   - Stores guardian information related to students.
   - Columns: `GuardianID`, `GuardianName`, `GuardianPhone`, `StudentID`

9. **Attendance**
   - Stores attendance records for students.
   - Columns: `AttendanceID`, `StudentID`, `Date`, `Status`

10. **Result**
    - Stores exam results for students.
    - Columns: `ResultID`, `StudentID`, `SubjectID`, `DateOfExam`, `Score`

11. **Event**
    - Stores information about school events.
    - Columns: `EventID`, `EventName`, `Date`, `Location`

12. **Author**
    - Stores information about book authors.
    - Columns: `AuthorID`, `AuthorName`

13. **Book**
    - Stores information about books.
    - Columns: `BookID`, `BookTitle`, `AuthorID`

14. **LibraryRecords**
    - Stores records of books issued to students.
    - Columns: `LRID`, `StudentID`, `BookID`, `AuthorID`, `IssueDate`, `ReturnDate`

15. **Fee**
    - Stores fee structure for different classes.
    - Columns: `FeeID`, `Class`, `Amount`

16. **Payment**
    - Stores payment records for student fees.
    - Columns: `PaymentID`, `FeeID`, `StudentID`, `Amount`, `PaymentDate`

## Features

- **Data Insertion**: Sample data for cities, provinces, districts, addresses, teachers, students, subjects, results, events, authors, books, and library records.
- **Data Retrieval**: SQL queries to retrieve data from each table.
- **Fee Management**: Updates and manages fee records.
- **Attendance Tracking**: Monitors student attendance and handles absentees.
- **Student Results**: Calculates total marks and overall percentage.
- **Transaction Management**: Performs transactions on student grades.
- **Complex Queries**: Retrieves detailed information with multiple joins and filters.

## Installation

To set up this database, follow these steps:

1. **Install MySQL**: Make sure MySQL is installed on your machine.
2. **Run SQL Scripts**: Execute the SQL scripts provided to create and populate the database.

   ```sql
   -- Create and use the database
   CREATE DATABASE school;
   USE school;

   -- Execute all table creation and data insertion scripts
   -- (Refer to the SQL script provided in this repository)

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/diwasbk/school_database_management_system.git

## Author

- [Diwas Bk](https://github.com/diwasbk)