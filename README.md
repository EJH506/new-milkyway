## 은하수책방
🕹 서비스 체험하기

[▶ 여기를 눌러 시작해보세요 ! ◀](http://3.37.117.137:8080)
<br /><br />

### 📖 프로젝트 소개
인터넷서점과 커뮤니티가 결합된 형태의 <br />
소셜커머스 웹사이트 입니다.
<br /><br />

### ⚙ 개발 환경
- JDK : 11
- Web Server : Apatch Tomcat 9
- Database : MySQL 8
- 프로그래밍 언어 : Java (JSP, Servlet)
- IDE : Eclipse 2024-06
- 버전 관리 : Git
- 배포환경 :
  - 클라우드 서비스 : AWS EC2
  - 운영체제 : Ubuntu 22.04 LTS
  - 백엔드 : Java (Servlet)
  - 데이터베이스 : MySQL
  - 배포 방식 : SSH와 도커 이미지를 사용하여 EC2 인스턴스에 배포
  - URL : http://3.37.117.137:8080
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
1. 프로젝트 내려받기
```
// 프로젝트 복제
$ git clone https://github.com/UJH506/newMilkyWay.git
```
<br />

2. IDE에 Import 후 환경설정<br />
<img src="https://github.com/user-attachments/assets/814039bf-6e27-4d08-bf17-565e68902100" width="500px" alt="은하수_환경설정">
<br /><br />

3. Servers 디렉토리 하위의 설정파일 수정
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
<br />
    
4. DB 생성
- 프로젝트/src/main/webapp/sql 경로의 sql구문들을 참조하여 "MillkyWayDB" DB 생성
- 프로젝트/Java Resources/src/main/java/DBConnection 경로의 DBConnectionMgr.java파일에서의 DB설정 정보 수정
<br /><br />

### 👬 팀원소개
<table>
  <tr>
    <th>김정훈</th>
    <th>한수진</th>
    <th>엄지혜</th>
  </tr>
  <tr>
    <td>
        메인 페이지, 마이 페이지,<br />로그인 페이지, 서버 배포<br />
    </td>
    <td>
        상품관련 페이지, 추천도서 페이지, 회원가입 페이지,<br />
        로그인 페이지, 관리자 페이지, 서버 배포<br />
    </td>
    <td>
        커뮤니티 페이지, 로그인 페이지,<br />
        관리자 페이지, 서버 배포<br />
    </td>
  </tr>
</table>