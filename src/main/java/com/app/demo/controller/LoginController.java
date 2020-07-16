package com.app.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/login_action")
public class LoginController {
    private String kakaoAccessToken = null;
    private String googleAccessToken = null;
    private String naverAccessToken = null;

    private String currentLoginState = null;

    @GetMapping("/kakao")
    public String kakaoLoginAction(@RequestParam("code") final String accessToken) {
        this.kakaoAccessToken = accessToken;
        return "redirect:/";
    }

    @GetMapping("/google")
    public String googleLoginAction(Object object) {
        this.currentLoginState = "google";
        return "redirect:/";
    }

    @GetMapping("/naver")
    public String naverLoginAction(Object object) {
        this.currentLoginState = "naver";
        return "redirect:/";
    }

    @PostMapping("/set_access_token")
    @ResponseBody
    public void setAccessToken(@RequestParam("hash_str") final String hashStr) {
        switch (this.currentLoginState) {
            case "google":
                this.googleAccessToken = hashStr.split("&")[1].split("=")[1];
                break;
            case "naver":
                this.naverAccessToken = hashStr.split("&")[0].split("=")[1];
                break;
        }
        this.currentLoginState = null;

        System.out.println("kakaoAccessToken: " + this.kakaoAccessToken);
        System.out.println("googleAccessToken: " + this.googleAccessToken);
        System.out.println("naverAccessToken: " + this.naverAccessToken    );
    }
}
