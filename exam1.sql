CREATE DATABASE Library;
USE Library;

CREATE TABLE Members(
        Member_Name varchar(20),
        Member_Id bigint primary key,
        Member_Type varchar(10),
        Mobile_Number bigint UNIQUE,
        Email_Id varchar(30) UNIQUE,
        CONSTRAINT Check_Member_Type CHECK(Member_Type IN('Faculty', 'Student')),
        CONSTRAINT Check_Mobile_Number CHECK(Mobile_Number >= '0000000000' AND Mobile_Number <= '9999999999')
);

CREATE TABLE Books(
        Book_Title varchar(50),
        Acc_Number varchar(10) primary key,
        Author varchar(20),
        Publisher varchar(20),
        Edition int
);

CREATE TABLE Issue(
        Member_Id bigint,
        Acc_Number varchar(10),
        Issue_Date date,
        Due_Date date,
        Return_Date date,
        foreign key(Member_Id) REFERENCES Members(Member_Id) ON DELETE CASCADE ON UPDATE CASCADE,
        foreign key(Acc_Number) REFERENCES Books(Acc_Number) ON DELETE CASCADE ON UPDATE CASCADE,
        primary key(Member_Id, Acc_Number, Issue_Date)
);


INSERT INTO Members VALUES('Adil',12345,'Student',9745215821,'itzmeadilerm@gmail.com');
INSERT INTO Members VALUES('Shuhaibh',12445,'Student',9943890198,'shuhaibh17@gmail.com');
INSERT INTO Members VALUES('Anil Kumar',13345,'Faculty',9656485901,'anilgecp@gmail.com');
INSERT INTO Members VALUES('Alfred Thomas',14345,'Faculty',7592010725,'alfredrit@gmail.com');
INSERT INTO Members VALUES('Nadha',12545,'Student',8943792922,'nadhakm@gmail.com');


INSERT INTO Books VALUES('Aadu Jeevitham','AJ14442','Benyamin','DC Books',1);
INSERT INTO Books VALUES('Dbms','DB23502','Anil Kumar','Prime Books',1);
INSERT INTO Books VALUES('C Programming','CP89034','Sreelal','A1 Books',2);
INSERT INTO Books VALUES('Data Structures','DS37905','Shibhu Kumar','Owl Books',3);
INSERT INTO Books VALUES('Java','OJ95279','Aanand Matew','JC Books',2);


INSERT INTO Issue VALUES(12345,'AJ14442','2024-10-15','2024-10-30','2024-10-28');
INSERT INTO Issue VALUES(12545,'CP89034','2024-08-05','2024-08-20','2024-10-22');
INSERT INTO Issue VALUES(13345,'DB23502','2024-05-20','2024-06-05','2024-06-01');
INSERT INTO Issue VALUES(14345,'CP89034','2024-02-23','2024-03-08','2024-03-15');
INSERT INTO Issue VALUES(12445,'DS37905','2024-07-07','2024-07-22',NULL);



SELECT M.* FROM Members M
JOIN Issue I ON M.Member_Id = I.Member_Id
WHERE I.Return_Date is NULL;


SELECT B.*
FROM Books B
LEFT JOIN Issue I ON B.Acc_Number = I.Acc_Number
WHERE I.Acc_Number IS NULL;


SELECT B.*
FROM Books B
JOIN Issue I ON B.Acc_Number = I.Acc_Number
GROUP BY B.Acc_Number, B.Book_Title, B.Author, B.Publisher, B.Edition
HAVING COUNT(DISTINCT I.Member_Id) >= 2;
