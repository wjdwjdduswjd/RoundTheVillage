# 동네한바퀴

## 개요
### 우리 동네 공방 찾기 프로젝트 
#### 내용

## 구현기능

- 카카오api를 이용한 sns 연동 로그인
- import를 이용한 수업, 배너 결제
- 카카오맵 api 를 이동한 지도 표시(ajax 이용)

## 설계의 주안점

- 회원가입시 받아놓은 정보들로 공방들을 추천.
- 공방에 해당하는 수업들을 결제를 통해 서비스를 이용.
- 일반회원과 공방회원으로 회원가입, 공방회원은 따로 정보를 추가해서 서비스를 제공 가능

## 사용기술 및 개발환경

- OS: Windows 10
- WAS: Apache Tomcat 8.5
- 개발환경 및 툴 : Spring, Java, Oracle, SQL Developer, VS Code, photoShop
- 사용한 기술 : Servlet, JSP, HTML, CSS3, JavaScript, jQuery
- 사이트 참고 : 와이어프레임 (figma), 미리캔버스(로고, 아이콘),  구글 스프레드시트(프로젝트 관련 실시간 공유)
- API : summernote, GSON, Kakao map API, 다음 우편번호 서비스, import
- 형상관리 : GitHub
- 배포 : AWS

## 역할 분담
### 김정민
- 수업관리(등록 / 수정 / 삭제) , 수업 목록조회 및 필터검색, 수업신청, 수업 후기(신고), 수업 문의, 답변, 배포
### 김정화
- 공방 관리(등록/수정), 카카오맵 api를 이용한 공방 조회, 공방 상세조회( 수업, 리뷰 조회 및 좋아요 기능) 관리자 공방 관리(공방 승인 및 관리)
### 김정훈
- 헤더, 메인 (인기/주변/관심/신규 공방 추천),, 관리자 (회원 조회/검색), 공지사항 (목록/상세/삽입/수정/삭제/검색) ppt 및 디자인 담당
### 정연정
- 후기 게시판 (목록 조회 / 상세 조회 / 삽입 / 수정 / 삭제 / 검색), 관리자 신고 처리 페이지 
### 조유림
- 수업 결제 / 결제 내역 목록 / 상세 / 배너 결제 / 결제 내역 목록 / 상세 / 배너 승인 / 메인 배너
### 이진선(팀장)
- 로그인 / sns로그인(카카오톡) / 회원가입 / 내정보 조회 및 수정 / 비밀번호 변경 / 회원탈퇴 / 아이디.비밀번호 찾기

+ DB 설계



----------------------------------------------------------------------------------------------------------------------------------------


# :clipboard: 구현 기능
---------------------------------------------------------------------------------------------------------------------------------------

## 후기게시판 
---


+ ### 후기게시판 메인 페이지

1. 상단의 수업 카테고리를 통해 후기 게시글을 조회할 수 있다. 


2. 로그인을 하면 우측 하단에 글쓰기 버튼이 보인다.


3. 사진을 누르면 해당 게시글로 이동한다. 


4. 게시글이 15개씩 보여지게 하고 그 이상의 글들은 페이징 처리를 통해 그 다음장에 보여진다.


5. 게시글 상세조회 페이지에서 좋아요를 누르면 좋아요 숫자가 보여진다. 


6. 글 제목과 내용으로 검색할 수 있다.


<img src="https://user-images.githubusercontent.com/71631964/115359196-66e2cb80-a1f9-11eb-82c8-ef6604f540c0.png" width="너비 " height="높이">

---


 + ### 후기게시판 게시판 등록 페이지


1. 작성자가 결제한 공방 수업 목록을 selectbox를 통해 볼 수 있다.


2. 썸네일과 썸머노트에 넣을 파일을 삽입할 수 있다. 


3. 등록 버튼을 누르면 ‘게시글 등록 성공’이라는 alert창이 뜬다.


<img src="https://user-images.githubusercontent.com/71631964/115362057-22a4fa80-a1fc-11eb-9ed4-8f0a4a45bf40.png" width="너비 " height="높이">


---


+ ### 후기게시판 게시글 수정 페이지


1. 수정할 글 하단의 수정 버튼을 누르면 게시글 수정이 가능하다.


2. 썸네일과 썸머노트 파일 수정이 가능하다.


3. 하단의 수정 버튼을 누르면 '게시글 수정 성공‘ 이라는 alert창이 뜬다.


<img src="https://user-images.githubusercontent.com/71631964/115364198-1ae65580-a1fe-11eb-99fb-f3ed624a46c4.png" width="너비 " height="높이">


---






