## 은하수책방
(접속 링크)
<br /><br />

### 📖 프로젝트 소개
인터넷서점과 커뮤니티가 결합된 형태의 <br />
소셜커머스 웹사이트 입니다.
<br /><br />

### ⚙ 개발 환경
- JDK : 11
- Web Server : Apatch Tomcat 9
- Database : MySQL 5
- 프로그래밍 언어 : Java (JSP, Servlet)
- IDE : Eclipse 2024-06
- 버전 관리 : Git
- 배포환경 :
<br /><br />

### 📌 주요 기능
#### 회원 서비스
- 회원가입 및 로그인
- 마이페이지 조회 및 관리
- 회원정보 수정
- 아이디 저장
- 네이버 로그인 API를 통한 네이버 계정으로 로그인

#### 쇼핑몰
- 도서 검색/조회
- 도서 구매/취소/환불
- 장바구니 및 관심목록
  - 일괄구매/개별구매/수량선택 등
- 리뷰작성
- 네이버 API를 통한 네이버쇼핑으로 도서 검색

#### 커뮤니티
- 게시글 및 댓글 작성/조회/수정/삭제
- 이미지 업로드
- 게시글 목록 페이징/필터링/검색
- 글 추천 기능
- 인기글
- 연관도서 및 '지금 핫한 책'의 상품페이지 연결
<br /><br />

### 🕹 시작 가이드 (직접 실행 시)
```
// 프로젝트 복제
$ git clone https://github.com/UJH506/newMilkyWay.git
```
// IDE에 Import 후 환경설정<br />
<img src="https://github.com/user-attachments/assets/814039bf-6e27-4d08-bf17-565e68902100" width="500px" alt="은하수_환경설정">

// Servers 디렉토리 하위의 설정파일 수정
- context.xml
  - <Context> 태그에 속성추가
  - <Context> 태그 내부에 Resources 설정 추가
  ```xml
  <Context allowCasualMultipartParsing="true" path="/"> // 속성추가
    <Resources cachingAllowed="true" cacheMaxSize="100000" /> // 태그 추가

    ... (생략)
  </Context>
  ```

- server.xml
  - Context Path 수정
    - /MillkyWay -> /
    ```xml
    <Context docBase="MillkyWay" path="/" ...(생략) />
    ```
// DB 생성
- 프로젝트/src/main/webapp/sql 경로의 sql구문들을 참조하여 "MillkyWayDB" DB 생성
- 프로젝트/Java Resources/src/main/java/DBConnection 경로의 DBConnectionMgr.java파일에서의 DB설정 정보 수정 
