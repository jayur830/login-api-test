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
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>
<body>
    <!-- Kakao Login -->
    <a id="kakao-login" href="javascript:Kakao.Auth.authorize({ redirectUri: '${kakaoLoginRedirectUri}' });">
        <img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="250" alt="카카오 계정으로 로그인합니다." />
    </a>

    <!-- Google Login -->
    <div class="g-signin2" data-onsuccess="onSignIn"></div>

    <!-- NAVER Login -->
    <div id="naverIdLogin"></div>

    <script>
        Kakao.init("1c3115b6d9e55307b98cca908fa183ec");
        new naver.LoginWithNaverId({
            clientId: "nGPht0bboCyg0zTVBTx4",
            callbackUrl: "${naverLoginRedirectUri}",
            isPopup: false,
            loginButton: {
                color: "green",
                type: 3,
                height: 60
            }
        }).init();
    </script>
</body>
</html>