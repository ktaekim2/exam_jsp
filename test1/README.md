## 프로젝트 기능
1. 사원등록
2. 사원번호, 부서명을 통한 조회
3. 사원정보 수정(수정시에는 그냥 사원의 정보를 모두 입력함.)
4. 사원삭제

## 프로젝트 세팅 순서
1. dynamic web project 생성
    - 이클립스 File-New-Other 클릭 후 검색창에 dynamic web project 검색 또는 web 폴더 안에 있음.
    - 프로젝트 이름만 설정하면 다른 설정은 크게 필요하지 않음.
2. 프로젝트 세팅하고 jsp 파일은 src-main-webapp 폴더 안에 작성
3. java 클래스는 src-main-java 패키지안에 필요한 패키지 만들고 필요한 클래스 만듦.
    - MemberDAO 클래스: DB 와의 작업을 위한 클래스.
        - saveMember.jsp, findMember.jsp, updateMember.jsp, deleteMember.jsp 에서 MemberDAO 객체 호출함.
    - 조회 작업 등 할때는 DTO 클래스 만드는 것 권장.
4. DB 작업을 위해선 ojdbc11.jar 파일이 필요함. (평가시에는 미리 세팅되어 있거나 PC 바탕화면 등에 제공될 가능성 높음.)
    - 파일을 src-main-webapp-WEB-INF-lib 폴더 안에 가져다놓음.
    - ojdbc11.jar 라이브러리가 있어야 DAO 클래스에서 Connection, PreparedStatement, ResultSet 등의 객체 사용 가능.

## 이 예제의 개발 순서 
1. main.jsp
2. MemberDAO.java
3. MemberDTO.java
4. saveMemberForm.jsp, saveMember.jsp 등 crud를 위한 jsp 파일 작업 

## 주의사항 
1. 테이블에 샘플데이터를 저장하고 나면 반드시 commit을 할 것.

## 사용 쿼리 
```
-- 테이블 생성 쿼리 
    CREATE TABLE personnel(
 	id char(2) not null primary key,
 	name varchar2(30) not null,
 	dept varchar2(20) not null,
 	position char(1),
 	duty varchar2(20),
 	phone varchar2(14));
-- 데이터 저장 쿼리 
 insert into personnel values('95', '박민우', '인사부', '1', '상무', '010-1234-5678');
 insert into personnel values('96', '홍길동', '경리부', '2', '과장', '010-3333-4444');
```