/*������ȣ�� 1�� ������ �̸�*/
SELECT bookname 
FROM book 
WHERE bookid='1';

/* ������ 20,000�� �̻��� ������ �̸� */
SELECT bookname 
FROM book
WHERE price >=20000;

/* �������� �� ���ž�*/
SELECT sum(saleprice)
FROM orders
WHERE custid='1';

/* �������� �� ���ž�2*/
SELECT sum(saleprice)
FROM Customer, Orders
WHERE Customer.custid=orders.custid AND Customer.name LIKE '������';

/* �������� ������ ������ ��*/
SELECT COUNT(*)
FROM Customer, Orders
WHERE Customer.custid=Orders.custid AND Customer.name LIKE '������';

/*�������� ������ ������ ���ǻ� ��*/
SELECT COUNT(*)
FROM Book,Customer,Orders
WHERE Book.bookid=Orders.bookid AND Customer.custid =Orders.custid AND Customer.name LIKE '������';
