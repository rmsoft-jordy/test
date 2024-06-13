package com.example.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {

    @GetMapping("/hello")
    public String hello() {
        return "hello"; // "hello"라는 문자열은 ViewResolver에 의해 해석되어 "/WEB-INF/views/hello.jsp"를 찾습니다.
    }
}
