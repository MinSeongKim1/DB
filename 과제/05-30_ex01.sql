
/*���缭���� 2020�� 7�� 7�Ͽ� �ֹ����� ������ �ֹ���ȣ,�ֹ���,����ȣ,������ȣ�� ���
���̽ÿ�. �� �ֹ�����'yyyy-mm-dd ����' ���·� ǥ���Ѵ�.*/
select TO_DATE('2020-07-01', 'yyyy-mm-dd')+5 BEFORE,
 to_date('2020-07-01', 'yyyy-mm-dd')-5 AFTER
from dual;

/*���� ��� �ֹ� �ݾ��� �� �� ������ �ݿø��� ���� ���Ͻÿ�*/
select Custid "����ȣ", ROUND(SUM(saleprice) / COUNT(*), -2) "��ձݾ�"
FROM Orders
GROUP BY custid;

Select sysdate,
    to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') "sysdate_1"
    from dual;
/*���缭���� �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�.*/    
SELECT orderid "�ֹ���ȣ", orderdate "�ֹ���", orderdate + 10 "Ȯ��"
FROM Orders;
    
/*���缭���� �� �߿��� ���� ���� ���� ����� �� ���̳� �Ǵ��� ���� �ο����� ���Ͻÿ�*/
select substr(name, 1, 1) "��", count(*) "�ο�"
from customer
group by substr(name, 1, 1);

/* �̸�,��ȭ��ȣ�� ���Ե� ������� ���̽ÿ�. �� ��ȭ��ȣ�� ���� ���� '����ó����'���� ǥ���Ͻÿ�*/
select name"�̸�", NVL(phone,'����ó����')"��ȭ��ȣ"
from customer;
/*����Ͽ��� ����ȣ,�̸�,��ȭ��ȣ�� ���� �� �� ���̽ÿ�.*/
select ROWNUM "����",custid,name,phone
from customer
where ROWNUM<=2;

/*dbms ������ ������ ���� ��¥�� �ð�,������ Ȯ���Ͻÿ�.*/
select sysdate, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') "sysdate_1"
from dual;

/*����3��*/
select * 
from book;

select *
from book
where rownum <=5;

select *
from book
where rownum <=5
order by price;

select *
from (select * from book order by price) b
where rownum <=5;

select *
from (select * from book where rownum <=5)b
order by price;

select * 
from (select * from book where rownum <= 5 order by price)b;