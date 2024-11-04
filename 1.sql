CREATE DATABASE Chitty;
USE Chitty;


CREATE TABLE Customer(
	Name varchar(20),
	Aadhar_Number bigint primary key,
	Pan_Number char(10) UNIQUE,
	Mobile_Number char(10) UNIQUE,
	Adress varchar(50),
	Email_ID varchar(30) UNIQUE,
	CHECK(Mobile_Number BETWEEN '0000000000' AND '9999999999'),
    CHECK(Aadhar_Number BETWEEN '000000000000' AND '999999999999')
);


CREATE TABLE Chitty(
	Chitty_Number varchar(10) primary key,
	Branch_Name varchar(20),
	Chitty_Amount float,
	Start_Date date,
	Installments int,
	Chitty_Status varchar(10),
	CHECK (Chitty_Status IN ('Active','Closed','Pending'))
);


CREATE TABLE Loan(
	Loan_Number varchar(10) primary key,
	Loan_Type varchar(20),
	Aadhar_Number bigint,
	Chitty_Number varchar(10),
	Loan_Amount float,
	Loan_Period int,
	EMI float,
	Loan_Branch varchar(20),
	CHECK (Loan_Type IN ('Home Loan','Car Loan','Personal Loan', 'Business Loan')),
	foreign key(Aadhar_Number) REFERENCES Customer(Aadhar_Number) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key(Chitty_Number) REFERENCES Chitty(Chitty_Number) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Customer_Chitty(
    Aadhar_Number bigint,
    Chitty_Number varchar(10),
    Chittal_Number varchar(10),
    foreign key(Aadhar_Number) REFERENCES Customer(Aadhar_Number) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key(Chitty_Number) REFERENCES Chitty(Chitty_Number) ON DELETE CASCADE ON UPDATE CASCADE,
    primary key(Aadhar_Number, Chitty_Number, Chittal_Number)
);


CREATE TABLE Chitty_Payment(
    Chitty_Number varchar(10),
    Chittal_Number varchar(10),
    Aadhar_Number bigint,
    Paid_amount float,
    Payment_Date date,
    Payment_Mode varchar(10),
    Chitty_Payed_Branch varchar(20),
    foreign key(Chitty_Number) REFERENCES Chitty(Chitty_Number) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key(Aadhar_Number, Chitty_Number, Chittal_Number) REFERENCES Customer_Chitty(Aadhar_Number, Chitty_Number, Chittal_Number) ON DELETE CASCADE ON UPDATE CASCADE,
    primary key(Chitty_Number, Chittal_Number, Payment_Date)
);


CREATE TABLE Chitty_Auction(
	Chitty_Number varchar(10),
	Chittal_Number varchar(10),
	Auction_Branch varchar(20),
	Aadhar_Number bigint,
	Amount_Auctioned float,
	foreign key(Chitty_Number) REFERENCES Chitty(Chitty_Number) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key(Aadhar_Number, Chitty_Number, Chittal_Number) REFERENCES Customer_Chitty(Aadhar_Number, Chitty_Number, Chittal_Number) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key(Aadhar_Number) REFERENCES Customer(Aadhar_Number) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key(Chitty_Number, Chittal_Number)
);


CREATE TABLE Loan_Payment(
    Aadhar_Number bigint,
    Loan_Number varchar(10),
    Payment_Date date,
    Loan_Payment_Branch varchar(20),
    foreign key(Aadhar_Number) REFERENCES Customer(Aadhar_Number) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key(Loan_Number) REFERENCES Loan(Loan_Number) ON DELETE CASCADE ON UPDATE CASCADE,
    primary key(Aadhar_Number, Loan_Number, Payment_Date)
);



INSERT INTO Customer VALUES
	('Rajesh Kumar', '123456789012', 'ABCDE1234F', '9876543210', '123, MG Road, Mumbai', 'rajeshkumar1@gmail.com'),
	('Anita Sharma', '234567890123', 'BCDEF2345G', '8765432109', '456, Park Street, Kolkata', 'anitasharma1@gmail.com'),
	('Sunil Gupta', '345678901234', 'CDEFG3456H', '7654321098', '789, Nehru Nagar, Delhi', 'sunilgupta1@gmail.com'),
	('Priya Singh', '456789012345', 'DEFGH4567I', '6543210987', '101, Gandhi Road, Chennai', 'priyasingh1@gmail.com'),
	('Rahul Verma', '567890123456', 'EFGHI5678J', '5432109876', '102, MG Road, Pune', 'rahulverma1@gmail.com'),
	('Pooja Reddy', '678901234567', 'FGHIJ6789K', '4321098765', '103, Anna Salai, Hyderabad', 'poojareddy1@gmail.com'),
	('Vikram Rao', '789012345678', 'GHIJK7890L', '3210987654', '104, Brigade Road, Bangalore', 'vikramrao1@gmail.com'),
	('Neha Kapoor', '890123456789', 'HIJKL8901M', '2109876543', '105, Connaught Place, Delhi', 'nehakapoor1@gmail.com'),
	('Arjun Patel', '901234567890', 'IJKLM9012N', '1098765432', '106, SG Highway, Ahmedabad', 'arjunpatel1@gmail.com'),
	('Meera Nair', '112345678901', 'JKLMN0123O', '0987654321', '107, Marine Drive, Kochi', 'meeranair1@gmail.com'),
	('Karan Malhotra', '223456789012', 'KLMNO1234P', '1987654320', '108, Linking Road, Mumbai', 'karanmalhotra1@gmail.com'),
	('Kavita Mehta', '334567890123', 'LMNOP2345Q', '2987654319', '109, Fort Road, Jaipur', 'kavinamehta1@gmail.com'),
	('Sameer Shah', '445678901234', 'MNOPQ3456R', '3987654318', '110, Law Garden, Ahmedabad', 'sameershah1@gmail.com'),
	('Anjali Desai', '556789012345', 'NOPQR4567S', '4987654317', '111, FC Road, Pune', 'anjalidesai1@gmail.com'),
	('Rakesh Agarwal', '667890123456', 'OPQRS5678T', '5987654316', '112, Sector 5, Noida', 'rakeshagarwal1@gmail.com');



INSERT INTO Chitty VALUES
	(104521, 'Mumbai', 50000, '2024-01-15', 12, 'Active'),
	(235647, 'Delhi', 75000, '2024-02-10', 18, 'Closed'),
	(896312, 'Bangalore', 100000, '2024-03-05', 24, 'Active'),
	(563728, 'Chennai', 50000, '2024-01-15', 12, 'Active'),
	(748921, 'Mumbai', 75000, '2024-02-10', 18, 'Pending'),
	(672134, 'Delhi', 100000, '2024-03-05', 24, 'Closed'),
	(483916, 'Bangalore', 50000, '2024-01-15', 12, 'Active'),
	(249871, 'Chennai', 75000, '2024-02-10', 18, 'Pending'),
	(912546, 'Mumbai', 100000, '2024-03-05', 24, 'Active'),
	(730182, 'Delhi', 50000, '2024-01-15', 12, 'Closed'),
	(649831, 'Bangalore', 75000, '2024-02-10', 18, 'Active'),
	(815349, 'Chennai', 100000, '2024-03-05', 24, 'Pending'),
	(564723, 'Mumbai', 50000, '2024-01-15', 12, 'Closed'),
	(297834, 'Delhi', 75000, '2024-02-10', 18, 'Active'),
	(619284, 'Bangalore', 100000, '2024-03-05', 24, 'Active');



INSERT INTO Loan VALUES
	(987654, 'Home Loan', '123456789012', 104521, 5000000, 240, 50000, 'Mumbai'),
	(543216, 'Car Loan', '234567890123', 235647, 800000, 60, 15000, 'Delhi'),
	(789321, 'Personal Loan', '345678901234', 896312, 300000, 36, 9000, 'Bangalore'),
	(654987, 'Business Loan', '456789012345', 563728, 1500000, 120, 20000, 'Chennai'),
	(321456, 'Home Loan', '567890123456', 748921, 6000000, 240, 60000, 'Mumbai'),
	(876543, 'Car Loan', '678901234567', 672134, 900000, 60, 17000, 'Delhi'),
	(432198, 'Personal Loan', '789012345678', 483916, 400000, 48, 11000, 'Bangalore'),
	(198765, 'Car Loan', '890123456789', 249871, 2000000, 120, 25000, 'Chennai'),
	(567890, 'Personal Loan', '901234567890', 912546, 4500000, 240, 45000, 'Mumbai'),
	(345678, 'Car Loan', '112345678901', 730182, 700000, 60, 13000, 'Delhi'),
	(789012, 'Personal Loan', '223456789012', 649831, 250000, 36, 8000, 'Bangalore'),
	(654321, 'Business Loan', '334567890123', 815349, 1000000, 120, 15000, 'Chennai'),
	(321987, 'Business Loan', '445678901234', 564723, 5500000, 240, 55000, 'Mumbai');


INSERT INTO Customer_Chitty  VALUES
    ('123456789012', 104521, 'CHT001'),
    ('234567890123', 235647, 'CHT002'),
    ('345678901234', 896312, 'CHT003'),
    ('456789012345', 563728, 'CHT004'),
    ('567890123456', 748921, 'CHT005'),
    ('678901234567', 672134, 'CHT006'),
    ('789012345678', 483916, 'CHT007'),
    ('890123456789', 249871, 'CHT008'),
    ('901234567890', 912546, 'CHT009'),
    ('112345678901', 730182, 'CHT010'),
    ('223456789012', 649831, 'CHT011'),
    ('334567890123', 815349, 'CHT012'),
    ('445678901234', 564723, 'CHT013'),
    ('556789012345', 297834, 'CHT014'),
    ('667890123456', 619284, 'CHT015');



INSERT INTO Chitty_Payment VALUES
	('104521', 'CHT001', '123456789012', 10000, '2024-01-20', 'Cash', 'Mumbai'),
	('235647', 'CHT002', '234567890123', 15000, '2024-02-15', 'Cheque', 'Delhi'),
	('896312', 'CHT003', '345678901234', 20000, '2024-03-10', 'Online', 'Mumbai'),
	('563728', 'CHT004', '456789012345', 12000, '2024-01-25', 'Cash', 'Chennai'),
	('748921', 'CHT005', '567890123456', 18000, '2024-02-20', 'Cheque', 'Bangalore'),
	('672134', 'CHT006', '678901234567', 25000, '2024-03-15', 'Online', 'Delhi'),
	('483916', 'CHT007', '789012345678', 11000, '2024-01-30', 'Cash', 'Bangalore'),
	('249871', 'CHT008', '890123456789', 16000, '2024-02-25', 'Cheque', 'Chennai'),
	('912546', 'CHT009', '901234567890', 22000, '2024-03-20', 'Online', 'Mumbai'),
	('730182', 'CHT010', '112345678901', 13000, '2024-01-10', 'Cash', 'Delhi'),
	('649831', 'CHT011', '223456789012', 17000, '2024-02-05', 'Cheque', 'Bangalore'),
	('815349', 'CHT012', '334567890123', 21000, '2024-03-25', 'Online', 'Chennai'),
	('564723', 'CHT013', '445678901234', 14000, '2024-01-15', 'Cash', 'Mumbai'),
	('297834', 'CHT014', '556789012345', 19000, '2024-02-10', 'Cheque', 'Bangalore'),
	('619284', 'CHT015', '667890123456', 23000, '2024-03-30', 'Online', 'Delhi');



INSERT INTO Chitty_Auction VALUES
    ('104521', 'CHT001', 'Mumbai', '123456789012', 50000),
    ('235647', 'CHT002', 'Delhi', '234567890123', 75000),
    ('896312', 'CHT003', 'Bangalore', '345678901234', 100000),
    ('563728', 'CHT004', 'Chennai', '456789012345', 60000),
    ('748921', 'CHT005', 'Mumbai', '567890123456', 80000),
    ('672134', 'CHT006', 'Delhi', '678901234567', 120000),
    ('483916', 'CHT007', 'Bangalore', '789012345678', 55000),
    ('249871', 'CHT008', 'Chennai', '890123456789', 70000),
    ('912546', 'CHT009', 'Mumbai', '901234567890', 90000),
    ('730182', 'CHT010', 'Delhi', '112345678901', 65000),
    ('649831', 'CHT011', 'Bangalore', '223456789012', 85000),
    ('815349', 'CHT012', 'Chennai', '334567890123', 95000),
    ('564723', 'CHT013', 'Mumbai', '445678901234', 72000),
    ('297834', 'CHT014', 'Delhi', '556789012345', 110000),
    ('619284', 'CHT015', 'Bangalore', '667890123456', 130000);



INSERT INTO Loan_Payment VALUES
	('123456789012', 987654, '2024-01-20', 'Mumbai'),
	('234567890123', 543216, '2024-02-15', 'Delhi'),
	('345678901234', 789321, '2024-03-10', 'Bangalore'),
	('456789012345', 654987, '2024-01-25', 'Chennai'),
	('567890123456', 321456, '2024-02-20', 'Mumbai'),
	('678901234567', 876543, '2024-03-15', 'Delhi'),
	('789012345678', 432198, '2024-01-30', 'Bangalore'),
	('890123456789', 198765, '2024-02-25', 'Chennai'),
	('901234567890', 567890, '2024-03-20', 'Mumbai'),
	('112345678901', 345678, '2024-01-10', 'Delhi'),
	('223456789012', 789012, '2024-02-05', 'Bangalore'),
	('334567890123', 654321, '2024-03-25', 'Chennai'),
	('445678901234', 321987, '2024-01-15', 'Mumbai');



-- 1.1
SELECT C.*
FROM Customer C
INNER JOIN Customer_Chitty CC ON C.Aadhar_Number = CC.Aadhar_Number
INNER JOIN Loan L ON C.Aadhar_Number = L.Aadhar_Number;


-- 1.2
SELECT C.*
FROM Customer C
INNER JOIN Customer_Chitty CC ON C.Aadhar_Number = CC.Aadhar_Number
LEFT JOIN Loan L ON C.Aadhar_Number = L.Aadhar_Number
WHERE L.Aadhar_Number IS NULL;


-- 2
SELECT C.Name, C.Aadhar_Number, C.Pan_Number, C.Mobile_Number, C.Adress, C.Email_Id, L.*
FROM Customer C
INNER JOIN Loan L ON C.Aadhar_Number = L.Aadhar_Number
ORDER BY L.Loan_Amount DESC;


-- 3
SELECT L.Loan_Branch, L.Loan_Type, COUNT(*) AS Count
FROM Loan L
INNER JOIN Loan_Payment LP ON L.Loan_Number = LP.Loan_Number
GROUP BY Loan_Branch, Loan_Type
ORDER By Loan_Branch;


-- 4
SELECT C.*, CT.Branch_Name, CP.Chitty_Payed_Branch
FROM Customer C
INNER JOIN Customer_Chitty CC ON C.Aadhar_Number = CC.Aadhar_Number
INNER JOIN Chitty CT ON CC.Chitty_Number = CT.Chitty_Number
INNER JOIN Chitty_Payment CP ON CT.Chitty_Number = CP.Chitty_Number
WHERE CP.Chitty_Payed_Branch != CT.Branch_Name;


-- 5
(
    SELECT 
        CA.Amount_Auctioned, 
        CA.Auction_Branch, 
        C.Aadhar_Number, 
        C.Name, 
        C.Pan_Number, 
        C.Mobile_Number, 
        C.Address, 
        C.Email_Id 
    FROM 
        Customer C
    JOIN 
        Customer_Chitty CC ON C.Aadhar_Number = CC.Aadhar_Number
    JOIN 
        Chitty CT ON CC.Chitty_Number = CT.Chitty_Number
    JOIN 
        Chitty_Auction CA ON CA.Chitty_Number = CT.Chitty_Number
    WHERE 
        CT.Chitty_Status = 'closed'
    GROUP BY 
        CA.Auction_Branch, CA.Amount_Auctioned, C.Aadhar_Number, C.Name, C.Pan_Number, C.Mobile_Number, C.Address, C.Email_Id 
    ORDER BY 
        CA.Amount_Auctioned DESC 
    LIMIT 1
)
UNION ALL
(
    SELECT 
        CA.Amount_Auctioned, 
        CA.Auction_Branch, 
        C.Aadhar_Number, 
        C.Name, 
        C.Pan_Number, 
        C.Mobile_Number, 
        C.Address, 
        C.Email_Id 
    FROM 
        Customer C
    JOIN 
        Customer_Chitty CC ON C.Aadhar_Number = CC.Aadhar_Number
    JOIN 
        Chitty CT ON CC.Chitty_Number = CT.Chitty_Number
    JOIN 
        Chitty_Auction CA ON CA.Chitty_Number = CT.Chitty_Number
    WHERE 
        CT.Chitty_Status = 'closed'
    GROUP BY 
        CA.Auction_Branch, CA.Amount_Auctioned, C.Aadhar_Number, C.Name, C.Pan_Number, C.Mobile_Number, C.Address, C.Email_Id 
    ORDER BY 
        CA.Amount_Auctioned ASC 
    LIMIT 1
);


DROP DATABASE Chitty;
