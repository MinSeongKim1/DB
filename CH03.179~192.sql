/* NewBook TABLE ���� */
CREATE TABLE NewBook (
bookid NUMBER   PRIMARY KEY,
bookname VARCHAR2(20) NOT NULL,
publisher VARCHAR2(20) UNIQUE,
price NUMBER DEFAULT 10000 CHECK(price > 1000));
 
 
 /* NewCustomer TABLE ���� */
 CREATE TABLE NewCustomer(
 custid NUMBER PRIMARY KEY,
 name VARCHAR2(20),
 address VARCHAR(20),
 phone VARCHAR(30));
 
/* NewOrders TABLE ���� */
CREATE TABLE NewOrders(
orderid NUMBER,
custid NUMBER NOT NULL,
bookid NUMBER NOT NULL,
saleprice NUMBER,
orderdate DATE,
PRIMARY KEY(orderid),
FOREIGN KEY(custid)REFERENCES NewCustomer(custid) ON DELETE CASCADE);

/*�Ӽ��߰� */
ALTER TABLE NewBook ADD isbn VARCHAR2(13);

/* ������ Ÿ�� ����*/
ALTER TABLE NewBook MODIFY isbn NUMBER;

/* TABLE ���� */
DROP TABLE NewBook;

SELECT * FROM Book;

/* ���� �߰� */
INSERT INTO Book(bookid, bookname, publisher, price)
    VALUES(11, '������ ����', '�Ѽ����м���', 90000);
    
INSERT INTO Book(bookid,bookname,publisher)
    VALUES(14,'������ ����','�Ѽ����м���');
    
SELECT * FROM Imported_book;

/* �뷮 ���� bulk */
INSERT INTO Book(bookid, bookname, price, publisher)
    SELECT bookid, bookname, price, publisher
    FROM Imported_book;

/* �Ӽ� ���� UPDATE*/
SELECT * FROM Customer;

UPDATE Customer
SET address='���ѹα� �λ�'
WHERE custid=5;

UPDATE Customer
SET address=(SELECT address
            FROM    Customer
            WHERE   name='�迬��')
WHERE   name='�ڼ���';

/*  ���� ���� DELETE */
DELETE FROM Customer
WHERE custid=5;

SELECT * FROM Customer;

/* �ѹ� */
ROLLBACK;
SELECT * FROM Customer;