package com.kbstar.controller;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@Slf4j
@RestController

public class DashboardController {

    @RequestMapping("/custom1")
    public Object custom1() {

        JSONObject jo = new JSONObject();
        JSONArray jaCnt = new JSONArray();
        JSONArray jaCnt2 = new JSONArray();
        JSONArray jaCnt3 = new JSONArray();


        for (int i = 1; i <= 3; i++) {
            Random r = new Random();
            int cnt = r.nextInt(20) + 1;
            jaCnt.add(cnt);
        }

        for (int i = 1; i <= 3; i++) {
            Random r = new Random();
            int cnt = r.nextInt(20) + 1;
            jaCnt2.add(cnt);
        }

        for (int i = 1; i <= 3; i++) {
            Random r = new Random();
            int cnt = r.nextInt(20) + 1;
            jaCnt3.add(cnt);
        }

        JSONArray jaYear = new JSONArray();
        for (int i = 2021; i <= 2023; i++) {
            jaYear.add(i);
        }
        jo.put("category", jaYear);
        jo.put("datas", jaCnt);
        jo.put("datas2", jaCnt2);
        jo.put("datas3", jaCnt3);

        return jo;
    }

    @RequestMapping("/custom2")
    public Object custom2() {
        JSONObject jo = new JSONObject();
        JSONArray ja1 = new JSONArray();
        JSONArray ja2 = new JSONArray();
        JSONArray ja3 = new JSONArray();
        JSONArray ja4 = new JSONArray();


        for(int i = 1; i <= 5; i++){
            Random r = new Random();
            int num = r.nextInt(500)+251;
            ja1.add(num);
        }

        for(int i = 1; i <= 5; i++){
            Random r = new Random();
            int num = r.nextInt(500)+251;
            ja2.add(num);
        }

        for(int i = 1; i <= 5; i++){
            Random r = new Random();
            int num = r.nextInt(500)+251;
            ja3.add(num);
        }

        for(int i = 1; i <= 5; i++){
            Random r = new Random();
            int num = r.nextInt(500)+251;
            ja4.add(num);
        }

        jo.put("first", ja1);
        jo.put("second", ja2);
        jo.put("third", ja3);
        jo.put("fourth", ja4);


        return jo;
    }

    @RequestMapping("/custom3")
    public Object custom3() {
        JSONArray ja = new JSONArray();
        for (int i = 1; i <= 5; i++) {
            Random r = new Random();
            int num = r.nextInt(5000) + 1000;
            JSONArray jadata = new JSONArray();
            jadata.add("data:" + num);
            jadata.add(num);
            ja.add(jadata);
        }
        return ja;
    }

}
