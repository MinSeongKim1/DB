
/*마당서점이 2020년 7월 7일에 주문받은 도서의 주문번호,주문일,고객번호,도서번호를 모두
보이시오. 단 주문일은'yyyy-mm-dd 요일' 형태로 표시한다.*/
select TO_DATE('2020-07-01', 'yyyy-mm-dd')+5 BEFORE,
 to_date('2020-07-01', 'yyyy-mm-dd')-5 AFTER
from dual;

/*고객별 평균 주문 금액을 백 원 단위로 반올림한 값을 구하시오*/
select Custid "고객번호", ROUND(SUM(saleprice) / COUNT(*), -2) "평균금액"
FROM Orders
GROUP BY custid;

Select sysdate,
    to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') "sysdate_1"
    from dual;
/*마당서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오.*/    
SELECT orderid "주문번호", orderdate "주문일", orderdate + 10 "확정"
FROM Orders;
    
/*마당서점의 고객 중에서 같은 성을 가진 사람이 몇 명이나 되는지 성별 인원수를 구하시오*/
select substr(name, 1, 1) "성", count(*) "인원"
from customer
group by substr(name, 1, 1);

/* 이름,전화번호가 포함된 고객목록을 보이시오. 단 전화번호가 없는 고객은 '연락처없음'으로 표시하시오*/
select name"이름", NVL(phone,'연락처없음')"전화번호"
from customer;
/*고객목록에서 고객번호,이름,전화번호를 앞의 두 명만 보이시오.*/
select ROWNUM "순번",custid,name,phone
from customer
where ROWNUM<=2;

/*dbms 서버에 설정된 현재 날짜와 시간,요일을 확인하시오.*/
select sysdate, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') "sysdate_1"
from dual;

/*연습3번*/
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