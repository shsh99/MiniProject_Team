<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footer Example</title>
    <link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <script src="webjars/jquery/3.6.0/jquery.min.js"></script>
    <style>
        body {
            padding-bottom: 100px;
            position: relative;
            min-height: 100vh;
        }

        .container2 {
            padding-top: 20px;
            padding-bottom: 20px;
        }

        footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            background-color: #f8f9fa;
            text-align: center;
            padding: 20px 0;
        }

        #footer-bottom {
            background-color: #343a40; /* 푸터 하단 배경색 */
            color: white; /* 푸터 하단 텍스트 색상 */
            text-align: center; /* 푸터 하단 텍스트 가운데 정렬 */
            padding: 10px 0; /* 푸터 하단 내부 패딩 */
        }

        .social-icon {
            fill: white;
        }

        .footer-link {
            color: white;
        }

        /* 추가된 스타일 */
        .logo-text-container {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 20px; /* 이미지와 텍스트 사이의 간격 */
            text-align: center; /* 텍스트 가운데 정렬 */
        }

        .logo-text-container img {
            max-width: 100%; /* 이미지가 부모 요소에 맞추어지도록 최대 너비 설정 */
            height: auto; /* 이미지의 비율 유지 */
        }

        .logo-text-container p {
            margin: 0; /* 기본 마진 제거 */
            line-height: 1.5; /* 텍스트 줄 간격 설정 */
        }

        .second-p {
            margin-top: 10px; /* 두 번째 p 요소의 상단 마진 설정 */
            color: white; /* 텍스트 색상 */
        }
    </style>
</head>
<body>

    <!-- Footer -->
    <footer>
        <div id="footer-bottom">
            <hr class="text-white-50">
            <div class="container2">
                <div class="row py-3">
                    <div class="col-md-6">
                        <div class="logo-text-container">
                            <img src="images/ssgonline.jpg" alt="SSG Online 로고"
                                style="width: 250px;">
                            <p>
                                개인정보처리방침<br> 이용약관<br> We Are Hiring
                            </p>
                        </div>
                        
                    </div>
                  
                            (주)SSG Online | 대표자: SSG | 사업자번호: 010-010-00000 사업자 정보 확인<br>
                            통신판매업: 2018-센텀리더스-0062 | 개인정보보호책임자: SSG | 이메일: ssg@ssg.com<br>
                            전화번호: 070-4948-1181 | 주소: 부상광역시 해운대구 센텀리더스마크 4층 스파로스아카데미<br>
                            ©SSGLAB. ALL RIGHTS RESERVED
                      
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap Bundle with Popper -->
    <script src="webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
