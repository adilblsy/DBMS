CREATE DATABASE Thesis;
USE Thesis;


CREATE TABLE Student (
    s_name varchar(30),
    address varchar(200),
    s_email varchar(50),
    roll_no char(7) primary key,
    s_mob_no bigint unique check(s_mob_no between 0000000000 and 9999999999),
    CHECK (substring(roll_no from 1 for 2) in ('CS','AM','EC','EE','ME','CE')),
    CHECK (substring(roll_no from 3 for 2) between '00' and '99'),
    CHECK (substring(roll_no from 5 for 1) in ('M', 'P')), 
    CHECK (substring(roll_no from 6 for 2) between '01' and '99')
);

CREATE TABLE Guide(
	g_name varchar(30),
	emp_id varchar(10) primary key,
	designation varchar(20),
	research_area varchar(30),
	dept varchar(30),
	g_email varchar(50),
	g_mob_no bigint check(g_mob_no between 0000000000 and 9999999999)
);

CREATE TABLE Thesis(
	thesis_id varchar(5) primary key,
	title varchar(50),
	thesis_area varchar(30)
);

CREATE TABLE Submission(
	roll_no char(7),
	emp_id varchar(10),
	thesis_id varchar(5),
	sub_date date,
	primary key(roll_no,emp_id,thesis_id),
	foreign key (thesis_id) references Thesis(thesis_id) on delete cascade on update cascade,
	foreign key (emp_id) references Guide(emp_id) on delete cascade on update cascade,
	foreign key (roll_no) references Student(roll_no) on delete cascade on update cascade
);

CREATE TABLE Indices(
	thesis_index varchar(10) primary key,
	thesis_id varchar(5),
	keywords varchar(100),
	foreign key (thesis_id) references Thesis(thesis_id) on delete cascade on update cascade 
);


INSERT INTO Student VALUES
('Aarav Singh', 'New Delhi, India', 'aarav.singh@gmail.com', 'CS01P01', '7893201546'),
('Meera Nair', 'Kochi, India', 'meera.nair@gmail.com', 'AM03M02', '9875104263'),
('Rahul Patil', 'Mumbai, India', 'rahul.patil@gmail.com', 'EE99P03', '6547320981'),
('Sanya Verma', 'Lucknow, India', 'sanya.verma@gmail.com', 'ME04M04', '9043672518'),
('Ishaan Kapoor', 'Chennai, India', 'ishaan.kapoor@gmail.com', 'CS02P05', '6739215480'),
('Nisha Gupta', 'Bangalore, India', 'nisha.gupta@gmail.com', 'CE23M06', '9124578063'),
('Vikram Rao', 'Hyderabad, India', 'vikram.rao@gmail.com', 'EC00P07', '8054132769'),
('Simran Kaur', 'Amritsar, India', 'simran.kaur@gmail.com', 'AM90P08', '3728915064'),
('Karthik Menon', 'Thiruvananthapuram, India', 'karthik.menon@gmail.com', 'ME22M09', '1689703542'),
('Priya Sharma', 'Jaipur, India', 'priya.sharma@gmail.com', 'EE05P10', '9401278365'),
('Rohan Das', 'Kolkata, India', 'rohan.das@gmail.com', 'CS03M11', '7829364150'),
('Anjali Desai', 'Ahmedabad, India', 'anjali.desai@gmail.com', 'CE98P12', '2957610483'),
('Varun Singh', 'Patna, India', 'varun.singh@gmail.com', 'EC91M13', '8904723651'),
('Sneha Iyer', 'Pune, India', 'sneha.iyer@gmail.com', 'AM02P14', '4709123568'),
('Arjun Pillai', 'Thrissur, India', 'arjun.pillai@gmail.com', 'ME24P15', '6935820147');


INSERT INTO Guide VALUES
('Dr. Neha Mathur', 'EMP001', 'Professor', 'Machine Learning', 'AI and Machine Learning', 'neha.mathur@university.edu', '9814725360'),
('Dr. Anil Menon', 'EMP002', 'Associate Professor', 'Robotics', 'Robotics', 'anil.menon@university.edu', '7541930268'),
('Dr. Rajesh Iyer', 'EMP003', 'Assistant Professor', 'VLSI Design', 'Electronics', 'rajesh.iyer@university.edu', '6923475108'),
('Dr. Meena Gupta', 'EMP004', 'Professor', 'Structural Engineering', 'Civil', 'meena.gupta@university.edu', '8125467093'),
('Dr. Kiran Patil', 'EMP005', 'Professor', 'Power Systems', 'Electrical', 'kiran.patil@university.edu', '5302918476'),
('Dr. Nandini Rao', 'EMP006', 'Associate Professor', 'Artificial Intelligence', 'Artificial Intelligence', 'nandini.rao@university.edu', '7816423059'),
('Dr. Sanjay Kumar', 'EMP007', 'Assistant Professor', 'Embedded Systems', 'Computer Science', 'sanjay.kumar@university.edu', '4091827365'),
('Dr. Pooja Sharma', 'EMP008', 'Professor', 'Architecture Design', 'B.Arch', 'pooja.sharma@university.edu', '8165249703');


INSERT INTO Thesis VALUES
('TH001', 'Optimization of Machine Learning Algorithms', 'Artificial Intelligence'),
('TH002', 'Sustainable Urban Architecture in India', 'B.Arch'),
('TH003', 'Deep Learning Applications in Medical Imaging', 'Computer Science'),
('TH004', 'Advanced Control Systems in Robotics', 'Robotics'),
('TH005', 'VLSI Design for Low Power Applications', 'Electronics'),
('TH006', 'Finite Element Analysis in Structural Engineering', 'Civil'),
('TH007', 'Smart Grid Technologies for Renewable Energy', 'Electrical'),
('TH008', 'Autonomous Vehicle Navigation Systems', 'Mechanical'),
('TH009', 'Neural Networks for Natural Language Processing', 'AI and Machine Learning'),
('TH010', 'Blockchain Applications in Supply Chain Management', 'Computer Science'),
('TH011', 'Sustainable Construction Practices in India', 'Civil'),
('TH012', 'Energy Efficient Design in Mechatronics Systems', 'Mechanical'),
('TH013', 'AI in Healthcare: Predictive Models', 'Artificial Intelligence'),
('TH014', 'IoT-Based Smart Home Systems', 'Electronics'),
('TH015', 'Design of Earthquake-Resistant Structures', 'B.Arch');



INSERT INTO Submission VALUES
('CS01P01', 'EMP001', 'TH001', '1995-06-15'),
('AM03M02', 'EMP002', 'TH004', '2001-09-12'),
('EE99P03', 'EMP005', 'TH007', '2010-11-03'),
('ME04M04', 'EMP008', 'TH012', '2015-04-25'),
('CS02P05', 'EMP007', 'TH003', '1999-07-18'),
('CE23M06', 'EMP004', 'TH006', '2020-08-22'),
('EC00P07', 'EMP003', 'TH005', '2005-03-14'),
('AM90P08', 'EMP002', 'TH009', '2012-12-01'),
('ME22M09', 'EMP008', 'TH015', '1998-05-09'),
('EE05P10', 'EMP005', 'TH007', '2007-10-20'),
('CS03M11', 'EMP007', 'TH010', '1993-03-27'),
('CE98P12', 'EMP004', 'TH011', '2018-09-08'),
('EC91M13', 'EMP003', 'TH014', '2011-02-02'),
('AM02P14', 'EMP006', 'TH013', '2022-07-31'),
('ME24P15', 'EMP008', 'TH012', '1994-11-16'),
('CS01P01', 'EMP006', 'TH009', '2003-01-30'),
('AM03M02', 'EMP003', 'TH005', '1997-10-11'),
('EE99P03', 'EMP001', 'TH001', '2009-06-18'),
('ME04M04', 'EMP005', 'TH008', '1990-08-14'),
('CS02P05', 'EMP002', 'TH004', '2016-12-04'),
('CE23M06', 'EMP008', 'TH015', '2002-02-27'),
('EC00P07', 'EMP001', 'TH002', '2021-05-19'),
('AM90P08', 'EMP004', 'TH006', '2014-04-23'),
('ME22M09', 'EMP006', 'TH013', '1992-03-05'),
('EE05P10', 'EMP003', 'TH014', '2023-11-10');


INSERT INTO Indices VALUES
('IDX001', 'TH001', 'Machine Learning, Optimization, Approximation Algorithms'),
('IDX002', 'TH002', 'Sustainable, Urban Architecture, India'),
('IDX003', 'TH003', 'Deep Learning, Medical Imaging, Approximation Algorithms'),
('IDX004', 'TH004', 'Control Systems, Robotics, Automation'),
('IDX005', 'TH005', 'VLSI, Low Power, Electronics, Approximation Algorithms'),
('IDX006', 'TH006', 'Finite Element, Structural Engineering, Civil'),
('IDX007', 'TH007', 'Smart Grid, Renewable Energy, Electrical'),
('IDX008', 'TH008', 'Autonomous Vehicles, Navigation, Mechanical'),
('IDX009', 'TH009', 'Neural Networks, NLP, AI'),
('IDX010', 'TH010', 'Blockchain, Supply Chain, Computer Science'),
('IDX011', 'TH011', 'Sustainable Construction, Civil, India'),
('IDX012', 'TH012', 'Energy Efficient, Mechatronics, Mechanical'),
('IDX013', 'TH013', 'AI, Healthcare, Predictive Models'),
('IDX014', 'TH014', 'IoT, Smart Home, Electronics'),
('IDX015', 'TH015', 'Earthquake-Resistant, Design, Architecture');



--1
SELECT DISTINCT g.*
FROM Guide g
JOIN Submission s ON g.emp_id = s.emp_id
JOIN Thesis t ON s.thesis_id = t.thesis_id
JOIN Indices i ON t.thesis_id = i.thesis_id
WHERE i.keywords LIKE '%Approximation Algorithms%';

--2.1
SELECT g.*, COUNT(s.thesis_id) AS thesis_count
FROM Guide g
JOIN Submission s ON g.emp_id = s.emp_id
GROUP BY g.emp_id
ORDER BY thesis_count DESC
LIMIT 1;

--2.2
SELECT g.*, COUNT(s.thesis_id) AS thesis_count
FROM Guide g
JOIN Submission s ON g.emp_id = s.emp_id
GROUP BY g.emp_id
ORDER BY thesis_count ASC
LIMIT 1;

--3
SELECT s.roll_no, st.s_name, t.thesis_area, COUNT(DISTINCT sub.emp_id) AS guide_count
FROM Student st
JOIN Submission s ON st.roll_no = s.roll_no
JOIN Thesis t ON s.thesis_id = t.thesis_id
JOIN Submission sub ON sub.roll_no = s.roll_no
GROUP BY s.roll_no, st.s_name, t.thesis_area
HAVING COUNT(DISTINCT sub.emp_id) > 1;

--4
SELECT g.emp_id, g.g_name, COUNT(DISTINCT t.thesis_area) AS area_count
FROM Guide g
JOIN Submission s ON g.emp_id = s.emp_id
JOIN Thesis t ON s.thesis_id = t.thesis_id
GROUP BY g.emp_id, g.g_name
HAVING COUNT(DISTINCT t.thesis_area) > 1;

--5
SELECT i.keywords, COUNT(t.thesis_id) AS thesis_count
FROM Indices i
JOIN Thesis t ON i.thesis_id = t.thesis_id
GROUP BY i.keywords;

--6
SELECT g.*
FROM Guide g
WHERE NOT EXISTS (
    SELECT 1
    FROM Submission s
    WHERE g.emp_id = s.emp_id
    AND s.sub_date BETWEEN 'start_date' AND 'end_date'
);

--7.1
SELECT t.thesis_area, COUNT(t.thesis_id) AS thesis_count
FROM Thesis t
GROUP BY t.thesis_area
ORDER BY thesis_count DESC
LIMIT 1;

--7.2
SELECT t.thesis_area, COUNT(t.thesis_id) AS thesis_count
FROM Thesis t
GROUP BY t.thesis_area
ORDER BY thesis_count ASC
LIMIT 1;

--8
SELECT g.*, t.thesis_area
FROM Guide g
JOIN Submission s ON g.emp_id = s.emp_id
JOIN Thesis t ON s.thesis_id = t.thesis_id
GROUP BY g.emp_id, t.thesis_area
HAVING COUNT(DISTINCT t.thesis_area) = 1;

--9
SELECT s.roll_no, st.s_name
FROM Student st
JOIN Submission s ON st.roll_no = s.roll_no
JOIN Thesis t ON s.thesis_id = t.thesis_id
JOIN Indices i ON t.thesis_id = i.thesis_id
GROUP BY s.roll_no, st.s_name
HAVING COUNT(DISTINCT i.keywords) = COUNT(s.thesis_id);


DROP DATABASE Thesis;
