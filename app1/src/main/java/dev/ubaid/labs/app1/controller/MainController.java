package dev.ubaid.labs.app1.controller;

import java.util.concurrent.TimeUnit;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/main")
public class MainController {
    final Logger logger = LoggerFactory.getLogger(MainController.class);
    @GetMapping
    String helloWorld() throws InterruptedException {
        logger.info("Request hello world");
        Thread.sleep(80 * 1000);
        return "Hello World";
    }
}
