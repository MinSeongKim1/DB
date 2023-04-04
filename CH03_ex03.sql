/*박지성이 구매한 도서의 출판사 수*/
SELECT COUNT(publisher)
FROM Book,Customer,Orders
WHERE Book.bookid=Orders.bookid AND Customer.custid=Orders.custid AND Customer.name LIKE '박지성';

/* 박지성이 구매한 도서의 이름,가격,정가와,판매가격의 차이 */
SELECT bookname, price, price-saleprice
FROM Book,Orders,Customer
WHERE Orders.bookid=Book.bookid AND Orders.custid=Customer.custid AND customer.name LIKE '박지성';
/* 박지성이 구매하지 않은 도서의 이름 */
SELECT bookname
FROM Book
WHERE NOT EXISTS (SELECT bookname
				FROM Orders, Customer
				WHERE Orders.custid=customer.custid
				AND Book.bookid = Orders.bookid
				AND Customer.name LIKE '박지성');
/* 주문하지 않은 고객의 이름(부속질의 사용)*/
SELECT  name
FROM customer
WHERE name NOT IN(
    SELECT customer.name
    FROM customer,orders
    WHERE orders.custid=customer.custid); 
/* 주문 금액의 총액과 주문의 평균 금액*/
SELECT SUM(price) AS 주문총액, AVG(Price) AS 주문평균
FROM Orders, Book
WHERE Book.bookid = Orders.bookid;
SELECT SUM(Orders.saleprice) AS 총액, AVG(Orders.saleprice) AS 평균
FROM Orders;

/*고객의 이름과 고객별 구매액 */
SELECT Customer.name , SUM(Orders.saleprice)
FROM Orders, Customer
WHERE Orders.custid=Customer.custid
GROUP BY customer.name
Order BY name;

/*고객의 이름과 고객이 구매한 도서 목록 */
SELECT Customer.name, Book.bookname
FROM Orders, Customer, Book
WHERE Orders.custid=Customer.custid AND Book.bookid=Orders.bookid
GROUP BY Customer.name, Book.bookname
ORDER BY name;

/* 도서의 가격(Book 테이블)과 판매가격(Orders 테이블) 차이가 가장 많은 주문*/
SELECT *
FROM Book, Orders
Where Book.bookid=Orders.bookid 
    AND Book.price-Orders.saleprice = (
        SELECT MAX(Book.price-Orders.saleprice)
        FROM Book, Orders
        WHERE Book.bookid=Orders.bookid
        );
/*도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름*/
SELECT name
FROM Customer, Orders
WHERE Customer.custid=Orders.custid
GROUP BY name
HAVING AVG(saleprice) > (SELECT AVG(Orders.saleprice)
FROM Orders);