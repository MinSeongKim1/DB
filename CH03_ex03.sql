/*�������� ������ ������ ���ǻ� ��*/
SELECT COUNT(publisher)
FROM Book,Customer,Orders
WHERE Book.bookid=Orders.bookid AND Customer.custid=Orders.custid AND Customer.name LIKE '������';

/* �������� ������ ������ �̸�,����,������,�ǸŰ����� ���� */
SELECT bookname, price, price-saleprice
FROM Book,Orders,Customer
WHERE Orders.bookid=Book.bookid AND Orders.custid=Customer.custid AND customer.name LIKE '������';
/* �������� �������� ���� ������ �̸� */
SELECT bookname
FROM Book
WHERE NOT EXISTS (SELECT bookname
				FROM Orders, Customer
				WHERE Orders.custid=customer.custid
				AND Book.bookid = Orders.bookid
				AND Customer.name LIKE '������');
/* �ֹ����� ���� ���� �̸�(�μ����� ���)*/
SELECT  name
FROM customer
WHERE name NOT IN(
    SELECT customer.name
    FROM customer,orders
    WHERE orders.custid=customer.custid); 
/* �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�*/
SELECT SUM(price) AS �ֹ��Ѿ�, AVG(Price) AS �ֹ����
FROM Orders, Book
WHERE Book.bookid = Orders.bookid;
SELECT SUM(Orders.saleprice) AS �Ѿ�, AVG(Orders.saleprice) AS ���
FROM Orders;

/*���� �̸��� ���� ���ž� */
SELECT Customer.name , SUM(Orders.saleprice)
FROM Orders, Customer
WHERE Orders.custid=Customer.custid
GROUP BY customer.name
Order BY name;

/*���� �̸��� ���� ������ ���� ��� */
SELECT Customer.name, Book.bookname
FROM Orders, Customer, Book
WHERE Orders.custid=Customer.custid AND Book.bookid=Orders.bookid
GROUP BY Customer.name, Book.bookname
ORDER BY name;

/* ������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�) ���̰� ���� ���� �ֹ�*/
SELECT *
FROM Book, Orders
Where Book.bookid=Orders.bookid 
    AND Book.price-Orders.saleprice = (
        SELECT MAX(Book.price-Orders.saleprice)
        FROM Book, Orders
        WHERE Book.bookid=Orders.bookid
        );
/*������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�*/
SELECT name
FROM Customer, Orders
WHERE Customer.custid=Orders.custid
GROUP BY name
HAVING AVG(saleprice) > (SELECT AVG(Orders.saleprice)
FROM Orders);