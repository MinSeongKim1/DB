/* 각 고객의 평균 주문금액보다 큰 금애의 주문 내역에 대해서 주문번호,고객번호,금액을 보이시오.*/
select orderid,custid,saleprice
from orders md
where saleprice > (select avg(saleprice)
                  from orders so
                  where md.custid=so.custid);
select avg(saleprice)
from orders
where custid=1;

/* IN NOT IN '대한민국'에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오.*/
select sum(saleprice) "total"
from orders
where custid IN (select custid
                from customer
                where address LIKE '%대한민국%');

/* 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 보이시오.*/
select orderid, saleprice
from orders
where saleprice > all (select saleprice
                        from orders
                        where custid='3');
                        
/* exists 연산자를 사용하여 '대한민국'에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오.*/
select sum(saleprice) "total"
from orders od
where exists(select *
             from customer cs
             where address LIKE '%대한민국%' AND cs.custid=od.
custid);