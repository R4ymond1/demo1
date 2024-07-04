package com.example.demo.test;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class Test {


    @GetMapping("/hello")
    public String hello() {
//        stringRedisTemplate.opsForValue().set("k1", "v1");
//        String k1 = stringRedisTemplate.opsForValue().get("k1");
//        System.err.println("【k1】= " + k1);
        return "Hello,From Github!";
    }
}
