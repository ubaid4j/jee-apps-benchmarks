package dev.ubaid.labs.app1.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/main")
public class MainController {
    @GetMapping
    String helloWorld() {
        return "Hello World";
    }
}
