# 온라인 강의 프로그램 개발 미니 프로젝트

## 프로젝트 개요
온라인 강의 판매 및 관리 시스템을 구축하는 팀 프로젝트입니다. Spring Boot 기반의 웹 애플리케이션으로, 사용자는 강의를 검색하고 수강신청할 수 있으며, 관리자는 강의와 회원을 관리할 수 있습니다.

## 프로젝트 기간
2024/06/17 ~ 2024/06/21 (총 5일)

## 기술 스택

### Backend
- Java 11
- Spring Boot 2.7.18
- Spring Security (인증/인가)
- MyBatis 2.1.4 (ORM)
- MySQL 8.0.33

### Frontend
- JSP (서버 사이드 렌더링)
- Bootstrap 5.1.3
- jQuery 3.6.0
- JSTL

### Build & Deploy
- Maven
- Embedded Tomcat

## 프로젝트 구조

```
src/main/java/com/exam/
├── Application.java              # 메인 진입점
├── controller/
│   ├── HomeController.java
│   ├── admin/                    # 관리자 컨트롤러
│   ├── user/                     # 회원 관련 컨트롤러
│   ├── course/                   # 강의 컨트롤러
│   ├── cart/                     # 장바구니 컨트롤러
│   ├── review/                   # 리뷰 컨트롤러
│   └── application_list/         # 수강신청 컨트롤러
├── service/                      # 비즈니스 로직 계층
├── mapper/                       # MyBatis 데이터 접근 계층
├── dto/                          # 데이터 전달 객체
└── security/                     # Spring Security 설정
```

## 주요 기능

### 회원 기능
| 기능 | 설명 |
|------|------|
| 회원가입 | ID 중복 체크, BCrypt 비밀번호 암호화 |
| 로그인/로그아웃 | Spring Security 기반 인증 |
| 마이페이지 | 회원 정보 조회 및 수정 |
| 비밀번호 변경 | 현재 비밀번호 확인 후 변경 |
| 회원 탈퇴 | 비밀번호 확인 후 탈퇴 처리 |

### 강의 기능
| 기능 | 설명 |
|------|------|
| 강의 목록 | 카테고리별(Front/Back) 필터링, 세일 상품 필터링 |
| 강의 상세 | 강의 정보 및 리뷰 목록 표시 |
| 장바구니 | 강의 담기, 중복 체크, 삭제 |
| 수강신청 | 강의 신청, 중복 신청 방지 |

### 리뷰 기능
| 기능 | 설명 |
|------|------|
| 리뷰 작성 | 수강한 강의에 대해 평점 및 리뷰 작성 |
| 리뷰 조회 | 강의별 리뷰 목록 표시 |

### 관리자 기능
| 기능 | 설명 |
|------|------|
| 회원 관리 | 회원 목록 조회, 정보 수정, 권한 변경, 삭제 |
| 강의 관리 | 강의 추가, 수정, 삭제 |
| 리뷰 관리 | 전체 리뷰 조회 및 삭제 |

## 데이터베이스 구조

### ERD 테이블
- **tb_user**: 사용자 정보 (로그인ID, 비밀번호, 이름, 생년월일, 이메일, 전화번호, 주소, 권한)
- **TB_COURSE**: 강의 정보 (제목, 강사명, 기간, 가격, 소개, 이미지, 카테고리)
- **tb_cart**: 장바구니 (사용자ID, 강의ID)
- **tb_application_list**: 수강신청 (사용자ID, 강의ID, 신청일)
- **tb_review**: 리뷰 (사용자ID, 강의ID, 제목, 내용, 평점, 작성일)

## 실행 방법

### 1. 데이터베이스 설정
```sql
CREATE DATABASE miniproject12;
```

### 2. application.properties 설정
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/miniproject12
spring.datasource.username=root
spring.datasource.password=1234
```

### 3. 프로젝트 실행
```bash
mvn spring-boot:run
```

### 4. 접속
- URL: http://localhost:8090/app/home

## 권한 체계

| 역할 | 권한 |
|------|------|
| 비회원 | 강의 목록/상세 조회, 회원가입, 로그인 |
| 일반 회원 (role=0) | 장바구니, 수강신청, 리뷰 작성, 마이페이지 |
| 관리자 (role=1) | 회원/강의/리뷰 관리 |

## 보안 설정

- BCrypt 비밀번호 암호화
- Spring Security 기반 인증/인가
- 역할 기반 접근 제어 (RBAC)
- 관리자 페이지 접근 제한 (/admin/**)
