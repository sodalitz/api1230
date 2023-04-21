`--(SQL학습하기
--1.DDL(테이블 조작 언어)
--1-1.테이블 생성하기(create)
--형식 creat table 테이블 이름(컬럼 데이터타입 null여부 (기본키나 기본값))
--);

CREATE TABLE member1230(
midx NUMBER NOT NULL PRIMARY key, --숫자형 기본키로 널값을 허용하지 않으며 다른행과 구분하는 고유값이다.
memberId VARCHAR2(50) NOT NULL,
memberpwd varchar2(50) NOT NULL,
memberName VARCHAR2(50)NOT NULL,
memberEmail VARCHAR2(50)  NULL,
memberGender VARCHAR2(50) null,
memberAddr VARCHAR(10) null,
memeberBirth VARCHAR(20) null,
delYN CHAR(1)  default 'N',
writeday DATE DEFAULT sysdate,
ip VARCHAR( 30)  null
);
--테이블 삭제
DROP TABLE memeber;
--테이블 변경
	--ALTER table 테이블 이름 키워드(add, modify)컬럼 데이터 타입 널여부 기본값
ALTER  table memeber1230 MODIFY memberGender VARCHAR2(10) ;


--테이블 컬럼 삭제
ALTER TABLE member1230 DROP COLUMN ip;
ALTER TABLE member1230 DROP COLUMN memeberBirth;
--테이블 컬럼 추가

ALTER TABLE member1230 ADD ip VARCHAR(30) NULL;
ALTER TABLE member1230 ADD memberbirth VARCHAR(30) NULL;

--2. 데이터 조작하기(DML)-select insert update delete 구문
--데이터 입력하기
-- 형식 INSERT INTO 테이블 이름(컬럼 ,컬럼,컬럼, 컬럼) valuses('값';'값','값');

INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memeberBirth,ip)
VALUES(1,'test1','1111','홍길동','test@naver.com','female','전주','20230101','123.456.79.100');

COMMIT;
SHOW VARIABLES LIKE 'lower_case_table_names'
SELECT * FROM member1230;
--데이터 변경 update
--형식은 update 테이블 이름 set 변경할 컬럼= 변경할 컬럼 값, 변경할 컬럼2= 변경할 컬럼값2 where 컬럼명= 컬럼값

UPDATE MEMBER1230 SET memberName ='홍길순' WHERE midx=1; --midx가 1번인 형태에 대해서 이름을 홍길순으로 바꿔라
COMMIT;


INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memberBirth,memberPhone,ip)
		VALUES(midx_seq.nextval,'memberId','memberPwd','memberName','memberEmail','memberGender', 'memberAddr','memberBirth','memberPhone',null)


--회원번호 1번인 사람의 이메일을 kjw@naver.com으로 변경하고 생년월일을 19990101로변경하세요

UPDATE MEMBER1230 SET MEMBEREMAIL='kjw@naver.com' , memeberBirth='19990101' WHERE midx=1;


INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memeberBirth,ip)
VALUES(2,'test2','1111','홍길서','test2@naver.com','female','서울','20100101','123.654.79.200');

--데이터 삭제
--(형식)delete from 테이블 이름 where 컬럼=컬럼값;
--회원번호 2번에 대해서데이터를 삭제하시오
DELETE FROM member1230 WHERE midx=305;

--복원(commit 실행하기 전이라면)
ROLLBACK;
select*FROM member1230;

INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memeberBirth,ip)
VALUES(3,'test.','1123','길동','test3@naver.com','male','서울','20120201','222.654.79.200');
INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memeberBirth,ip)
VALUES(4,'test4','1133','홍서','test4@naver.com','female','부산','20050501','196.654.79.200');
INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memeberBirth,ip)
VALUES(5,'test5','1155','홍길','test5@naver.com','male','전주','20180802','188.125.10.800');
INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memeberBirth,ip)
VALUES(6,'test6','5533','홍남','test6@naver.com','female','대구','20101111','146.684.74.210');
INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memeberBirth,ip)
VALUES(7,'test7','7755','홍동','test7@naver.com','male','강원도','20201202','186.124.10.800');
INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memeberBirth,ip)
VALUES(8,'test5','1155','철수','test8@naver.com','male','철원','19180802','128.125.10.800');
INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memeberBirth,ip)
VALUES(9,'test6','5533','영희','test9@naver.com','female','춘천','19101111','246.684.74.210');
INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memeberBirth,ip)
VALUES(10,'test7','7755','지영','test10@naver.com','male','대전','19201202','126.124.10.800');



--회원번호5번의 이름을 출력하세요
SELECT ip FROM member1230  WHERE midx=5;

--[형식] select 컬럼, 컬럼from 테이블 이름 where 조건 group 조건 order 정렬방식;
--전체데이터 가져오기
SELECT * FROM member1230;
--조건식 데이터를 가져오기
SELECT*FROM member1230 WHERE midx=1;
--회원번호가 1번8번0번 인 사람의 데이터를 출력하시오
select*FROM member1230 WHERE midx=1 OR midx=8 OR midx=9 --or 조건사용
select*FROM member1230 WHERE midx IN(1,8,9); --in 함수
--범위조건
--회원번호 4번부터8번까지 회원들의 정보를 출력하시오
SELECT* FROM member1230 WHERE midx >=4 AND midx < 8; --and 조건
SELECT *FROM member1230 WHERE midx BETWEEN 4and 8; -- between 조건

--회원번호 2번에서 8번까지 사람들 중에 서울에 지역이 서울인 사람의 데이터를 출력하시오

select*FROM MEMBER1230 WHERE memberAddr = '서울' AND midx BETWEEN 2 AND 8;
--정렬 오름차순 정렬	 내림차순 정렬
-- 회원번호를 최근 등록한 사람들 순으로 정렬하시오
--내림차순
select*FROM member1230 ORDER BY midx DESC(descending의 줄임말)
-- 회원번호를 오름 차순 형태로 정렬하시오
SELECT*FROM member1230 ORDER BY MIDX ASC;--asc는 생략가능

--회원번호가 4 7 10 번인 사람의 이름을 오름차순으로 출력하시오

select*FROM member1230 WHERE midx IN(4,7,10) ORDER BY memberName;

--검색조건
--like 조건 컬럼 like '%검색어%'
-- 김씨인 사람의 데이터를 출력하시오
-- SELECT *from member1230 where membername like '%김%'; -- 김이라는 글자가 중간에 포함되어 있는 사람들

select*FROM member1230 WHERE memberName LIKE '%김%'--앞글자가 김인 사람들

--회원들 중에 네이버 메일을 사용하는 회원들의 이름을 출력하시오
select memberName FROM member1230 WHERE MEMBEREMAIL LIKE '%naver%';
--전주에 사는 회원들 중에 00년대생 사람들의 이름을 오름차순으로 정렬하시오

SELECT memberName FROM member1230 WHERE memberBirth >= 20000000 AND MEMBERADDR LIKE '%전주%'ORDER BY memberName;

--문자열 자르기
-- 형식 substr (컬럼,자리수,개수)
-- 김씨성을 가진 회원들의 이름만 출력하시오
SELECT SUBSTR(membername,2)AS NAME FROM member1230 WHERE MEMBERNAME like'홍%';

--홍씨 성을 가진 회원의 중간이름만 출력하시오
SELECT SUBSTR(membername,2,1)AS NAME FROM member1230 WHERE MEMBERNAME like'홍%';

--회원의 마지막 글자만을 출력하시오
SELECT SUBSTR(membername,-1,1)AS NAME FROM MEMBER1230; --맨 마지막은 -1

--미영이라는 사람의 이메일 주소를 추력하시요

SELECT memberEmail FROM MEMBER1230 WHERE MEMBERNAME like'%철수%'
SELECT memberEmail FROM member1230 WHERE SUBSTR(membername,1,2)='철수';

--회원 전화번호 컬럼 추가하기
--memberphone varchar(12) null 처리

ALTER TABLE member1230 ADD memberphone VARCHAR(12) NULL;

--열명의 회원의 전화번호를 01045671990~1999번까지 등록하세요
update member1230 SET memberphone ='01045671990' WHERE midx=1;
update member1230 SET memberphone ='01045671991' WHERE midx=2;
update member1230 SET memberphone ='01045671992' WHERE midx=3;
update member1230 SET memberphone ='01045671993' WHERE midx=4;
update member1230 SET memberphone ='01045671994' WHERE midx=5;
update member1230 SET memberphone ='01045671995' WHERE midx=6;
update member1230 SET memberphone ='01045671996' WHERE midx=7;
update member1230 SET memberphone ='01045671997' WHERE midx=8;
update member1230 SET memberphone ='01045671998' WHERE midx=9;
update member1230 SET memberphone ='01045671999' WHERE midx=10;
COMMIT;
SELECT *FROM MEMBER1230;

--컬럼순서 변경하기
ALTER TABLE member1230 MODIFY(memberEmail visible);
ALTER TABLE member1230 MODIFY(memberGender visible);
ALTER TABLE member1230 MODIFY(memberAddr visible);
ALTER TABLE member1230 MODIFY(memberBirth visible);
ALTER TABLE member1230 MODIFY(delYN visible);
ALTER TABLE member1230 MODIFY(writeday visible);
ALTER TABLE member1230 MODIFY(ip visible);


--전주에 사는 90대생 전화번호 뒷자리 4개를 출력하시오
SELECT SUBSTR(memberphone,-4) AS phone4 FROM MEMBER1230 WHERE memberBirth LIKE '19%' AND memberAddr like '전주';


--철수 이름과 test8@naver.com 이메일을 쓰는사람의 아이디를 출력하시오
SELECT MEMBERID from member1230 WHERE MEMBEREMAIL = 'test8@naver.com' AND MEMBERNAME = '철수';

--3번 회 원이 회원탈퇴를 하였다 회원탈퇴 여부(delyn)를 y를 변경하시오
update MEMBER1230 SET DELYN='Y' WHERE midx=3;

--모든 가입된 정보를 출력하시오
SELECT*FROM MEMBER1230 WHERE delyn='N';

--그룹절을 사용
--형식 SELECT "from 테이블이름 group by 칼럼
--회원들의 지역을 지역별로 출려하시오
SELECT memberAddr FROM MEMBER1230 GROUP BY MEMBERADDR; --그룹절 안의 컬럼을 출력할수있다

--회원들의 지역별로 인원수를 출력하시오
--count()함수 사용
SELECT memberAddr,COUNT(*)AS cnt FROM member1230 GROUP BY MEMBERADDR;

--sum()함수 사용
-- 지역별로 각 회원의 회원번호 합을 출력하시오
SELECT MEMBERADDR,SUM(midx) AS sum FROM MEMBER1230 GROUP BY MEMBERADDR;

--avg(평균함수)
SELECT MEMBERaddr,aver(midx) AS avg FROM MEMBER1230 GROUP BY MEMBERADDR;

--max()최고값 min()최저값
SELECT memberaddr, MAX(midx) AS maxmidx, MIN(midx) AS minmidx FROM MEMBER1230 GROUP BY memberaddr;

--전체그룹에 대해서 최근 회원번호를 출력하시오
SELECT MAX(midx) AS maxmidx FROM MEMBER1230 ;
SELECT Min(midx) AS minmidx FROM MEMBER1230 ;
SELECT count(midx) AS cnt FROM MEMBER1230 ;
SELECT sum(midx) AS summidx FROM MEMBER1230 ;
SELECT avg(midx) AS avgmidx FROM MEMBER1230 ;

--가입된 회원의 총 인원수를 출력하세요
SELECT COUNT(*) AS cnt FROM MEMBER1230 WHERE delyn='N';

--전주에 사는 회원들의 평균나이를 구하세요
SELECT avg(2023 - SUBSTR(memberBirth,1,4,)) AS age FROM member1230 where memberAddr='전주';

--최근에 등록된 서울에 사는 사람의 이름을 출력하세요
SELECT membername FROM member1230 WHERE midx = (SELECT MAX(midx) AS maxmidx FROM member1230 WHERE MEMBERADDR='서울');

--회원번호 1번부터 7번까지인 사람들의 나이의 총합을 구하세요
SELECT  sum(2023 - SUBSTR(memberBirth,1,4)) AS sumage FROM MEMBER1230  where  midx BETWEEN 1 AND 7;

--핸드폰 끝자리가 5인 사람들의 명단을 지역별 이름내림차순으로 정렬하시오
SELECT MEMBERADDR from MEMBER1230 WHERE MEMBERPHONE like'%5' GROUP BY memberaddr,membername order BY MEMBERNAME DESC;

--사는 지역별로 사람들의 인원수를 출력하시오
SELECT MEMBERADDR,COUNT(midx) FROM MEMBER1230 GROUP BY MEMBERADDr;

--instr() 함수 검색어의 시작점 위치 뽑기
--사람들의 메일주소 자리 위치를 출력하시오
SELECT INSTR(MEMBEREMAIL,'@') AS LOC FROM MEMBER1230;

--회원들의 사용하는 메일별로 사람들의 인원수를 출력하시오
--@naver.com
SELECT SUBSTR(memberEmail,INSTR(memberemail,'@')),COUNT(*) FROM member1230 GROUP BY SUBSTR(memberEmail,INSTR(memberemail,'@'));

--지역별 성별 인원수를 출력하시오
SELECT memberaddr, membergender,count(*) FROM MEMBER1230 GROUP BY MEMBERADDR,membergender ORDER BY memberaddr;

--서브쿼리(쿼리 안 쿼리)
--회원번호가 평균 이하인 사람들의 데이터를 출력하시오
SELECT *FROM member1230 WHERE midx < (SELECT AVG(MIDX) FROM MEMBER1230 );

--나이가 가장 작은 사람의 전화번호를 출력하시오
SELECT*FROM member1230 WHERE(2023- SUBSTR(memberBirth,1,4)=(select min(2023 - SUBSTR(memberBirth,1,4)) FROM MEMBER1230 ));

--다중행값을 뽑아내는 서브쿼리
--회원번호가 홀수인 사람들의 이름을 서브쿼리를 활용해서출력하세요 mod(컬럼,2)=1

SELECT memberName FROM MEMBER1230 WHERE MOD(midx,2)=1;
SELECT membername FROM member1230 WHERE midx IN(SELECT midx FROM MEMBER1230 WHERE MOD(midx,2)=1);

--스칼라 서브쿼리(컬럼위치안에쓰는 서브쿼리)
--회원명단을 출력하고 탈퇴된 회원은 탈퇴라고 출력하셍
SELECT membername,(SELECT '탈퇴' FROM member1230 b WHERE a.midx=b.midx AND b.delyn='Y') FROM MEMBER1230 a ;

--인라인뷰 서브쿼리(단일테이블이 아닌 제약테이블 사용)
SELECT *FROM MEMBER1230 a,(SELECT *FROM MEMBER1230 WHERE membergender='female')b WHERE a.midx=b.midx;

--각 지역별 여성 인원수를 서브쿼리를 활용해서 출력하세요
SELECT memberaddr,COUNT(*) MEMBER1230 a,(SELECT *FROM member1230 WHERE memberGender='female')b WHER, MEMBER1230 cE a.midx=b.midx ORDER BY memberaddr;
SELECT memberaddr,COUNT(*) FROM member1230 WHERE midx IN(SELECT midx FROM MEMBER1230 WHERE MEMBERGENDER='female')GROUP BY memberaddr;

--case when then else end 조건식
--회원이 성별이 male 이면 남성이라고 출력하고 female이라면 여성을 출ㄺ하세요
SELECT midx,
CASE --성별이
 MEMBERGENDER
 WHEN  'male' THEN'남성' --male이면 남성
 WHEN 'female' THEN'여성'--female이면 여성
ELSE'모름' END AS gender
 from MEMBER1230;

 SELECT midx,
 CASE
 WHEN
 MEMBERGENDER='male' THEN '남성'
 MEMBERGENDER='female' THEN '여성'
 ELSE '모름' END AS gender
FROM member1230;

--decode() 조건식
SELECT midx, DECODE(membergender,'male','남성','female','여성','모름')AS gender FROM MEMBER1230 ;

--회원탈퇴되었으면 delyn='Y' 탈퇴라고 출력하고 n이면 가입이라고 출력하시오 (case문 활용
SELECT midx,
CASE
WHEN
delyn='Y' then'탈퇴'
ELSE '가입' END AS state
FROM member1230;


--회원번호 짝수인 사람의 ip를 null 처리 하시오;

UPDATE MEMBER1230 SET ip = NULL WHERE MOD(midx,2)=0;
COMMIT;
select*FROM member1230;

--ip가 널인 사람은 추적불가로 출력하고 아닌 사람은 추적가능하로 출력하세요

--null 체크하는 함수 nvl() nvl2()
SELECT ip NVL(ip,'추적불가') FROM MEMBER1230;
SELECT NVL2(ip,'추적가능','추적불가')FROM member1230;


--날짜함수
--시스템 날짜를 출력SELECT TO_DATE('20020101','yyyymmdd')AS 날짜 FROM dual;

SELECT SYSDATE FROM dual; --컬럼값을 출력하기 위한 임시테이블

--시스템 날짜를 문자열로 출력하세요 2000-01-01
-날짜형을 문자형으로 변환
SELECT TO_CHAR(SYSDATE,'yyyy-mm-dd')AS 현재날짜 FROM dual;

--문자형을 날짜형으로 변환

--member1230에 writeday칼럼의 데이터를 문자형 2023-01-01 형태대로 출력하시오
SELECT TO_CHAR(writeday,'yyyy-mm-dd') FROM MEMBER1230 ;

--특정일에 달수를 더할때 add_months()
--형재날짜에서 3개월후의 날자룰 출ㄺ하세요
SELECT add_months(sysdate,3)AS ymd FROM dual;

--특정일의 해당월의 마지막 날짜 출력last_day
SELECT LAST_DAY(SYSDATE) FROM dual;

--현재일로부터 6개얼 후 마지막 날짜를 출력하시오
SELECT LAST_DAY(add_months(sysdate,6))AS ymd FROM dual;

--요일 next_day('기준일','찾을요일')
--다음 일요일의날짜를 출력하시오
SELECT sysdate, NEXT_DAY(sydate,1) AS 다음 일요일날짜 FROM dual;

--trunc()첫 날짜뽑기
--현재일로부터 2개월후의 첫날짜를 구하시오
SELECT trunc(add_months(sysdate,2),'mm')AS ymd FROM dual;

--현제일로부터 올해년도 첫날짜를 출력하시오
SELECT TRUNC(sysdate,'yyyy')FROM dual;

--현재날짜의 3개월후의 그달의 세번째 토요일 날짜를 출력하세요
SELECT NEXT_DAY(add_months(sysdate,3),7)AS ymd FROM dual;
SELECT NEXT_DAY(ADD_MONTHS("2023-02-01",3),'mm')+14,7)FROM dual;
SELECT TO_CHAR(TRUNC(TO_DATE('yyyymm'), 'd') + 17, 'dd')
  FROM dual;

--join문

--테이블 생성
--board1230

CREATE TABLE board1230(
bidx NUMBER NOT NULL PRIMARY key,
subject VARCHAR2(50) NOT NULL,
contents varchar2(1000) NULL,
writer VARCHAR2(20) NULL,
delYN CHAR(1)  default 'N',
writeday DATE DEFAULT sysdate,
ip VARCHAR(30) null,
midx NUMBER NOT null,
CONSTRAINT midx_fk FOREIGN KEY(midx) REFERENCES member1230(midx));

select*FROM board1230;

INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(1,'첫번째글입니다','첫번째 내용입니다','김민수','111.222.333.444',1);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(2,'두번째글입니다','두번째 내용입니다','행인','111.222.333.444',2);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(3,'세번째글입니다','세번째 내용입니다','아이언맨','111.222.333.444',1);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(4,'네번째글입니다','네번째 내용입니다','토르',null,3);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(5,'다섯번째글입니다','다섯번째 내용입니다','스파이더맨',null,4);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(6,'여섯번째글입니다','여섯번째 내용입니다','슈퍼맨',null,3);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(7,'일곱번째글입니다','일곱번째 내용입니다','원더우먼',null,5);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(8,'여덟번째글입니다','여덟번째 내용입니다','배트맨',null,6);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(9,'아홉번째글입니다','아홉번째 내용입니다','이순신',null,1);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(10,'열번째글입니다','열번째 내용입니다','김순자',null,9);

COMMIT;

--inner join(공통된 컬럼으로 묶어서 하나의 테이블로 만드는 작업)
--형식(테이블 A innder join 테이블 B on A.PK컬럼 = B.FK컬럼)

--3번째글을 쓴 사람의 나이를 알려주세요
SELECT TO_CHAR(SYSDATE,'YYYY') -SUBSTR(A.memberBirth,1,4)AS age FROM MEMBER1230 A
 INNER JOIN board1230 B ON A.midx =B.midx
WHERE B.bidx =3;

SELECT TO_CHAR(SYSDATE,'YYYY') -SUBSTR(A.memberBirth,1,4)AS age FROM member1230 A, board1230 B
 WHERE a.midx=b.midx AND b.bidx=3;

 SELECT *FROM MEMBER1230
 --홍길순인 사람이 쓴글의 갯수를  출력하시오
 SELECT COUNT(*)AS cnt FROM MEMBER1230 A
 INNER JOIN board1230 B ON A.midx =B.midx
WHERE A.MEMBERNAME='홍길순';

 -- 각지역별로 게시물을 쓴 사람들의 인원수를 출력하시오

  SELECT a.MEMBERADDR,COUNT(DISTINCT a.midx)FROM MEMBER1230 A
 INNER JOIN board1230 B ON A.midx =B.midx
GROUP BY A.MEMBERADDR;

SELECT DISTINCT b.midx FROM board1230 b;

--게시글 내용중에 다섯이라는 글자가 포함된 데이터 글의 쓴스람의 아이디를 출력하시오

SELECT a.MEMBERID FROM MEMBER1230 A INNER JOIN board1230 B ON A.midx =B.midx where b.CONTENTS like'%다섯%';

--회원번호 1,3번에 해당하는 사람이 쓴 게시글의 ip를 추출하고 없으면 ip없음으로 출력하시오
SELECT a.midx, NVL(B.ip,'ip없음')FROM member1230 A INNER JOIN board1230 B ON A.midx =B.midx where A.midx IN(1,3);

--게시글 쓴사람의 닉네임이 3글자 이상인 사람의 성별을 출력하세요

SELECT DECODE(a.MEMBERGENDER,'male','남성','female','여성')AS gender FROM MEMBER1230 A INNER JOIN board1230 B ON A.midx =B.midx where length(b.WRITER)>=3;


--left outer join (왼쪽에 있는 테이블의 모든것과 오른쪽에 있는 공통된 데이터) outer 는 생략가능
--형식 select *from 테이블 A left outer join 테이블 B on A  A공통컬럼 = B 공통컬럼
-- 각지역별로 글쓴사람의 인원수를 출력하시오
SELECT MEMBERADDR, COUNT(DISTINCT b.midx) FROM member1230 A LEFT OUTER JOIN board1230 B ON a.midx = b.MIDX GROUP BY a.MEMBERADDR;

SELECT *FROM member1230 a LEFT JOIN board1230 b ON A.midx =b.midx;--(표준쿼리)

select*FROM MEMBER1230 A, BOARD1230 B WHERE a.midx=b.midx(+) AND 조건식;

--성별로 글쓴 사람의 인원수를 출력하시오(남성 몇명 여성 몇명)
SELECT memberGender, COUNT(DIStinct A.midx) FROM member1230 A JOIN board1230 B ON a.midx = b.MIDX GROUP BY a.MEMBERGENDER;

--게시글을 쓴사람들 중에 최고 나이 많은 사람의 나이와 가장 어린사람의 나이를 출력하시오
SELECT MAX(2023- SUBSTR(memberBirth,1,4)), min(2023 - SUBSTR(memberBirth,1,4)) FROM MEMBER1230  a JOIN board1230 b ON a.midx= b.midx ;


-- 외원번호 3,5번인 사람이 쓴글 내용중에 안녕이라는 글자가 모두 포함된 글을 번호로 출력하시오
SELECT* FROM BOARD1230 A JOIN MEMBER1230 B ON a.MIDX = b.MIDX from bidx=3 OR bidx=5;
SELECT * FROM board1230;

--시퀀스 (sequence)- 순서를 갖춘 장면(자동번호표)
--자동번호를 표를 만들어 내는 객체
--형식 create seqence 시퀀스 이름
-- increment by 1 (증가)
-- start with 1;

CREATE SEQUENCE midx_seq
INCREMENT BY 1
START WITH 1;
SELECT midx_SEQ.NEXTVAL FROM dual;
SELECT midx_seq.currval FROM dual;

DROP SEQUENCE midx_seq;

DELETE FROM member1230;
DELETE FROM board1230;

ROLLBACK;
COMMIT;

SELECT *FROM MEMBER1230 ;
select*FROM BOARD1230 ;


INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memberBirth,ip)
VALUES(midx_seq.nextval,'test1','1111','홍길동','test@naver.com','female','전주','20230101','123.456.79.1010');
INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memberBirth,ip)
VALUES(midx_seq.nextval,'test2','1111','홍길서','test2@naver.com','female','서울','20100101','123.654.79.200');
INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memberBirth,ip)
VALUES(midx_seq.nextval,'test3.','1235','김길동','test3@naver.com','male','서울','20120201','222.654.79.200');
INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memberBirth,ip)
VALUES(midx_seq.nextval,'test4','1133','서홍서','test4@naver.com','female','부산','20050501','196.654.79.200');
INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memberBirth,ip)
VALUES(midx_seq.nextval,'test5','1155','최홍길','test5@naver.com','male','전주','20180802','188.125.10.800');
INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memberBirth,ip)
VALUES(midx_seq.nextval,'test6','5533','유홍남','test6@naver.com','female','대구','20101111','146.684.74.210');
INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memberBirth,ip)
VALUES(midx_seq.nextval,'test7','7755','이홍동','test7@naver.com','male','강원도','20201202','186.124.10.800');
INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memberBirth,ip)
VALUES(midx_seq.nextval,'test5','1155','박철수','test8@naver.com','male','철원','19180802','128.125.10.800');
INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memberBirth,ip)
VALUES(midx_seq.nextval,'test6','5533','최영희','test9@naver.com','female','춘천','19101111','246.684.74.210');
INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memberBirth,ip)
VALUES(midx_seq.nextval,'test7','7755','홍지영','test10@naver.com','male','대전','19201202','126.124.10.800');


--게시글 모두를 지우고 시퀀스 bidx_seq를 생성해서 샘플데이터에 적용하시오
CREATE SEQUENCE bidx_seq
INCREMENT BY 1
START WITH 1;



SELECT *
FROM   MEMBER1230 ;

select*FROM BOARD1230 ;

INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(bidx_seq.nextval,'첫번째글입니다','첫번째 내용입니다','김민수','111.222.333.444',1);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(bidx_seq.nextval,'두번째글입니다','두번째 내용입니다','행인','111.222.333.444',2);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(bidx_seq.nextval,'세번째글입니다','세번째 내용입니다','아이언맨','111.222.333.444',1);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(bidx_seq.nextval,'네번째글입니다','네번째 내용입니다','토르',null,3);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(bidx_seq.nextval,'다섯번째글입니다','다섯번째 내용입니다','스파이더맨',null,4);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(bidx_seq.nextval,'여섯번째글입니다','여섯번째 내용입니다','슈퍼맨',null,3);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(bidx_seq.nextval,'일곱번째글입니다','일곱번째 내용입니다','원더우먼',null,5);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(bidx_seq.nextval,'여덟번째글입니다','여덟번째 내용입니다','배트맨',null,6);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(bidx_seq.nextval,'아홉번째글입니다','아홉번째 내용입니다','이순신',null,1);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(bidx_seq.nextval,'열번째글입니다','열번째 내용입니다','김순자',null,9);




DROP SEQUENCE midx_seq;
CREATE SEQUENCE midx_seq
INCREMENT BY 1
START WITH 1;


INSERT INTO member1230(midx,memberId,memberpwd,memberName,memberEmail,memberGender, memberAddr,memberBirth,ip)
 VALUES(midx_seq.nextval, '123','123','123','123','123','123','123',null);

 //SQL injection (쿼리를 주입)
 select*FROM MEMBER1230 WHERE memberid='test1' AND MEMBERPWD='  'OR' 1'= '1';



DELETE FROM board1230 WHERE midx < 600

alter sequence midx_seq nocache;
alter sequence midx_seq START WITH 2 ;
//midx 숫자정렬
COMMIT
 select*FROM MEMBER1230;

select count(*) as cnt from member1230 where memberId='ddd'

DROP SEQUENCE midx_seq;
CREATE SEQUENCE midx_seq START WITH 1

UPDATE board1230 SET viewcnt= NVL(viewcnt,0)+1 WHERE bidx=69
select*FROM BOARD1230 WHERE delyn ='N' ORDER BY BIDX DESC;

690 where delyn ='N' order by bidx DESC;

ALTER TABLE board1230 MODIFY writer VARCHAR2(50) ;

update board1230 set viewcnt=NVL(VIEWcnt,0)+1 where bidx=?
1

ALTER TABLE board1230
ADD viewcnt VARCHAR2(10) NULL
UPDATE board1230 SET viewcnt= NVL(viewcnt,0)+1 WHERE bidx=1

UPDATE board1230 SET viewcnt= NVL(viewcnt,0)+1 WHERE bidx=10
SELECT *FROM board1230;

UPDATE board1230 SET viewcnt=NVL(viewcnt,0)+1 WHERE bidx=8

ALTER TABLE board1230
ADD pwd VARCHAR2(20) NULL;

UPDATE board1230 SET pwd='0000'
COMMIT

ALTER TABLE board1230
ADD originbidx NUMBER NULL;

ALTER TABLE board1230
ADD depth NUMBER NULL;

ALTER TABLE board1230
ADD level_ NUMBER NULL;


ALTER TABLE board1230 MODIFY(subject invisible);
ALTER TABLE board1230 MODIFY(contents invisible);
ALTER TABLE board1230 MODIFY(writer invisible);
ALTER TABLE board1230 MODIFY(delyn invisible);
ALTER TABLE board1230 MODIFY(writeday invisible);
ALTER TABLE board1230 MODIFY(ip invisible);
ALTER TABLE board1230 MODIFY(midx invisible);
ALTER TABLE board1230 MODIFY(viewcnt invisible);
ALTER TABLE board1230 MODIFY(pwd invisible);




ALTER TABLE board1230 MODIFY(subject visible);
ALTER TABLE board1230 MODIFY(contents visible);
ALTER TABLE board1230 MODIFY(writer visible);
ALTER TABLE board1230 MODIFY(delyn visible);
ALTER TABLE board1230 MODIFY(writeday visible);
ALTER TABLE board1230 MODIFY(ip visible);
ALTER TABLE board1230 MODIFY(midx visible);
ALTER TABLE board1230 MODIFY(viewcnt visible);
ALTER TABLE board1230 MODIFY(pwd visible)



--새글입력하기
UPDATE board1230 SET depth= depth+1 WHERE originbidx=262 AND depth>0;
INSERT INTO board1230(bidx,originbidx, depth, level_, subject,contents,writer,ip,midx,pwd)
 VALUES(bidx_seq.nextval, bidx_seq.nextval,0,0,'글입니다','내용입니다','김수민','111.222.333.444','1','1111');


VALUES(bidx_seq.nextval, 241,3,3,'첫 답변글입니다','내용입니다','김수민','111.222.333.444','1','1111');


commit
/2023/04/17/s-fb7f1162-1251-4c21-88cc-f594717f5a00_download.jpg/2023/04/17/s-fb7f1162-1251-4c21-88cc-f594717f5a00_download.jpgselect*FROM MEMBER1230

DELETE FROM BOARD1230


--답변글 입력하기
SELECT *FROM BOARD1230 WHERE delyn='N' ORDER BY originbidx desc,depth ASC;
UPDATE board1230 SET depth= depth+1 WHERE originbidx=262 AND depth>0
update board1230 set depth= depth+1 where originbidx=? and depth>?

SELECT *FROM(
SELECT ROWNUM AS rnum, A.* from(
SELECT *FROM BOARD1230 WHERE DELYN='N' ORDER BY ORIGINBIDX DESC, depth asc)A
)B WHERE B.rnum BETWEEN ? and ?;

(page-1)*15+1  page*15
SELECT * FROM MEMBER1230 WHERE MEMBERID (ROWNUM <=10)

ALTER TABLE BOARD1230
ADD filename VARCHAR2(50) NULL;

ALTER SEQUENCE midx_seq CACHE 2
DROP SEQUENCE midx_seq
CREATE SEQUENCE midx_seq START WITH 3 CACHE 3
COMMIT
ALTER SEQUENCE bidx_seq INCREMENT BY -694;

SELECT bidx_seq .NEXTVAL FROM dual;

ALTER SEQUENCE  bidx_seq INCREMENT BY 1;
SELECT midx_

.NEXTVAL FROM DUAL

SELECT bidx_seq.CURRVAL FROM DUAL

ALTER TABLE board1230
MODIFY filename VARCHAR(100);

commit
SELECT * FROM MEMBER1230

SELECT * FROM (SELECT ROWNUM AS rnum, A.* FROM 	board1230 SELECT * FROM board1230  WHERE delyn='N' "+str+" ORDER BY originbidx desc, depth asc) A )B WHERE B.rnum BETWEEN ? AND ?
SELECT * FROM (
    SELECT ROWNUM AS rnum, A.*
    FROM (
        SELECT * FROM board1230
        WHERE delyn='N'
        ORDER BY originbidx DESC, depth ASC
    ) A
) B
WHERE B.rnum BETWEEN ? AND ?

CREATE TABLE COMMENT(
cidx NUMBER NOT NULL PRIMARY KEY
cwriter VARCHAR2(20) null,
ccontents VARCHAR2(2000) NULL,
midx NUMBER NOT null,
bidx NUMBER NOT NULL,
ip VARCHAR2(30) null,
writeday DATE DEFAULT sysdate,
CONSTRAINT cidx_midx_fk FOREIGN KEY(midx) REFERENCES member1230(midx),
CONSTRAINT cidx_bidx_fk FOREIGN KEY(bidx) REFERENCES board1230(bidx),

);