/*�౸�� ���Ե� �ڷḸ �����ִ� ��*/
Create VIEW vw_Book
AS select *
From Book
Where bookname LIKE '%�౸%';

select * from vw_Book;


Select * 
from customer;


/* �ּҰ� ���ѹα��� ����� ������ �� */
Create VIEW vw_Customer
AS Select *
    From Customer
    Where address LIKE '%���ѹα�%';
    
select * from vw_customer;

/* �ּҰ� ������ �縧���� ����*/
Create OR REPLACE VIEW vw_Customer (custid, name, address)
AS Select   custid,name,address
    From Customer
    Where address LIKE '%����%';
    
Select *
from vw_customer;

/* ����*/
Drop View vw_Customer;