/* [극장 데이터베이스] */
/* 극장*/

CREATE TABLE Theater(
    theaterNum NUMBER PRIMARY KEY,
    theaterName VARCHAR2(20),
    theaterLocation  VARCHAR2(20)
)
INSERT INTO Theater(theaterNum,theaterName,theaterLocation) 
VALUES(1,'롯데','잠실');
INSERT INTO Theater(theaterNum,theaterName,theaterLocation) 
VALUES(2,'메가','강남');
INSERT INTO Theater(theaterNum,theaterName,theaterLocation) 
VALUES(3,'대한','잠실');


SELECT * FROM Theater;
/*상영관*/
CREATE TABLE Cinema(
    theaterNum NUMBER ,
    cinemaNum NUMBER CHECK(cinemaNum >= 1 AND cinemaNum <= 10),
    movieTitle VARCHAR2(20),
    price NUMBER CHECK(price <=20000),
    seat NUMBER,
    PRIMARY KEY(theaterNum, cinemaNum)
);

INSERT INTO Cinema(theaterNum,cinemaNum,movieTitle,price,seat) 
    VALUES(1,1,'어려운 영화',15000,48);
INSERT INTO Cinema(theaterNum,cinemaNum,movieTitle,price,seat) 
    VALUES(3,1,'멋진 영화',7500,120);
INSERT INTO Cinema(theaterNum,cinemaNum,movieTitle,price,seat) 
    VALUES(3,2,'재밌는 영화',8000,110);


SELECT * FROM Cinema;
/*고객*/
CREATE TABLE Users(
    userNum NUMBER PRIMARY KEY,
    userName VARCHAR2(20),
    userAddress VARCHAR2(20)
)

INSERT INTO Users(UserNum,UserName,UserAddress) 
    VALUES(3,'홍길동','강남');
INSERT INTO Users(UserNum,UserName,UserAddress) 
    VALUES(4,'김철수','잠실');
INSERT INTO Users(UserNum,UserName,UserAddress) 
    VALUES(9,'박영희','강남');


SELECT * FROM Users;
/*예약*/
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
/* (1) 단순질의 *
/*  1. 모든 극장의 이름과 위치를 보이시오. */
SELECT theaterName, theaterLocation
FROM Theater;

/* 2. '잠실'에 있는 극장을 보이시오. */
SELECT theaterName
FROM theater
WHERE theaterLocation = '잠실';

/* 3. '잠실'에 사는 고객의 이름을 오름차순으로 보이시오. */
SELECT userName
FROM Users
WHERE userAddress ='잠실'
ORDER BY userName;

/* 4. 가격이 8,000원 이하인 영화의 극장번호, 상영관번호, 영화제목을 보이시오. */
SELECT theaterNum, cinemaNum, movieTitle
FROM cinema
WHERE price <= 8000;

/* 5. 극장 위치와 고객의 주소가 같은 고객을 보이시오. */
SELECT DISTINCT Theater.theaterLocation AS 극장위치,
Users.userAddress AS 고객주소,userName AS 고객
FROM Theater, Users
WHERE Theater.theaterLocation = users.userAddress;

/* (2) 집계 질의 */
/* 1. 극장의 수는 몇 개인가? */
SELECT COUNT(*) 
FROM Theater;

/* 2. 상영되는 영화의 평균 가격은 얼마인가?*/
SELECT TRUNC(AVG(price))
FROM Cinema;
/* 3. 2020년 9월 1일에 영화를 관람한 고객의 수는 얼마인가?*/
SELECT COUNT(userNum)
FROM Reservation
WHERE movieDate = '2020-09-01';
/* (3) 부속질의와 조인
/* 1. '대한'극장에서 상영된 영화제목을 보이시오.*/
SELECT movieTitle
FROM Theater, Cinema
WHERE Theater.theaterNum = Cinema.theaterNum
AND theaterName ='대한';
/* 2. '대한'극장에서 영화를 본 고객의 이름을 보이시오. */
SELECT userName
FROM Theater, Users, Reservation
WHERE Theater.theaterNum = Reservation.theaterNum
AND Users.userNum = Reservation.userNum
AND theaterName ='대한';
/* 3. '대한'극장의 전체 수입을 보이시오. */
SELECT SUM(price)
FROM Theater, Cinema
WHERE Theater.theaterNum = Cinema.theaterNum
AND theaterName='대한';
/* (4) 그룹질의*/

/* 1. 극장별 상영관 수를 보이시오.*/
SELECT Theater.theaterName AS 극장이름, COUNT(cinemaNum) AS 상영관수
FROM Theater, Cinema
WHERE Theater.theaterNum = Cinema.theaterNum
GROUP BY theaterName;
/* 2. '잠실'에 있는 극장의 상영관을 보이시오.*/
SELECT DISTINCT theaterName, cinemaNum
FROM Theater, Cinema
WHERE Theater.theaterNum = Cinema.theaterNum
AND theaterLocation ='잠실';
/* 3. 2020년 9월 1일의 극장별 평균 관람 고객 수를 보이시오.*/
SELECT Theater.theaterName, COUNT(*)
FROM Theater, Reservation
WHERE Theater.theaterNum = Reservation.theaterNum
AND movieDate='2020-09-01'
GROUP BY Reservation.theaterNum, Theater.theaterName;
/* 4. 2020년 9월 1일에 가장 많은 고객이 관람한 영화를 보이시오. 전부 1임 */
SELECT movieTitle, COUNT(userNum)
FROM Cinema, Reservation
WHERE Cinema.theaterNum = Reservation.theaterNum
AND Cinema.cinemaNum = Reservation.CinemaNum
AND movieDate='2020-09-01'
GROUP BY movieTitle;

/* (5) DML */
/* 1. 각 테이블에 데이터를 삽입하는 INSERT 문을 하나씩 실행시켜 보시오. */
INSERT INTO Theater(theaterNum, theaterName, theaterLocation)
    VALUES(4,'시지브이','용산');
INSERT INTO Cinema(theaterNum,cinemaNum,movieTitle,price,seat)
    VALUES(4, 3, '무서운 영화', 13000, 99);
INSERT INTO Users(UserNum,UserName,UserAddress)
    VALUES(5, '김민성', '용산');
INSERT INTO Reservation(TheaterNum, CinemaNum, UserNum, SeatNum, MovieDate)
    VALUES(2, 3, 5, 30,'2020-09-02');
/* 2. 영화의 가격을 10%씩 인상하시오. */
UPDATE Cinema
SET price= price*1.1;


