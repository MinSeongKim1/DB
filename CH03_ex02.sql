/*마당서점의 운영자와 경영자가 요구하는 다음 질문에 대해 SQL 문을 작성하시오./*
/*(1) 마당서점 도서의 총수*/
SELECT COUNT(*) 
FROM Book;
/*(2) 마당서점에 도서를 출고하는 출판사의 총수*/
SELECT COUNT(DISTINCT publisher)
FROM Book;
/*(3) 모든 고객의 이름,주소*/
SELECT name, address
FROM customer;
/*(4)2020년 7월 4일~7월 7일 사이에 주문받은 도서의 주문번호*/
SELECT orderid
FROM Orders
WHERE orderdate BETWEEN '2020-07-04' and '2020-07-07';
/*(5)2020년 7월 4일~ 7월 7일 사이에 주문받은 도서를 제외한 도서의 주문번호*/
SELECT orderid 
FROM Orders
WHERE orderdate NOT BETWEEN '2020-07-04' and '2020-07-07';
/*(6)성이 '김' 씨인 고객의 이름과 주소*/
SELECT name, address
FROM customer
WHERE name LIKE '김%';
/*(7)성이 '김' 씨이고 이름이'아'로 끝나는 고객의 이름과 주소*/
SELECT name, address
FROM customer
WHERE name Like '김%아';

/* 주문하지 않은 고객의 이름(부속질의 사용)*/
SELECT  name
FROM customer
WHERE name NOT IN(
    SELECT customer.name
    FROM customer,orders
    WHERE orders.custid=customer.custid); 
/* 주문 금액의 총액과 주문의 평균 금액*/
SELECT SUM(saleprice) AS 주문총액, AVG(saleprice) AS 주문평균
FROM Orders, Book
WHERE Book.bookid = Orders.bookid;
SELECT SUM(Orders.saleprice) AS 총액, AVG(Orders.saleprice) AS 평균
FROM Orders;

/*고객의 이름과 고객별 구매액 */
SELECT Customer.name AS 이름 , SUM(Orders.saleprice) AS 고객별구매액
FROM Orders, Customer
WHERE Orders.custid=Customer.custid
GROUP BY name;
/*Order BY name;*/

/*고객의 이름과 고객이 구매한 도서 목록 */
SELECT name, bookname
FROM Orders, Customer, Book
WHERE Orders.custid=Customer.custid AND Book.bookid=Orders.bookid;


/* 도서의 가격(Book 테이블)과 판매가격(Orders 테이블) 차이가 가장 많은 주문*/
SELECT *
FROM Book, Orders
Where Book.bookid=Orders.bookid 
    AND price-saleprice = (
        SELECT MAX(price-saleprice)
        FROM Book, Orders
        WHERE Book.bookid=Orders.bookid
        );
/*(2)최소*/
SELECT *
FROM Book, Orders
Where Book.bookid=Orders.bookid 
    AND price-saleprice = (
        SELECT MIN(price-saleprice)
        FROM Book, Orders
        WHERE Book.bookid=Orders.bookid
        );
/*도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름*/
SELECT name, AVG(saleprice)
FROM Customer, Orders
WHERE Customer.custid=Orders.custid
GROUP BY name
HAVING AVG(saleprice) > (SELECT AVG(saleprice)
FROM Orders);
