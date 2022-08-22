## 프로젝트 기능
1. 회원등록
   1. 회원등록시 회원번호는 DB 작업 필요함. 
2. 회원목록출력
   1. 목록에서 회원번호 클릭하면 수정화면 출력
3. 회원정보 수정
4. 매출조회 
   1. 조인, group by 쿼리 사용해야 함. 

## 프로젝트 세팅 순서
1. dynamic web project 생성
   - 이클립스 File-New-Other 클릭 후 검색창에 dynamic web project 검색 또는 web 폴더 안에 있음.
   - 프로젝트 이름만 설정하면 다른 설정은 크게 필요하지 않음.
2. 프로젝트 세팅하고 jsp 파일은 src-main-webapp 폴더 안에 작성
3. java 클래스는 src-main-java 패키지안에 필요한 패키지 만들고 필요한 클래스 만듦.
   - MemberDAO 클래스: DB 와의 작업을 위한 클래스.
      - 예제에서 어떤 jsp가 DAO 객체 호출하는지 잘 볼 것.
   - 조회 작업 등 할때는 DTO 클래스 만드는 것 권장. 
4. DB 작업을 위해선 ojdbc11.jar 파일이 필요함. (평가시에는 미리 세팅되어 있거나 PC 바탕화면 등에 제공될 가능성 높음.)
   - 파일을 src-main-webapp-WEB-INF-lib 폴더 안에 가져다놓음.
   - ojdbc11.jar 라이브러리가 있어야 DAO 클래스에서 Connection, PreparedStatement, ResultSet 등의 객체 사용 가능.

## 사용 쿼리 
1. 특히 insert 쿼리를 DB에 직접 수행하게 되면 commit을 반드시 해야함. 

```
-- 회원 테이블 생성
create table member_tbl_02(
    custno number not null primary key, 
    custname varchar2(20),
    phone varchar2(13),
    address varchar2(60),
    joindate date,
    grade char(1),
    city char(2)
    );
    
-- 회원 데이터 저장
insert into member_tbl_02 values(100001, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01');   
insert into member_tbl_02 values(100002, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151206', 'B', '01');   
insert into member_tbl_02 values(100003, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '20151001', 'B', '30');   
insert into member_tbl_02 values(100004, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도2리', '20151103', 'A', '30');   
insert into member_tbl_02 values(100005, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151225', 'B', '60');   
insert into member_tbl_02 values(100006, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C', '60');

-- 회원 매출 테이블 생성
create table money_tbl_02(
    custno number(6),
    saleno number(8) not null primary key,
    pcost number(8),
    amount number(4),
    price number(8),
    pcode varchar2(4),
    sdate date
    );
    
-- 회원 매출 데이터 저장
insert into money_tbl_02 values(100001, seq_saleno.nextval, 500, 5, 2500, 'A001', '20160101');    
insert into money_tbl_02 values(100001, seq_saleno.nextval, 1000, 4, 4000, 'A002', '20160101');    
insert into money_tbl_02 values(100001, seq_saleno.nextval, 500, 3, 1500, 'A008', '20160101');    
insert into money_tbl_02 values(100002, seq_saleno.nextval, 2000, 1, 2000, 'A004', '20160102');    
insert into money_tbl_02 values(100002, seq_saleno.nextval, 500, 1, 500, 'A001', '20160103');    
insert into money_tbl_02 values(100003, seq_saleno.nextval, 1500, 2, 3000, 'A003', '20160103');    
insert into money_tbl_02 values(100004, seq_saleno.nextval, 500, 2, 1000, 'A001', '20160104');    
insert into money_tbl_02 values(100004, seq_saleno.nextval, 300, 1, 300, 'A005', '20160104');    
insert into money_tbl_02 values(100004, seq_saleno.nextval, 600, 1, 600, 'A006', '20160104');    
insert into money_tbl_02 values(100004, seq_saleno.nextval, 3000, 1, 3000, 'A007', '20160106');      

-- 매출 정보 가져오는 쿼리(MemberDAO.salesList() 에서 사용한 쿼리와 동일)
select m.custno, m.custname, 
    case    when m.grade='A' then 'VIP'
            when m.grade='B' then '일반'
            when m.grade='C' then '직원'            
            else '없음' 
    end as grade,
    sum(mo.price) as total 
    from member_tbl_02 m, money_tbl_02 mo 
        where m.custno=mo.custno 
            group by m.custno, m.custname, m.grade 
                order by total desc;
```