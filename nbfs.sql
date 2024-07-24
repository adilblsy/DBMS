CREATE DATABASE nbfs;
USE nbfs;

CREATE TABLE Customer(Name varchar(20), Aadhar_Number char(12) primary key UNIQUE, Pan_Number char(10) UNIQUE, Mobile_Number char(10) UNIQUE, Adress varchar(50), Email_ID varchar(30) UNIQUE);

CREATE TABLE Chitty(Chitty_Number varchar(10) primary key, Branch_Name varchar(20), Chitty_Amount int, Start_Date date, Installments int, Chitty_Status varchar(5));

CREATE TABLE Loan(Loan_Number varchar(10) primary key, Type varchar(10), Aadhar_Number char(20), Chitty_Number varchar(10), Loan_Amount long int, Loan_Period int, EMI int, check(Type in('Home Loan','Car Loan','Personal Loan', 'Buisness Loan')), foriegn key(Aadhar_Number, Chitty_Number) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Customer_Chitty(Aadhar_Number char(12), Branch_Name varchar(10), Chitty_Number varchar(10), Chittal_Number varchar(10), foriegn key(Chitty_Number) REFERENCES Chitty(Chitty_Number), foriegn key(Aadhar_Number) REFERNCES Customer(Aadhar_Number), primary key(Aadhar_Number,Chitty_Number, Chittal_Number) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE Chitty_Payment(Branch_Name varchar(10), Chitty_Number varchar(10), Chittal_Number varchar(10), Paid_amount long int, Payment_Date date, Payment_Mode varchar(10), Payed_Branch varchar(20), foriegn key(Chitty_Number) REFERENCES Chitty(Chitty_Number), foriegn key(Chittal_Number) REFERNCESCustomer_Chitty(Chittal_Number), primary key(Chitty_Number, Chittal_Number, Payment_date) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE Chitty_Auction(Branch_Name varchar(10), Chitty_Number varchar(10), Chittal_Number varchar(10), Aadhar_Number char(12), Amount_Auctioned long int, foriegn key(Chitty_Number, Branch_name) REFERENCES Chitty(Chitty_Number, Branch_Name), foriegn key(Chittal_Number) REFERENCES Customer_Chitty(Chittal_Number), foriegn key(Aadhar_Number) REFERENCES Customer(Aadhar_Number), primary key(Chitty_Number, Chittal_Number) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE Loan_Payment(Aadhar_Number char(12), Loan_Number varchar(10), Loan_Branch varchar(20), Loan_Amount int, Payment_Date date, Payment_Branch, foriegn key(Aadhar_Number) REFERENCES Customer(Aadhar_Number), foriegn key(Loan_Number) REFERENCES Loan(Loan_Number), primary key(Aadhar_Number, Loan_number, Payment_Date) ON DELETE CASCADE ON UPDATE CASCADE);
