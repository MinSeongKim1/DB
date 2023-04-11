/* ���� ���ǿ� ���� DDL ���� DML ���� �ۼ��Ͻÿ�. */

/*(1) ���ο� ����('������ ����', '���ѹ̵��',10000��)�� ���缭���� �԰�Ǿ���.
������ �� �� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ��ÿ�.*/
INSERT INTO Book(bookid, bookname, publisher, price)
    VALUES(11,'������ ����','���ѹ̵��', 10000);

/*(2)'�Ｚ��'���� ������ ������ �����Ͻÿ�.*/
DELETE FROM Book
WHERE publisher='�Ｚ��';

/*(3)'�̻�̵��'���� ������ ������ �����Ͻÿ�. ������ �� �Ǹ� ������ ������ ���ÿ�.->�ܷ�Ű��������*/
DELETE FROM Book
WHERE publisher='�̻�̵��';

/*(4) ���ǻ�'���ѹ̵��'��'�������ǻ�'�� �̸��� �ٲٽÿ�.*/
UPDATE Book
SET publisher='�������ǻ�'
WHERE publisher='���ѹ̵��';

/*(5) (���̺� ����) ���ǻ翡 ���� ������ �����ϴ� ���̺� Bookcompany(name, address,
begin)�� �����ϰ��� �Ѵ�. name�� �⺻Ű�̸� VARCHAR(20), address�� VARCHAR(20),
begin�� DATE Ÿ������ �����Ͽ� �����Ͻÿ�.*/
CREATE TABLE Bookcompany(
name    VARCHAR2(20) PRIMARY KEY,
address VARCHAR2(20),
begin DATE);

SELECT * FROM Bookcompany;
/*(6) (���̺� ����) Bookcompany ���̺� ���ͳ� �ּҸ� �����ϴ� webaddress �Ӽ���
VARCHAR(30)���� �߰��Ͻÿ�.*/
ALTER TABLE Bookcompany ADD webaddress VARCHAR2(30);

/*(7) Bookcompany ���̺� ������ ���� name=�Ѻ���ī����, address=����� ������,
begin=1993-01-01,webaddress=http://hanbit.co.kr�� �����Ͻÿ�.*/
INSERT INTO Bookcompany(name,address,begin,webaddress)
    VALUES('�Ѻ���ī����','����� ������','1993-01-01','http://hanbit.co.kr');
