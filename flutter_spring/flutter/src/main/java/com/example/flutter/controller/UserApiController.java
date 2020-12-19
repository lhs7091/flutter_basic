package com.example.flutter.controller;

import java.util.Map;

import com.example.flutter.dto.ResponseDto;
import com.example.flutter.model.User;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserApiController {

    @GetMapping(value = "/home")
    public String hello(){
        return "<h1>Hello World!!</h1>";
    }

    @PostMapping(value="/aaa")
    public String aaa(){
        return "post request";
    }

    @PostMapping(value = "/post/test")
    public String postTest(String email, String passwd){
        System.out.println(email);
        System.out.println(passwd);
        return "Post Test Success";
    }

    @PostMapping(value = "/flutter/post", produces = "application/json; charset=utf-8")
    public ResponseDto<Integer> save(@RequestBody User result) { // email, passwd
        System.out.println(result);
        System.out.println(result.getEmail());
        System.out.println(result.getPasswd());
        
        return new ResponseDto<Integer>(HttpStatus.OK.value(), 1); // 자바오브젝트를 JSON으로 변환해서 리턴 (Jackson)
    }
}
