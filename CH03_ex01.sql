/*������ȣ�� 1�� ������ �̸�*/
SELECT bookname 
FROM Book 
WHERE bookid='1';

/* ������ 20,000�� �̻��� ������ �̸� */
SELECT bookname 
FROM Book
WHERE price >=20000;

/* �������� �� ���ž�*/
SELECT sum(saleprice)
FROM Orders
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
SELECT COUNT(publisher)
FROM Book,Customer,Orders
WHERE Book.bookid=Orders.bookid AND Customer.custid=Orders.custid AND Customer.name LIKE '������';
