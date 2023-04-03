/*���缭���� ��ڿ� �濵�ڰ� �䱸�ϴ� ���� ������ ���� SQL ���� �ۼ��Ͻÿ�./*
/*(1) ���缭�� ������ �Ѽ�*/
SELECT COUNT(*) 
FROM Book;
/*(2) ���缭���� ������ ����ϴ� ���ǻ��� �Ѽ�*/
SELECT COUNT(DISTINCT publisher)
FROM Book;
/*(3) ��� ���� �̸�,�ּ�*/
SELECT name, address
FROM customer;
/*(4)2020�� 7�� 4��~7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ*/
SELECT orderid
FROM Orders
WHERE orderdate BETWEEN '2020-07-04' and '2020-07-07';
/*(5)2020�� 7�� 4��~ 7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ*/
SELECT orderid 
FROM Orders
WHERE orderdate NOT BETWEEN '2020-07-04' and '2020-07-07';
/*(6)���� '��' ���� ���� �̸��� �ּ�*/
SELECT name, address
FROM customer
WHERE name LIKE '��%';
/*(7)���� '��' ���̰� �̸���'��'�� ������ ���� �̸��� �ּ�*/
SELECT name, address
FROM customer
WHERE name Like '��%��';