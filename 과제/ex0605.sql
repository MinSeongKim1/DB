/*축구가 포함된 자료만 보여주는 뷰*/
Create VIEW vw_Book
AS select *
From Book
Where bookname LIKE '%축구%';

select * from vw_Book;


Select * 
from customer;


/* 주소가 대한민국인 고객들로 구성된 뷰 */
Create VIEW vw_Customer
AS Select *
    From Customer
    Where address LIKE '%대한민국%';
    
select * from vw_customer;

/* 주소가 영국인 사름으로 변경*/
Create OR REPLACE VIEW vw_Customer (custid, name, address)
AS Select   custid,name,address
    From Customer
    Where address LIKE '%영국%';
    
Select *
from vw_customer;

/* 삭제*/
Drop View vw_Customer;