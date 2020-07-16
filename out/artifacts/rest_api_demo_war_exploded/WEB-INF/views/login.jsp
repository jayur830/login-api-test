<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!-- Redirect URI -->
<c:set var="kakaoLoginRedirectUri" value="http://localhost:8080/login_action/kakao" />
<c:set var="googleLoginRedirectUri" value="http://localhost:8080/login_action/google" />
<c:set var="naverLoginRedirectUri" value="http://localhost:8080/login_action/naver" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Login</title>

    <!-- jQuery import -->
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

    <!-- Kakao Login -->
    <script src="<c:url value="/resources/js/kakao.js" />"></script>

    <!-- Google Login -->
    <meta name="google-signin-client_id" content="555940496773-dbg28noklm09nmmp7lo1veo1rki4iumu.apps.googleusercontent.com" />
    <meta name="google-signin-ux_mode" content="redirect" />
    <meta name="google-signin-redirect_uri" content="${googleLoginRedirectUri}" />
    <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>

    <!-- NAVER Login -->
    <script src="<c:url value="/resources/js/naveridlogin_js_sdk_2.0.0.js" />"></script>

    <!-- Facebook Login -->
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v7.0&appId=763266397775448&autoLogAppEvents=1" nonce="x68pPYFF"></script>

    <!-- reCAPTCHA -->
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<body>
    <!-- Kakao Login -->
    <a id="kakao-login" href="javascript:kakaoLogin();">
        <img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="250" alt="카카오 계정으로 로그인합니다." />
    </a>

    <!-- Google Login -->
    <div class="g-signin2"></div>
    <div onclick="" style="cursor: pointer;">
        <img src="" alt="구글 계정으로 로그인합니다." />
    </div>

    <!-- NAVER Login -->
    <div onclick="naverLogin();" style="cursor: pointer;">
        <img src="<c:url value="/resources/img/naver_login_btn.png" />" width="250" alt="네이버 계정으로 로그인합니다." />
    </div>

    <!-- Facebook Login -->
    <div class="fb-login-button"
         data-size="large"
         data-button-type="login_with"
         data-layout="default"
         data-auto-logout-link="false"
         data-use-continue-as="false"
         data-width="250"></div>

    <!-- reCAPTCHA -->
    <div class="g-recaptcha" data-sitekey="6Le46LEZAAAAAM-dtGNGiQKA6HR-DJyDl3KTue6x"></div>

    <script>
        // Kakao Login
        Kakao.init("1c3115b6d9e55307b98cca908fa183ec");
        const kakaoLogin = () => {
            if (grecaptcha.getResponse() === "")
                alert("로그인 전 reCAPTCHA를 체크해주세요.");
            else Kakao.Auth.authorize({ redirectUri: '${kakaoLoginRedirectUri}' });
        };

        // Google Login
        gapi.load("auth2", () => {
            const gauth = gapi.auth2.init({
                client_id: "555940496773-dbg28noklm09nmmp7lo1veo1rki4iumu.apps.googleusercontent.com",
                redirect_uri: "${googleLoginRedirectUri}"
            });
            $(".g-signin2").on("click", () => {
                if (grecaptcha.getResponse() === "")
                    alert("로그인 전 reCAPTCHA를 체크해주세요.");
                else gauth.signIn();
            });
        });
        const googleLogin = () => {
            if (grecaptcha.getResponse() === "")
                alert("로그인 전 reCAPTCHA를 체크해주세요.");
            else location.href = "";
        };

        // NAVER Login
        const naverLogin = () => {
            if (grecaptcha.getResponse() === "")
                alert("로그인 전 reCAPTCHA를 체크해주세요.");
            else location.href = "https://nid.naver.com/oauth2.0/authorize?client_id=nGPht0bboCyg0zTVBTx4&redirect_uri=${naverLoginRedirectUri}&response_type=code&state=${naverLoginRedirectUri}";
        };

        // Facebook Login
        FB.login(response => {
            console.log(response);
        });

    </script>
</body>
</html>
