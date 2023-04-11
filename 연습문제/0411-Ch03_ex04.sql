/* 다음 질의에 대해 DDL 문과 DML 문을 작성하시오. */

/*(1) 새로운 도서('스포츠 세계', '대한미디어',10000원)이 마당서점에 입고되었다.
삽입이 안 될 경우 필요한 데이터가 더 있는지 찾아보시오.*/
INSERT INTO Book(bookid, bookname, publisher, price)
    VALUES(11,'스포츠 세계','대한미디어', 10000);

/*(2)'삼성당'에서 출판한 도서를 삭제하시오.*/
DELETE FROM Book
WHERE publisher='삼성당';

/*(3)'이상미디어'에서 출판한 도서를 삭제하시오. 삭제가 안 되면 원인을 생각해 보시오.->외래키제약조건*/
DELETE FROM Book
WHERE publisher='이상미디어';

/*(4) 출판사'대한미디어'를'대한출판사'로 이름을 바꾸시오.*/
UPDATE Book
SET publisher='대한출판사'
WHERE publisher='대한미디어';

/*(5) (테이블 생성) 출판사에 대한 정보를 저장하는 테이블 Bookcompany(name, address,
begin)를 생성하고자 한다. name은 기본키이며 VARCHAR(20), address는 VARCHAR(20),
begin은 DATE 타입으로 선언하여 생성하시오.*/
CREATE TABLE Bookcompany(
name    VARCHAR2(20) PRIMARY KEY,
address VARCHAR2(20),
begin DATE);

SELECT * FROM Bookcompany;
/*(6) (테이블 수정) Bookcompany 테이블에 인터넷 주소를 저장하는 webaddress 속성을
VARCHAR(30)으로 추가하시오.*/
ALTER TABLE Bookcompany ADD webaddress VARCHAR2(30);

/*(7) Bookcompany 테이블에 임의의 투플 name=한빛아카데미, address=서울시 마포구,
begin=1993-01-01,webaddress=http://hanbit.co.kr을 삽입하시오.*/
INSERT INTO Bookcompany(name,address,begin,webaddress)
    VALUES('한빛아카데미','서울시 마포구','1993-01-01','http://hanbit.co.kr');
