package com.app.gen.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/home")
public class HomeController {

    @GetMapping
    public String home() {
        return "Home Controller is working";
    }
    @GetMapping("/test")
    public String homeTest() {
        return "Home Test API is working";
    }
}