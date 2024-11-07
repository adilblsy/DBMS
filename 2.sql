CREATE DATABASE MedLab;
USE MedLab;

CREATE TABLE Employees(
    E_Aadhar bigint PRIMARY KEY,
    E_Name varchar(50),
    E_Address varchar(100),
    E_Mob bigint UNIQUE,
    E_Email varchar(50) UNIQUE,
    CHECK(E_Mob BETWEEN 1000000000 AND 9999999999),
    CHECK(E_Aadhar BETWEEN 100000000000 AND 999999999999)
);

CREATE TABLE Patients(
    P_Aadhar bigint PRIMARY KEY,
    P_Name varchar(50),
    Age INT CHECK(Age>0),
    P_Address varchar(100),
    P_Mob bigint UNIQUE,
    P_Email varchar(50) UNIQUE,
    CHECK(P_Mob BETWEEN 1000000000 AND 9999999999),
    CHECK(P_Aadhar BETWEEN 100000000000 AND 999999999999)
);

CREATE TABLE Test(
    Test_Name varchar(50) PRIMARY KEY,
    Test_Descr varchar(500)
);

CREATE TABLE Scan(
    Scan_Name varchar(50) PRIMARY KEY,
    Scan_Descr varchar(500),
    Amount int
);

CREATE TABLE Doctors(
    D_Aadhar bigint PRIMARY KEY,
    D_Name varchar(50),
    Specialization varchar(50),
    Hospital_Name varchar(50)
);

CREATE TABLE Patient_Test (
    P_Aadhar bigint,
    E_Aadhar bigint,
    Test_Name varchar(50),
    Test_Date date,
    D_Aadhar bigint,
    Result_Link varchar(500),
    Amount int,
    FOREIGN KEY (P_Aadhar) REFERENCES Patients(P_Aadhar) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (D_Aadhar) REFERENCES Doctors(D_Aadhar) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (E_Aadhar) REFERENCES Employees(E_Aadhar) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Test_Name) REFERENCES Test(Test_Name) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (P_Aadhar, Test_Name, Test_Date)
);

CREATE TABLE Patient_Scan (
    P_Aadhar bigint,
    E_Aadhar bigint,
    Scan_Name varchar(50),
    Scan_Date date,
    D_Aadhar bigint,
    Result_Link varchar(500),
    Prescription_Link varchar(500),
    FOREIGN KEY (P_Aadhar) REFERENCES Patients(P_Aadhar) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (D_Aadhar) REFERENCES Doctors(D_Aadhar) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (E_Aadhar) REFERENCES Employees(E_Aadhar) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Scan_Name) REFERENCES Scan(Scan_Name) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (P_Aadhar, Scan_Name, Scan_Date)
);

INSERT INTO Employees VALUES
    (123456789021, 'Amit Sharma', '101, MG Road, Mumbai, MH', 9876543210, 'amit.sharma@gmail.com'),
    (234567890132, 'Priya Singh', '202, Brigade Road, Bangalore, KA', 8765432109, 'priya.singh@gmail.com'),
    (345678901253, 'Rahul Verma', '303, Anna Salai, Chennai, TN', 7654321098, 'rahul.verma@gmail.com'),
    (456789012364, 'Neha Patil', '404, Baner Road, Pune, MH', 6543210987, 'neha.patil@gmail.com'),
    (567890123475, 'Anil Kumar', '505, Park Street, Kolkata, WB', 5432109876, 'anil.kumar@gmail.com'),
    (678901234586, 'Sonal Mehta', '606, Connaught Place, New Delhi, DL', 4321098765, 'sonal.mehta@gmail.com'),
    (789012345697, 'Vikram Iyer', '707, Banjara Hills, Hyderabad, TG', 3210987654, 'vikram.iyer@gmail.com'),
    (890123456708, 'Sneha Nair', '808, Marine Drive, Kochi, KL', 2109876543, 'sneha.nair@gmail.com'),
    (901234567819, 'Rajesh Gupta', '909, Civil Lines, Jaipur, RJ', 1098765432, 'rajesh.gupta@gmail.com'),
    (123456789023, 'Pooja Reddy', '1010, Jubilee Hills, Hyderabad, TG', 1987654321, 'pooja.reddy@gmail.com');

INSERT INTO Patients VALUES
    (234567890124, 'Rajeev Sharma', 30, '101, MG Road, Mumbai, MH', 9988776655, 'rajeeve.sharma@hospital.com'),
    (345678901235, 'Maya Singh', 22, '202, Brigade Road, Bangalore, KA', 8877665544, 'maya.singh@hospital.com'),
    (456789012346, 'Kiran Verma', 40, '303, Anna Salai, Chennai, TN', 7766554433, 'kiran.verma@hospital.com'),
    (567890123457, 'Aarti Patil', 28, '404, Baner Road, Pune, MH', 6655443322, 'aarti.patil@hospital.com'),
    (678901234568, 'Ravi Kumar', 35, '505, Park Street, Kolkata, WB', 5544332211, 'ravi.kumar@hospital.com'),
    (789012345679, 'Neelam Mehta', 55, '606, Connaught Place, New Delhi, DL', 4433221100, 'neelam.mehta@hospital.com'),
    (890123456780, 'Suresh Iyer', 65, '707, Banjara Hills, Hyderabad, TG', 3322110099, 'suresh.iyer@hospital.com'),
    (901234567891, 'Vidhya Nair', 18, '808, Marine Drive, Kochi, KL', 2211009988, 'vidhya.nair@hospital.com'),
    (123456789012, 'Tarun Gupta', 38, '909, Civil Lines, Jaipur, RJ', 1100998877, 'tarun.gupta@hospital.com'),
    (234567890123, 'Sonal Reddy', 25, '1010, Jubilee Hills, Hyderabad, TG', 9988112233, 'sonal.reddy@hospital.com');

INSERT INTO Test VALUES
    ('Complete Blood Count', 'A blood test used to evaluate your overall health and detect a wide range of disorders, including anemia, infection, and leukemia.'),
    ('Blood Glucose Test', 'A test that measures the level of glucose in your blood, often used to diagnose and monitor diabetes.'),
    ('Urine Analysis', 'A test that examines urine to detect a range of disorders, including urinary tract infections, kidney disease, and diabetes.'),
    ('Hemoglobin A1c', 'A blood test that measures your average blood glucose levels over the past 3 months.'),
    ('Vitamin D Test', 'A blood test that measures the level of vitamin D in your blood to assess bone health.'),
    ('Iron Studies', 'A series of blood tests that evaluate iron levels, including serum iron, ferritin, and transferrin saturation.');

INSERT INTO Scan VALUES
    ('MRI Brain', 'An imaging scan using magnetic fields and radio waves to create detailed images of the brain.', 1500),
    ('CT Chest', 'A scan that uses X-rays to create detailed images of the chest, including the lungs and heart.', 1200),
    ('Ultrasound Abdomen', 'An imaging scan using sound waves to visualize organs in the abdomen, such as the liver and kidneys.', 800),
    ('X-ray Spine', 'An imaging scan using X-rays to examine the spine and vertebrae for abnormalities.', 300),
    ('CT Scan of the Head', 'A scan that combines X-ray images to create cross-sectional images of the head for diagnosing head injuries.', 1300),
    ('Ultrasound Pelvis', 'An imaging scan using sound waves to visualize the pelvic organs, including the bladder and reproductive organs.', 750),
    ('MRI Knee', 'An imaging scan using magnetic fields to create detailed images of the knee joint and surrounding tissues.', 1400),
    ('CT Scan of the Abdomen', 'A scan that uses X-rays to create detailed images of the abdomen for diagnosing conditions such as tumors.', 1250),
    ('Ultrasound Heart', 'An imaging scan using sound waves to assess the structure and function of the heart.', 850),
    ('X-ray Chest', 'An imaging scan using X-rays to examine the chest cavity, including the lungs and heart.', 350),
    ('CT Scan of the Spine', 'A scan that combines X-ray images to create detailed images of the spine for diagnosing spinal disorders.', 1300),
    ('MRI Shoulder', 'An imaging scan using magnetic fields to visualize the shoulder joint and surrounding muscles and ligaments.', 1450),
    ('Ultrasound Thyroid', 'An imaging scan using sound waves to evaluate the thyroid gland for nodules or other abnormalities.', 700),
    ('CT Scan of the Pelvis', 'A scan that uses X-rays to create detailed images of the pelvis to diagnose conditions such as tumors or fractures.', 1200),
    ('X-ray Hand', 'An imaging scan using X-rays to examine the bones of the hand for fractures or other issues.', 300);

INSERT INTO Doctors VALUES
    (101234567890, 'Dr. Arjun Patel', 'Cardiologist', 'Apollo Hospital, Mumbai'),
    (102345678901, 'Dr. Simran Kapoor', 'Neurologist', 'Fortis Hospital, Bangalore'),
    (103456789012, 'Dr. Karan Singh', 'Orthopedic Surgeon', 'Max Healthcare, Delhi'),
    (104567890123, 'Dr. Meera Deshmukh', 'Gynecologist', 'Medanta, Gurgaon'),
    (105678901234, 'Dr. Rajeev Malhotra', 'Pediatrician', 'Narayana Health, Bangalore'),
    (106789012345, 'Dr. Neelam Shah', 'Dermatologist', 'Kokilaben Dhirubhai Ambani Hospital, Mumbai'),
    (107890123456, 'Dr. Arvind Kumar', 'Oncologist', 'Tata Memorial Hospital, Mumbai'),
    (108901234567, 'Dr. Priyanka Iyer', 'ENT Specialist', 'BLK Super Specialty Hospital, Delhi'),
    (109012345678, 'Dr. Sameer Rathi', 'Pulmonologist', 'Indraprastha Apollo Hospital, Delhi'),
    (110123456789, 'Dr. Shalini Bhat', 'Nephrologist', 'Care Hospital, Hyderabad');

INSERT INTO Patient_Scan VALUES
    (234567890124, 123456789021, 'MRI Brain', '2024-08-01', 101234567890, 'http://example.com/results/13575_MRI_Brain', 'http://example.com/prescriptions/13575_MRI_Brain'),
    (345678901235, 234567890132, 'CT Chest', '2024-08-02', 102345678901, 'http://example.com/results/24682_CT_Chest', 'http://example.com/prescriptions/24682_CT_Chest'),
    (456789012346, 345678901253, 'X-ray Hand', '2024-08-03', 103456789012, 'http://example.com/results/35793_Xray_Hand', 'http://example.com/prescriptions/35793_Xray_Hand'),
    (567890123457, 456789012364, 'MRI Brain', '2024-08-04', 104567890123, 'http://example.com/results/46807_MRI_Brain', 'http://example.com/prescriptions/46807_MRI_Brain'),
    (678901234568, 567890123475, 'CT Scan of the Head', '2024-08-05', 105678901234, 'http://example.com/results/57911_CT_Scan_Head', 'http://example.com/prescriptions/57911_CT_Scan_Head'),
    (789012345679, 678901234586, 'X-ray Chest', '2024-08-06', 106789012345, 'http://example.com/results/68020_Xray_Chest', 'http://example.com/prescriptions/68020_Xray_Chest'),
    (890123456780, 789012345697, 'X-ray Hand', '2024-08-07', 107890123456, 'http://example.com/results/79139_Xray_Hand', 'http://example.com/prescriptions/79139_Xray_Hand'),
    (901234567891, 890123456708, 'MRI Brain', '2024-08-08', 108901234567, 'http://example.com/results/80242_MRI_Brain', 'http://example.com/prescriptions/80242_MRI_Brain'),
    (890123456780, 901234567819, 'CT Scan of the Spine', '2024-08-09', 109012345678, 'http://example.com/results/13579_CT_Scan_Spine', 'http://example.com/prescriptions/135_CT_Scan_Spine'),
    (456789012346, 901234567819, 'MRI Brain', '2024-08-10', 110123456789, 'http://example.com/results/24680_MRI_Brain', 'http://example.com/prescriptions/24680_MRI_Brain');

INSERT INTO Patient_Test VALUES
    (234567890124, 123456789021, 'Complete Blood Count', '2024-08-01', 101234567890, 'http://example.com/results/13575_CBC', 500),
    (345678901235, 234567890132, 'Blood Glucose Test', '2024-08-02', 102345678901, 'http://example.com/results/24682_Lipid_Profile', 700),
    (456789012346, 345678901253, 'Urine Analysis', '2024-08-03', 103456789012, 'http://example.com/results/35793_LFT', 800),
    (567890123457, 456789012364, 'Urine Analysis', '2024-08-04', 104567890123, 'http://example.com/results/46807_TFT', 600),
    (678901234568, 567890123475, 'Hemoglobin A1c', '2024-08-05', 105678901234, 'http://example.com/results/57911_KFT', 750),
    (789012345679, 678901234586, 'Blood Glucose Test', '2024-08-06', 106789012345, 'http://example.com/results/68020_BGT', 300),
    (890123456780, 789012345697, 'Urine Analysis', '2024-08-07', 107890123456, 'http://example.com/results/79139_UA', 200),
    (901234567891, 890123456708, 'Vitamin D Test', '2024-08-08', 108901234567, 'http://example.com/results/80242_SE', 650),
    (901234567891, 901234567819, 'Hemoglobin A1c', '2024-08-09', 109012345678, 'http://example.com/results/91358_HbA1c', 450),
    (456789012346, 345678901253, 'Iron Studies', '2024-09-10', 110123456789, 'http://example.com/results/12461_PT', 570),
    (456789012346, 345678901253, 'Hemoglobin A1c', '2024-09-13', 102345678901, 'http://example.com/results/12462_PT', 500),
    (901234567891, 345678901253, 'Vitamin D Test', '2024-09-15', 110123456789, 'http://example.com/results/12463_PT', 400),
    (567890123457, 345678901253, 'Blood Glucose Test', '2024-09-20', 108901234567, 'http://example.com/results/12464_PT', 350),
    (567890123457, 345678901253, 'Complete Blood Count', '2024-09-25', 106789012345, 'http://example.com/results/12465_PT', 500);


-- 1
SELECT T.* 
FROM Test T 
INNER JOIN Patient_Test PT ON T.Test_Name = PT.Test_Name
INNER JOIN Patients P ON PT.P_Aadhar = P.P_Aadhar
INNER JOIN Doctors D ON PT.D_Aadhar = D.D_Aadhar
WHERE D.D_Name = 'Dr. Karan Singh' 
AND PT.Test_Date BETWEEN '2024-08-01' AND '2024-10-01';


-- 2
SELECT T.Test_Name, P.*
FROM Test T
INNER JOIN Patient_Test PT ON T.Test_Name = PT.Test_Name
INNER JOIN Patients P ON PT.P_Aadhar = P.P_Aadhar
INNER JOIN Doctors D ON PT.D_Aadhar = D.D_Aadhar
ORDER BY T.Test_Name;

-- 3
CREATE VIEW Test_Patient_Count AS
SELECT PT.Test_Name, COUNT(PT.P_Aadhar) AS Patient_Count
FROM Patient_Test PT
GROUP BY PT.Test_Name;

-- 3.1
SELECT *
FROM Test_Patient_Count
WHERE Patient_Count = (SELECT MAX(Patient_Count) FROM Test_Patient_Count);

-- 3.2
SELECT *
FROM Test_Patient_Count
WHERE Patient_Count = (SELECT MIN(Patient_Count) FROM Test_Patient_Count);


-- 4
SELECT S.Scan_Name, P.*, COUNT(PS.P_Aadhar) AS Scan_Count
FROM Scan S
INNER JOIN Patient_Scan PS ON S.Scan_Name = PS.Scan_Name
INNER JOIN Patients P ON PS.P_Aadhar = P.P_Aadhar
INNER JOIN Doctors D ON PS.D_Aadhar = D.D_Aadhar
GROUP BY S.Scan_Name, P.P_Aadhar, P.P_Name, P.Age, P.P_Address, P.P_Mob, P.P_Email
HAVING COUNT(PS.P_Aadhar) <= 2;


-- 5
SELECT
    (SELECT SUM(PT.Amount) FROM Patient_Test PT) +
    (SELECT SUM(S.Amount) FROM Scan S
    INNER JOIN Patient_Scan PS ON S.Scan_Name = PS.Scan_Name) AS Total_Amount;

-- 6.1
    SELECT S.*, PS.P_Aadhar, PS.Scan_Date
    FROM Scan S
    INNER JOIN Patient_Scan PS ON S.Scan_Name = PS.Scan_Name
    ORDER BY PS.Scan_Date ASC
    LIMIT 1;
    
-- 6.2
    SELECT S.*, PS.P_Aadhar, PS.Scan_Date
    FROM Scan S
    INNER JOIN Patient_Scan PS ON S.Scan_Name = PS.Scan_Name
    ORDER BY PS.Scan_Date DESC
    LIMIT 1;


-- 7
CREATE VIEW Doctor_Test_Counts AS
SELECT 
    D.D_Aadhar,
    D.D_Name, 
    D.Specialization, 
    D.Hospital_Name, 
    COUNT(PT.Test_Name) AS Prescribed_Test_Count
FROM Patient_Test PT
INNER JOIN Doctors D ON PT.D_Aadhar = D.D_Aadhar
WHERE PT.Test_Date BETWEEN '2023-01-01' AND '2025-01-01'
GROUP BY D.D_Aadhar, D.D_Name, D.Specialization, D.Hospital_Name;

-- 7.1
SELECT 
    D.D_Name, 
    D.D_Aadhar, 
    D.Specialization, 
    D.Hospital_Name, 
    D.Prescribed_Test_Count
FROM Doctor_Test_Counts D
WHERE D.Prescribed_Test_Count = (SELECT MAX(Prescribed_Test_Count) FROM Doctor_Test_Counts);

-- 7.2
SELECT 
    D.D_Name, 
    D.D_Aadhar, 
    D.Specialization, 
    D.Hospital_Name, 
    D.Prescribed_Test_Count
FROM Doctor_Test_Counts D
WHERE D.Prescribed_Test_Count = (SELECT MIN(Prescribed_Test_Count) FROM Doctor_Test_Counts);


-- 8
SELECT Comb.D_Name, Comb.D_Aadhar, SUM(Amount) AS Total_Amount
FROM (
    SELECT D.D_Name, D.D_Aadhar, SUM(S.Amount) AS Amount
    FROM Scan S
    INNER JOIN Patient_Scan PS ON S.Scan_Name = PS.Scan_Name
    INNER JOIN Doctors D ON PS.D_Aadhar = D.D_Aadhar
    GROUP BY D.D_Aadhar, D.D_Name
    UNION ALL
    SELECT D.D_Name, D.D_Aadhar, SUM(PT.Amount) AS Amount
    FROM Patient_Test PT
    INNER JOIN Doctors D ON PT.D_Aadhar = D.D_Aadhar
    GROUP BY D.D_Aadhar, D.D_Name
) AS Comb
GROUP BY Comb.D_Aadhar, Comb.D_Name;



-- 9.1
SELECT E.E_Aadhar, E.E_Name, E.E_Address, E.E_Mob, E.E_Email
FROM Employees E
INNER JOIN Patient_Test PT ON E.E_Aadhar = PT.E_Aadhar
GROUP BY E.E_Aadhar
HAVING COUNT(DISTINCT PT.Test_Name) = 1;

-- 9.2
SELECT E.E_Aadhar, E.E_Name, E.E_Address, E.E_Mob, E.E_Email
FROM Employees E
INNER JOIN Patient_Test PT ON E.E_Aadhar = PT.E_Aadhar
GROUP BY E.E_Aadhar
HAVING COUNT(DISTINCT PT.Test_Name) = (SELECT COUNT(*) FROM Test);


-- 10
SELECT E.E_Aadhar, E.E_Name, COUNT(PT.Test_Name) AS Test_Count
FROM Employees E
INNER JOIN Patient_Test PT ON E.E_Aadhar = PT.E_Aadhar
GROUP BY E.E_Aadhar, E.E_Name
ORDER BY Test_Count DESC;


-- 11
SELECT 
    CASE 
        WHEN EXISTS (
            SELECT 1
            FROM Employees E
            INNER JOIN Patient_Test PT ON E.E_Aadhar = PT.E_Aadhar
            INNER JOIN Patients P ON PT.P_Aadhar = P.P_Aadhar
            GROUP BY E.E_Aadhar, P.P_Aadhar
            HAVING COUNT(DISTINCT PT.Test_Name) = (SELECT COUNT(*) FROM Test WHERE Test.Test_Name IN (SELECT PT.Test_Name FROM Patient_Test PT WHERE PT.P_Aadhar = P.P_Aadhar))
        ) THEN 'TRUE'
        ELSE 'FALSE'
    END AS All_Tests_Performed;
    

DROP TABLE IF EXISTS Patient_Test;
DROP TABLE IF EXISTS Patient_Scan;
DROP TABLE IF EXISTS Doctors;
DROP TABLE IF EXISTS Scan;
DROP TABLE IF EXISTS Test;
DROP TABLE IF EXISTS Patients;
DROP TABLE IF EXISTS Employees;
DROP DATABASE IF EXISTS MedLab;
