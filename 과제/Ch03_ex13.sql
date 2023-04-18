/* 13 �� */

/* Employee table ���� */
CREATE TABLE Employee (
    empno INT NOT NULL PRIMARY KEY,
    name VARCHAR(20),
    phoneno INT,
    address VARCHAR(20),
    sex VARCHAR(20),
    position VARCHAR(20),
    deptno INT,
    FOREIGN KEY(deptno) REFERENCES Department(deptno) 
);


/* department table ���� */

CREATE TABLE Department (
    deptno INT NOT NULL PRIMARY KEY,
    deptname VARCHAR(20),
    manager VARCHAR(20)
)
DROP TABLE Department;
/* project table ���� */
CREATE TABLE Project (
  projno INT NOT NULL PRIMARY KEY,
  projname VARCHAR2(20),
  deptno INT,
  FOREIGN KEY(deptno) REFERENCES department(deptno)
);

/*works table ���� */
CREATE TABLE Works (
  projno INT NOT NULL,
  empno INT NOT NULL,
  hoursworked INTEGER,
  PRIMARY KEY (projno, empno),
  FOREIGN KEY (projno) REFERENCES Project(projno),
  FOREIGN KEY (empno) REFERENCES Employee(empno)
);

/* department table ������ */
INSERT INTO Department (deptno, deptname, manager)
VALUES (1, 'IT', '����');
INSERT INTO Department (deptno, deptname, manager)
VALUES (2, 'Marketing', 'ȫ�浿');

/* Employee table ������ */
INSERT INTO Employee (empno, name, phoneno, address, sex, position, deptno)
VALUES (1, '�����', '01012341232', '����', '��', 'Programmer', 1);

INSERT INTO Employee (empno, name, phoneno, address, sex, position, deptno)
VALUES (2, '�̼���', '01012323122', '����', '��', 'Programmer', 1);

INSERT INTO Employee (empno, name, phoneno, address, sex, position, deptno)
VALUES (3, '�ڿ���', '01076851231', '����', '��', 'Salesperson', 2);

INSERT INTO Employee (empno, name, phoneno, address, sex, position, deptno)
VALUES (4, 'ȫ�浿', '01012341546', '����', '��', 'Manager', 2);

INSERT INTO Employee (empno, name, phoneno, address, sex, position, deptno)
VALUES (5, '����', '01012311112', '����', '��', 'Manager', 1);

/* project ���̺� ������ */
INSERT INTO Project (projno, projname, deptno)
VALUES (1, '�����ͺ��̽�', 1);
INSERT INTO Project (projno, projname, deptno)
VALUES (2, '��������', 2);

/* Works ���̺� ������*/
INSERT INTO Works (projno, empno, hoursworked)
VALUES (1, 1, 3);

INSERT INTO Works (projno, empno, hoursworked)
VALUES (1, 2, 1);

INSERT INTO Works (projno, empno, hoursworked)
VALUES (2, 3, 1);

INSERT INTO Works (projno, empno, hoursworked)
VALUES (2, 4, 5);

INSERT INTO Works (projno, empno, hoursworked)
VALUES (1, 5, 1);
