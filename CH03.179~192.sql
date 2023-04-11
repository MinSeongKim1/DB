/* NewBook TABLE 생성 */
CREATE TABLE NewBook (
bookid NUMBER   PRIMARY KEY,
bookname VARCHAR2(20) NOT NULL,
publisher VARCHAR2(20) UNIQUE,
price NUMBER DEFAULT 10000 CHECK(price > 1000));
 
 
 /* NewCustomer TABLE 생성 */
 CREATE TABLE NewCustomer(
 custid NUMBER PRIMARY KEY,
 name VARCHAR2(20),
 address VARCHAR(20),
 phone VARCHAR(30));
 
/* NewOrders TABLE 생성 */
CREATE TABLE NewOrders(
orderid NUMBER,
custid NUMBER NOT NULL,
bookid NUMBER NOT NULL,
saleprice NUMBER,
orderdate DATE,
PRIMARY KEY(orderid),
FOREIGN KEY(custid)REFERENCES NewCustomer(custid) ON DELETE CASCADE);

/*속성추가 */
ALTER TABLE NewBook ADD isbn VARCHAR2(13);

/* 데이터 타입 변경*/
ALTER TABLE NewBook MODIFY isbn NUMBER;

/* TABLE 삭제 */
DROP TABLE NewBook;

SELECT * FROM Book;

/* 투플 추가 */
INSERT INTO Book(bookid, bookname, publisher, price)
    VALUES(11, '스포츠 의학', '한솔의학서적', 90000);
    
INSERT INTO Book(bookid,bookname,publisher)
    VALUES(14,'스포츠 의학','한솔의학서적');
    
SELECT * FROM Imported_book;

/* 대량 삽입 bulk */
INSERT INTO Book(bookid, bookname, price, publisher)
    SELECT bookid, bookname, price, publisher
    FROM Imported_book;

/* 속성 수정 UPDATE*/
SELECT * FROM Customer;

UPDATE Customer
SET address='대한민국 부산'
WHERE custid=5;

UPDATE Customer
SET address=(SELECT address
            FROM    Customer
            WHERE   name='김연아')
WHERE   name='박세리';

/*  투플 삭제 DELETE */
DELETE FROM Customer
WHERE custid=5;

SELECT * FROM Customer;

/* 롤백 */
ROLLBACK;
SELECT * FROM Customer;