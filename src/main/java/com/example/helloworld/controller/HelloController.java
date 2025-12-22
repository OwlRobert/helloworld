package com.example.helloworld.controller;

import io.swagger.v3.oas.annotations.Operation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @Operation(summary = "Hello World API")
    @GetMapping("/hello")
    public String hello() {
        return "Hello World from Spring Boot!, 2025/12/22";
    }

    @GetMapping("/health")
public String health() {
    return "OK";
}
}
