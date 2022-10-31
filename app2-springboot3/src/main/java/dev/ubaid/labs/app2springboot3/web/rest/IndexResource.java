package dev.ubaid.labs.app2springboot3.web.rest;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class IndexResource {

    private static final Logger logger = LoggerFactory.getLogger(IndexResource.class);
    private static final AtomicInteger counter = new AtomicInteger(1);
    private static final long TWO_MIN = TimeUnit.MINUTES.toMillis(2);

    @GetMapping("/")
    public ResponseEntity<String> helloWorld() throws Exception {
        long requestNumber = counter.getAndIncrement();
        logger.info("Upcoming Request #{} ", requestNumber);
        Thread.sleep(TWO_MIN);
        logger.info("Request #{} entertained", requestNumber);
        return ResponseEntity.ok("Hello From Spring 6");
    }
}
