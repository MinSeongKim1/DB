/* 13 번 */

/* Employee table 생성 */
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


/* department table 생성 */

CREATE TABLE Department (
    deptno INT NOT NULL PRIMARY KEY,
    deptname VARCHAR(20),
    manager VARCHAR(20)
)
DROP TABLE Department;
/* project table 생성 */
CREATE TABLE Project (
  projno INT NOT NULL PRIMARY KEY,
  projname VARCHAR2(20),
  deptno INT,
  FOREIGN KEY(deptno) REFERENCES department(deptno)
);

/*works table 생성 */
CREATE TABLE Works (
  projno INT NOT NULL,
  empno INT NOT NULL,
  hoursworked INTEGER,
  PRIMARY KEY (projno, empno),
  FOREIGN KEY (projno) REFERENCES Project(projno),
  FOREIGN KEY (empno) REFERENCES Employee(empno)
);

/* department table 데이터 */
INSERT INTO Department (deptno, deptname, manager)
VALUES (1, 'IT', '고남순');
INSERT INTO Department (deptno, deptname, manager)
VALUES (2, 'Marketing', '홍길동');

/* Employee table 데이터 */
INSERT INTO Employee (empno, name, phoneno, address, sex, position, deptno)
VALUES (1, '김덕성', '01012341232', '서울', '여', 'Programmer', 1);

INSERT INTO Employee (empno, name, phoneno, address, sex, position, deptno)
VALUES (2, '이서울', '01012323122', '서울', '남', 'Programmer', 1);

INSERT INTO Employee (empno, name, phoneno, address, sex, position, deptno)
VALUES (3, '박연세', '01076851231', '대전', '여', 'Salesperson', 2);

INSERT INTO Employee (empno, name, phoneno, address, sex, position, deptno)
VALUES (4, '홍길동', '01012341546', '서울', '남', 'Manager', 2);

INSERT INTO Employee (empno, name, phoneno, address, sex, position, deptno)
VALUES (5, '고남순', '01012311112', '서울', '여', 'Manager', 1);

/* project 테이블 데이터 */
INSERT INTO Project (projno, projname, deptno)
VALUES (1, '데이터베이스', 1);
INSERT INTO Project (projno, projname, deptno)
VALUES (2, '시장조사', 2);

/* Works 테이블 데이터*/
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
