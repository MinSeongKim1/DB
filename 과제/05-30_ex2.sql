/* �� ���� ��� �ֹ��ݾ׺��� ū �ݾ��� �ֹ� ������ ���ؼ� �ֹ���ȣ,����ȣ,�ݾ��� ���̽ÿ�.*/
select orderid,custid,saleprice
from orders md
where saleprice > (select avg(saleprice)
                  from orders so
                  where md.custid=so.custid);
select avg(saleprice)
from orders
where custid=1;

/* IN NOT IN '���ѹα�'�� �����ϴ� ������ �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�.*/
select sum(saleprice) "total"
from orders
where custid IN (select custid
                from customer
                where address LIKE '%���ѹα�%');

/* 3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ���̽ÿ�.*/
select orderid, saleprice
from orders
where saleprice > all (select saleprice
                        from orders
                        where custid='3');
                        
/* exists �����ڸ� ����Ͽ� '���ѹα�'�� �����ϴ� ������ �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�.*/
select sum(saleprice) "total"
from orders od
where exists(select *
             from customer cs
             where address LIKE '%���ѹα�%' AND cs.custid=od.
custid);