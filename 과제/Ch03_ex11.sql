/* [���� �����ͺ��̽�] */
/* ����*/

CREATE TABLE Theater(
    theaterNum NUMBER PRIMARY KEY,
    theaterName VARCHAR2(20),
    theaterLocation  VARCHAR2(20)
)
INSERT INTO Theater(theaterNum,theaterName,theaterLocation) 
VALUES(1,'�Ե�','���');
INSERT INTO Theater(theaterNum,theaterName,theaterLocation) 
VALUES(2,'�ް�','����');
INSERT INTO Theater(theaterNum,theaterName,theaterLocation) 
VALUES(3,'����','���');


SELECT * FROM Theater;
/*�󿵰�*/
CREATE TABLE Cinema(
    theaterNum NUMBER ,
    cinemaNum NUMBER CHECK(cinemaNum >= 1 AND cinemaNum <= 10),
    movieTitle VARCHAR2(20),
    price NUMBER CHECK(price <=20000),
    seat NUMBER,
    PRIMARY KEY(theaterNum, cinemaNum)
);

INSERT INTO Cinema(theaterNum,cinemaNum,movieTitle,price,seat) 
    VALUES(1,1,'����� ��ȭ',15000,48);
INSERT INTO Cinema(theaterNum,cinemaNum,movieTitle,price,seat) 
    VALUES(3,1,'���� ��ȭ',7500,120);
INSERT INTO Cinema(theaterNum,cinemaNum,movieTitle,price,seat) 
    VALUES(3,2,'��մ� ��ȭ',8000,110);


SELECT * FROM Cinema;
/*��*/
CREATE TABLE Users(
    userNum NUMBER PRIMARY KEY,
    userName VARCHAR2(20),
    userAddress VARCHAR2(20)
)

INSERT INTO Users(UserNum,UserName,UserAddress) 
    VALUES(3,'ȫ�浿','����');
INSERT INTO Users(UserNum,UserName,UserAddress) 
    VALUES(4,'��ö��','���');
INSERT INTO Users(UserNum,UserName,UserAddress) 
    VALUES(9,'�ڿ���','����');


SELECT * FROM Users;
/*����*/
CREATE TABLE Reservation (
    theaterNum NUMBER NOT NULL,
    cinemaNum NUMBER NOT NULL,
    userNum NUMBER NOT NULL,
    seatNum NUMBER,
    movieDate DATE,
    PRIMARY KEY(TheaterNum, CinemaNum, UserNum),
    FOREIGN KEY(TheaterNum, CinemaNum) REFERENCES Cinema(TheaterNum, CInemaNum)
);

INSERT INTO Reservation (TheaterNum, CinemaNum, UserNum, SeatNum, MovieDate)
VALUES(3,2,3,15,'2020-09-01');
INSERT INTO Reservation (TheaterNum, CinemaNum, UserNum, SeatNum, MovieDate)
VALUES(3,1,4,16,'2020-09-01');
INSERT INTO Reservation (TheaterNum, CinemaNum, UserNum, SeatNum, MovieDate)
VALUES(1,1,9,48,'2020-09-01');

SELECT * FROM Reservation;
/* (1) �ܼ����� *
/*  1. ��� ������ �̸��� ��ġ�� ���̽ÿ�. */
SELECT theaterName, theaterLocation
FROM Theater;

/* 2. '���'�� �ִ� ������ ���̽ÿ�. */
SELECT theaterName
FROM theater
WHERE theaterLocation = '���';

/* 3. '���'�� ��� ���� �̸��� ������������ ���̽ÿ�. */
SELECT userName
FROM Users
WHERE userAddress ='���'
ORDER BY userName;

/* 4. ������ 8,000�� ������ ��ȭ�� �����ȣ, �󿵰���ȣ, ��ȭ������ ���̽ÿ�. */
SELECT theaterNum, cinemaNum, movieTitle
FROM cinema
WHERE price <= 8000;

/* 5. ���� ��ġ�� ���� �ּҰ� ���� ���� ���̽ÿ�. */
SELECT DISTINCT Theater.theaterLocation AS ������ġ,
Users.userAddress AS ���ּ�,userName AS ��
FROM Theater, Users
WHERE Theater.theaterLocation = users.userAddress;

/* (2) ���� ���� */
/* 1. ������ ���� �� ���ΰ�? */
SELECT COUNT(*) 
FROM Theater;

/* 2. �󿵵Ǵ� ��ȭ�� ��� ������ ���ΰ�?*/
SELECT TRUNC(AVG(price))
FROM Cinema;
/* 3. 2020�� 9�� 1�Ͽ� ��ȭ�� ������ ���� ���� ���ΰ�?*/
SELECT COUNT(userNum)
FROM Reservation
WHERE movieDate = '2020-09-01';
/* (3) �μ����ǿ� ����
/* 1. '����'���忡�� �󿵵� ��ȭ������ ���̽ÿ�.*/
SELECT movieTitle
FROM Theater, Cinema
WHERE Theater.theaterNum = Cinema.theaterNum
AND theaterName ='����';
/* 2. '����'���忡�� ��ȭ�� �� ���� �̸��� ���̽ÿ�. */
SELECT userName
FROM Theater, Users, Reservation
WHERE Theater.theaterNum = Reservation.theaterNum
AND Users.userNum = Reservation.userNum
AND theaterName ='����';
/* 3. '����'������ ��ü ������ ���̽ÿ�. */
SELECT SUM(price)
FROM Theater, Cinema
WHERE Theater.theaterNum = Cinema.theaterNum
AND theaterName='����';
/* (4) �׷�����*/

/* 1. ���庰 �󿵰� ���� ���̽ÿ�.*/
SELECT Theater.theaterName AS �����̸�, COUNT(cinemaNum) AS �󿵰���
FROM Theater, Cinema
WHERE Theater.theaterNum = Cinema.theaterNum
GROUP BY theaterName;
/* 2. '���'�� �ִ� ������ �󿵰��� ���̽ÿ�.*/
SELECT DISTINCT theaterName, cinemaNum
FROM Theater, Cinema
WHERE Theater.theaterNum = Cinema.theaterNum
AND theaterLocation ='���';
/* 3. 2020�� 9�� 1���� ���庰 ��� ���� �� ���� ���̽ÿ�.*/
SELECT Theater.theaterName, COUNT(*)
FROM Theater, Reservation
WHERE Theater.theaterNum = Reservation.theaterNum
AND movieDate='2020-09-01'
GROUP BY Reservation.theaterNum, Theater.theaterName;
/* 4. 2020�� 9�� 1�Ͽ� ���� ���� ���� ������ ��ȭ�� ���̽ÿ�. ���� 1�� */
SELECT movieTitle, COUNT(userNum)
FROM Cinema, Reservation
WHERE Cinema.theaterNum = Reservation.theaterNum
AND Cinema.cinemaNum = Reservation.CinemaNum
AND movieDate='2020-09-01'
GROUP BY movieTitle;

/* (5) DML */
/* 1. �� ���̺� �����͸� �����ϴ� INSERT ���� �ϳ��� ������� ���ÿ�. */
INSERT INTO Theater(theaterNum, theaterName, theaterLocation)
    VALUES(4,'��������','���');
INSERT INTO Cinema(theaterNum,cinemaNum,movieTitle,price,seat)
    VALUES(4, 3, '������ ��ȭ', 13000, 99);
INSERT INTO Users(UserNum,UserName,UserAddress)
    VALUES(5, '��μ�', '���');
INSERT INTO Reservation(TheaterNum, CinemaNum, UserNum, SeatNum, MovieDate)
    VALUES(2, 3, 5, 30,'2020-09-02');
/* 2. ��ȭ�� ������ 10%�� �λ��Ͻÿ�. */
UPDATE Cinema
SET price= price*1.1;


