<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!-- App key -->
<c:set var="kakaoAppKey" value="1c3115b6d9e55307b98cca908fa183ec" />
<c:set var="googleAppKey" value="555940496773-dbg28noklm09nmmp7lo1veo1rki4iumu.apps.googleusercontent.com" />
<c:set var="naverAppKey" value="nGPht0bboCyg0zTVBTx4" />
<c:set var="facebookAppKey" value="763266397775448" />
<c:set var="reCAPTCHASiteKey" value="6Le46LEZAAAAAM-dtGNGiQKA6HR-DJyDl3KTue6x" />

<!-- Redirect URI -->
<c:set var="kakaoLoginRedirectUri" value="http://localhost:8080/login_action/kakao" />
<c:set var="googleLoginRedirectUri" value="http://localhost:8080/login_action/google" />
<c:set var="naverLoginRedirectUri" value="http://localhost:8080/login_action/naver" />
<c:set var="facebookLoginRedirectUri" value="http://localhost:8080/login_action/facebook" />

<!-- Login Processing URI -->
<c:set var="googleLoginUri" value="https://accounts.google.com/signin/oauth/oauthchooseaccount?client_id=${googleAppKey}&redirect_uri=${googleLoginRedirectUri}&response_type=token&scope=email" />
<c:set var="naverLoginUri" value="https://nid.naver.com/oauth2.0/authorize?client_id=${naverAppKey}&redirect_uri=${naverLoginRedirectUri}&response_type=code&state=${naverLoginRedirectUri}" />
<c:set var="facebookLoginUri" value="https://www.facebook.com/v7.0/dialog/oauth?client_id=${facebookAppKey}&redirect_uri=${facebookLoginRedirectUri}&state=st=${'state123abc,ds=123456789'}" />

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Login</title>

    <!-- jQuery import -->
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

    <!-- Kakao Login -->
    <script src="<c:url value="/resources/js/kakao.js" />"></script>

    <!-- NAVER Login -->
    <script src="<c:url value="/resources/js/naveridlogin_js_sdk_2.0.0.js" />"></script>

    <!-- Facebook Login -->
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v7.0&appId=${facebookAppKey}&autoLogAppEvents=1" nonce="x68pPYFF"></script>

    <!-- reCAPTCHA -->
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>

    <script>
        $(document).ready(() => {
            const checkReCAPTCHA = callback => {
                if (grecaptcha.getResponse() === "")
                    alert("로그인 전 reCAPTCHA를 체크해주세요.");
                else callback();
            };

            // Kakao Login
            Kakao.init("${kakaoAppKey}");
            $("#kakao-login").on("click", () => checkReCAPTCHA(() =>
                Kakao.Auth.authorize({ redirectUri: '${kakaoLoginRedirectUri}' })));

            // Google Login
            $("#google-login").on("click", () =>
                checkReCAPTCHA(() => location.href = "${googleLoginUri}"));

            // NAVER Login
            $("#naver-login").on("click", () =>
                checkReCAPTCHA(() => location.href = "${naverLoginUri}"));

            // Facebook Login
            $("#facebook-login").on("click", () =>
                checkReCAPTCHA(() => location.href = "${facebookLoginUri}"));
        });
    </script>
</head>
<body>
    <!-- Kakao Login -->
    <div id="kakao-login" style="display: table; border: 1px solid rgba(134,156,205,0.99); background-color: transparent; border-radius: 12px; width: 300px; height: 50px; margin: 10px 0; cursor: pointer;">
        <span style="display: table-cell; vertical-align: middle; width: 20%; text-align: center;">
            <img src="<c:url value="/resources/img/kakao_symbol.png"/>" width="30" height="30" style="display: table-cell; vertical-align: middle; margin: 0 auto;" />
        </span>
        <span style="display: table-cell; vertical-align: middle; width: 80%; text-align: center;">카카오로 로그인하기</span>
    </div>

    <!-- Google Login -->
    <div id="google-login" style="display: table; border: 1px solid rgba(134,156,205,0.99); background-color: transparent; border-radius: 12px; width: 300px; height: 50px; margin: 10px 0; cursor: pointer;">
        <span style="display: table-cell; vertical-align: middle; width: 20%; text-align: center;">
            <img src="<c:url value="/resources/img/google_symbol.png"/>" width="30" height="30" style="display: table-cell; vertical-align: middle; margin: 0 auto;" />
        </span>
        <span style="display: table-cell; vertical-align: middle; width: 80%; text-align: center;">Google로 로그인하기</span>
    </div>

    <!-- NAVER Login -->
    <div id="naver-login" style="display: table; border: 1px solid rgba(134,156,205,0.99); background-color: transparent; border-radius: 12px; width: 300px; height: 50px; margin: 10px 0; cursor: pointer;">
        <span style="display: table-cell; vertical-align: middle; width: 20%; text-align: center;">
            <img src="<c:url value="/resources/img/naver_symbol.png"/>" width="30" height="30" style="display: table-cell; vertical-align: middle; margin: 0 auto;" />
        </span>
        <span style="display: table-cell; vertical-align: middle; width: 80%; text-align: center;">네이버로 로그인하기</span>
    </div>

    <!-- Facebook Login -->
    <div id="facebook-login" style="display: table; border: 1px solid rgba(134,156,205,0.99); background-color: transparent; border-radius: 12px; width: 300px; height: 50px; margin: 10px 0; cursor: pointer;">
        <span style="display: table-cell; vertical-align: middle; width: 20%; text-align: center;">
            <img src="<c:url value="/resources/img/facebook_symbol.png"/>" width="30" height="30" style="display: table-cell; vertical-align: middle; margin: 0 auto;" />
        </span>
        <span style="display: table-cell; vertical-align: middle; width: 80%; text-align: center;">Facebook으로 로그인하기</span>
    </div>

    <!-- reCAPTCHA -->
    <div class="g-recaptcha" data-sitekey="${reCAPTCHASiteKey}"></div>
</body>
</html>
