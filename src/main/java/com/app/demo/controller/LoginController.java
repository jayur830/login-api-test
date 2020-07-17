package com.app.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/login_action")
public class LoginController {
    private String kakaoAccessToken = null;
    private String googleAccessToken = null;
    private String naverAccessToken = null;
    private String facebookAccessToken = null;

    private String currentLoginState = null;

    @GetMapping("/kakao")
    public String kakaoLoginAction(@RequestParam("code") final String accessToken, HttpServletRequest request) {
        this.kakaoAccessToken = accessToken;
        request.getSession().setAttribute("currentLoginState", "kakao");
        return "redirect:/";
    }

    @GetMapping("/google")
    public String googleLoginAction(HttpServletRequest request) {
        request.getSession().setAttribute("currentLoginState", "google");
        return "redirect:/";
    }

    @GetMapping("/naver")
    public String naverLoginAction(HttpServletRequest request) {
        request.getSession().setAttribute("currentLoginState", "naver");
        return "redirect:/";
    }

    @GetMapping("/facebook")
    public String facebookLoginAction(HttpServletRequest request) {
        request.getSession().setAttribute("currentLoginState", "facebook");
        return "redirect:/";
    }

    @PostMapping("/set_access_token")
    @ResponseBody
    public String setAccessToken(@RequestParam("hash_str") final String hashStr, HttpServletRequest request) {
        String currentLoginState = (String) request.getSession().getAttribute("currentLoginState");
        if (currentLoginState.equals("google"))
            this.googleAccessToken = hashStr.split("&")[0].split("=")[1];
        else if (currentLoginState.equals("naver"))
            this.naverAccessToken = hashStr.split("&")[0].split("=")[1];

        System.out.println("kakaoAccessToken: " + this.kakaoAccessToken);
        System.out.println("googleAccessToken: " + this.googleAccessToken);
        System.out.println("naverAccessToken: " + this.naverAccessToken);
        System.out.println("facebookAccessToken: " + this.facebookAccessToken);

        return String.format("{ \"isSignedIn\": %s }", currentLoginState.equals(null) ? "false" : "true");
    }
}
