CREATE DATABASE Resort;
    USE Resort;

    CREATE TABLE Employees(
    E_Name VARCHAR(50),
    E_Address VARCHAR(100),
    E_Aadhar BIGINT PRIMARY KEY,
    E_Mob BIGINT UNIQUE,
    E_Email VARCHAR(100),
    E_Gender VARCHAR(10) CHECK(E_Gender IN ('Male','Female','Other')),
    E_Age INT CHECK(E_Age > 0),
    Join_Date DATE,
    Salary BIGINT,
    CHECK(E_Mob BETWEEN 1000000000 AND 9999999999),
    CHECK(E_Aadhar BETWEEN 100000000000 AND 999999999999)
    );

    CREATE TABLE Residents(
    R_Name VARCHAR(50),
    R_Address VARCHAR(100),
    R_Aadhar BIGINT PRIMARY KEY,
    R_Mob BIGINT UNIQUE,
    R_Email VARCHAR(100),
    R_Gender VARCHAR(10) CHECK(R_Gender IN ('Male','Female','Other')),
    R_Age INT CHECK(R_Age > 0),
    CHECK(R_Mob BETWEEN 1000000000 AND 9999999999),
    CHECK(R_Aadhar BETWEEN 100000000000 AND 999999999999)
    );

    CREATE TABLE Rooms(
    Room_Number VARCHAR(5) PRIMARY KEY,
    Room_Type VARCHAR(10) CHECK(Room_Type IN ('A/C','Non A/C')),
    Capacity VARCHAR(10) CHECK(Capacity IN ('Single Bed','Double Bed'))
    );

    CREATE TABLE Booking_Details(
    Booking_Id INTEGER PRIMARY KEY,
    R_Aadhar BIGINT,
    Room_Number VARCHAR(5),
    Check_In_Date DATE,
    Check_Out_Date DATE,
    FOREIGN KEY (R_Aadhar) REFERENCES Residents(R_Aadhar)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Room_Number) REFERENCES Rooms(Room_Number)
    ON DELETE CASCADE ON UPDATE CASCADE
    );


    CREATE TABLE Companions(
    C_Name VARCHAR(50),
    C_Address VARCHAR(100),
    C_Aadhar BIGINT PRIMARY KEY,
    C_Mob BIGINT UNIQUE,
    C_Email VARCHAR(100),
    C_Gender VARCHAR(10) CHECK(C_Gender IN ('Male','Female','Other')),
    C_Age INT CHECK(C_Age > 0),
    R_Aadhar BIGINT,
    Booking_Id INTEGER,
    CHECK(C_Mob BETWEEN 1000000000 AND 9999999999),
    CHECK(C_Aadhar BETWEEN 100000000000 AND 999999999999),
    FOREIGN KEY (R_Aadhar) REFERENCES Residents(R_Aadhar)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Booking_Id) REFERENCES Booking_Details(Booking_Id)
    ON DELETE CASCADE ON UPDATE CASCADE
    );

    CREATE TABLE Food(
    Item_Name VARCHAR(20) PRIMARY KEY,
    Food_Type VARCHAR(20) CHECK(Food_Type IN ('Vegetarian','Non Vegetarian')),
    Price INT
    );

    CREATE TABLE Food_Orders(
    Order_Id INT PRIMARY KEY,
    Item_Name VARCHAR(20),
    R_Aadhar BIGINT,
    Order_Time DATETIME,
    FOREIGN KEY (R_Aadhar) REFERENCES Residents(R_Aadhar)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Item_Name) REFERENCES Food(Item_Name)
    ON DELETE CASCADE ON UPDATE CASCADE
    );


    INSERT INTO Employees VALUES
    ('Rajesh Kumar', '1234 Ashoka Road, Delhi', 123456789012, 9876543210,
    'rajesh.kumar@example.com', 'Male', 30, '2023-01-15', 55000),
    ('Aarti Sharma', '5678 Gandhi Nagar, Mumbai', 234567890123, 9988776655,
    'aarti.sharma@example.com', 'Female', 28, '2023-02-20', 60000),
    ('Vikram Patel', '9101 Nehru Street, Bangalore', 345678901234, 9776655443,
    'vikram.patel@example.com', 'Male', 32, '2023-03-10', 62000),
    ('Priya Gupta', '1617 Gandhi Avenue, Chennai', 456789012345, 9444332210,
    'priya.gupta@example.com', 'Female', 29, '2023-04-25', 58000),
    ('Arun Nair', '2223 Patel Street, Ahmedabad', 567890123456, 9111223344,
    'arun.nair@example.com', 'Male', 35, '2023-05-30', 63000);


    INSERT INTO Residents VALUES
    ('Sneha Reddy', '1213 Indira Lane, Hyderabad', 678901234567, '9666554432',
    'sneha.reddy@example.com', 'Female', 26),
    ('Amit Singh', '1415 Tagore Road, Kolkata', 789012345678, '9555443321',
    'amit.singh@example.com', 'Male', 38),
    ('Kavita Joshi', '2021 Subhash Chowk, Jaipur', 890123456789, '9222113345',
    'kavita.joshi@example.com', 'Female', 30),
    ('Meera Menon', '2425 Raja Road, Surat', 901234567890, '9000112233',
    'meera.menon@example.com', 'Female', 25),
    ('Nikhil Arora', '2526 Nehru Place, Noida', 123456789012, '9191919191',
    'nikhil.arora@example.com', 'Male', 35);


    INSERT INTO Rooms VALUES 
    (101, 'A/C', 'Single Bed'),
    (102, 'Non A/C', 'Double Bed'),
    (103, 'A/C', 'Double Bed'),
    (104, 'Non A/C', 'Single Bed'),
    (105, 'A/C', 'Single Bed');


    INSERT INTO Booking_Details VALUES
    (1567, 901234567890, 102, '2024-09-10', '2024-09-13'),
    (6660, 789012345678, 101, '2024-09-09', '2024-09-12'),
    (7538, 890123456789, 105, '2024-09-14', '2024-09-18'),
    (2679, 123456789012, 104, '2024-09-19', '2024-09-22'),
    (9906, 123456789012, 103, '2024-09-16', '2024-09-20'),
    (2678, 123456789012, 105, '2024-09-23', '2024-09-24'),
    (7531, 789012345678, 103, '2024-09-23', '2024-09-27'),
    (9245, 678901234567, 105, '2024-09-25', '2024-09-29');


    INSERT INTO Companions VALUES
    ('Rajesh Kumar', '1819 Tagore Park, Pune', 123456789013, 9333221109,
    'rajesh.kumar2@example.com', 'Male', 27, 678901234567, 9245),
    ('Simran Kaur', '2728 Patel Nagar, Chandigarh', 234567890124, 9202020202,
    'simran.kaur@example.com', 'Female', 28, 123456789012, 2678),
    ('Ravi Kumar', '2930 Ashoka Heights, Ghaziabad', 345678901235, 9303030303,
    'ravi.kumar@example.com', 'Male', 33, 123456789012, 9906),
    ('Tanuja Patel', '3132 M.G. Road, Pune', 456789012346, 9404040404,
    'tanuja.patel@example.com', 'Female', 27, 678901234567, 9245),
    ('Gaurav Desai', '3334 Laxmi Park, Bangalore', 567890123457, 9505050505,
    'gaurav.desai@example.com', 'Male', 40, 901234567890, 1567),
    ('Neha Mehta', '3536 Shanti Bagh, Ahmedabad', 678901234568, 9606060606,
    'neha.mehta@example.com', 'Female', 32, 123456789012, 2678),
    ('Kunal Kapoor', '3738 Gandhi Road, Mumbai', 789012345679, 9707070707,
    'kunal.kapoor@example.com', 'Male', 29, 789012345678, 7531),
    ('Ritika Singh', '3939 Gandhi Nagar, Delhi', 890123456780, 9808080808,
    'ritika.singh@example.com', 'Female', 26, 890123456789, 7538),
    ('Harish Rao', '4040 Nehru Road, Hyderabad', 901234567891, 9909090909,
    'harish.rao@example.com', 'Male', 37, 901234567890, 1567),
    ('Ayesha Khan', '4141 Tagore Lane, Kolkata', 123456789012, 9999000000,
    'ayesha.khan@example.com', 'Female', 34, 678901234567, 9245);


    INSERT INTO Food VALUES
    ('Paneer Butter Masala', 'Vegetarian', 250),
    ('Chicken Biryani', 'Non Vegetarian', 200),
    ('Aloo Gobi', 'Vegetarian', 150),
    ('Fish Curry', 'Non Vegetarian', 150),
    ('Dal Tadka', 'Vegetarian', 120);


    INSERT INTO Food_Orders VALUES
    (1023, 'Paneer Butter Masala', 678901234567, '2024-09-01 12:30:00'),
    (2045, 'Chicken Biryani', 789012345678, '2024-09-01 13:15:00'),
    (3456, 'Aloo Gobi', 890123456789, '2024-09-02 14:00:00'),
    (4765, 'Fish Curry', 901234567890, '2024-09-02 19:45:00'),
    (5893, 'Dal Tadka', 678901234567, '2024-09-03 08:30:00'),
    (6089, 'Chicken Biryani', 678901234567, '2024-09-03 20:15:00'),
    (7234, 'Paneer Butter Masala', 789012345678, '2024-09-04 12:00:00'),
    (8452, 'Dal Tadka', 890123456789, '2024-09-04 18:30:00'),
    (9021, 'Chicken Biryani', 901234567890, '2024-09-05 20:45:00'),
    (1234, 'Aloo Gobi', 678901234567, '2024-09-05 13:00:00'),
    (2789, 'Paneer Butter Masala', 678901234567, '2024-09-06 14:30:00'),
    (3367, 'Chicken Biryani', 678901234567, '2024-09-06 19:15:00'),
    (4812, 'Dal Tadka', 789012345678, '2024-09-07 09:00:00'),
    (5967, 'Chicken Biryani', 789012345678, '2024-09-07 18:00:00'),
    (6555, 'Aloo Gobi', 901234567890, '2024-09-08 20:00:00');


    -- 1
    SELECT R.*, COUNT(C.C_Aadhar) AS Companion_Count, B.Room_Number,
    B.Check_In_Date
    FROM Residents R
    JOIN Companions C ON R.R_Aadhar = C.R_Aadhar
    JOIN Booking_Details B ON R.R_Aadhar = B.R_Aadhar
    WHERE C.Booking_Id = B.Booking_Id
    GROUP BY R.R_Aadhar, B.Room_Number, B.Check_In_Date
    HAVING COUNT(C.C_Aadhar) > 3;


    -- 2
    SELECT R.*, COUNT(C.C_Aadhar) AS Companion_Count
    FROM Residents R
    JOIN Companions C ON R.R_Aadhar = C.R_Aadhar
    JOIN Booking_Details B ON R.R_Aadhar = B.R_Aadhar
    WHERE B.Check_In_Date BETWEEN '2024-09-10' AND '2024-09-20'
    GROUP BY R.R_Aadhar;


    -- 3
    SELECT R.*, COUNT(DISTINCT B.Check_In_Date) AS Booking_Count,
    COUNT(RM.Room_Type) AS AC_Room_Count
    FROM Residents R
    JOIN Booking_Details B ON R.R_Aadhar = B.R_Aadhar
    JOIN Rooms RM ON B.Room_Number = RM.Room_Number
    WHERE RM.Room_Type = 'A/C'
    GROUP BY R.R_Aadhar
    HAVING COUNT(RM.Room_Type) > 2 AND COUNT(DISTINCT B.Check_In_Date) >= 2;


    -- 4
    CREATE VIEW Food_Order_Counts AS
    SELECT F.Item_Name,F.Food_Type,F.Price,COUNT(FO.R_Aadhar) AS Order_Count
    FROM Food F
    JOIN Food_Orders FO ON F.Item_Name = FO.Item_Name
    GROUP BY F.Item_Name, F.Food_Type, F.Price;

    -- 4.1
    SELECT * FROM Food_Order_Counts WHERE Order_Count =
    (SELECT MAX(Order_Count) FROM Food_Order_Counts);


    -- 4.2
    SELECT * FROM Food_Order_Counts WHERE Order_Count =
    (SELECT MIN(Order_Count) FROM Food_Order_Counts);


    -- 5
    SELECT F.Item_Name,F.Food_Type,F.Price,COUNT(FO.R_Aadhar) AS Order_Count
    FROM Food F
    INNER JOIN Food_Orders FO ON F.Item_Name = FO.Item_Name
    WHERE FO.Order_Time BETWEEN '2024-09-02 14:00:00'
    AND '2024-09-05 13:00:00'
    GROUP BY F.Item_Name, F.Food_Type, F.Price
    ORDER BY Order_Count ASC, F.Price DESC;


    DROP TABLE IF EXISTS Food_Orders;
    DROP TABLE IF EXISTS Food;
    DROP TABLE IF EXISTS Booking_Details;
    DROP TABLE IF EXISTS Rooms;
    DROP TABLE IF EXISTS Companions;
    DROP TABLE IF EXISTS Residents;
    DROP TABLE IF EXISTS Employees;
    DROP DATABASE IF EXISTS Resort;