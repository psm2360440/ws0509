package com.kbstar.controller;

import com.kbstar.dto.Sales;
import com.kbstar.service.SalesService;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;
import java.util.List;

@Slf4j
@RestController


public class ChartController {

    @Autowired
    SalesService salesService;

    @RequestMapping("/mainchart1")
    public Object mainchart1() throws Exception{
        List<Integer> Msales = salesService.Mtotal();
        List<Integer> Fsales = salesService.Ftotal();

        JSONObject jo = new JSONObject();

        jo.put("Msales", Msales);
        jo.put("Fsales", Fsales);
        return jo;
    }



    @RequestMapping("/mainchart2")
    public Object mainchart2() throws Exception{
        List<Integer> Fsales = salesService.Ftotal();
        JSONArray ja2 = new JSONArray();

        for (int i = 0; i < Fsales.size(); i++) {
            JSONArray ja = new JSONArray();
            JSONObject jo = new JSONObject();
            ja.add( i+1+"월");
            ja.add(Fsales.get(i));
            ja2.add(ja);
        }
        return ja2;
    }

    @RequestMapping("/mainchart3")
    public Object mainchart3() throws Exception{
        List<Integer> Msales = salesService.Mtotal();
        List<Integer> Fsales = salesService.Ftotal();
        List<Integer> Avg = salesService.AverageByGender();
        Integer Msum = salesService.Msum();
        Integer Fsum = salesService.Fsum();

        JSONObject jo = new JSONObject();
        jo.put("Msales", Msales);
        jo.put("Fsales", Fsales);
        jo.put("Avg", Avg);
        jo.put("Msum", Msum);
        jo.put("Fsum", Fsum);

        return jo;
    }

    @RequestMapping("/mainchart4")
    public Object mainchart4() throws Exception{
        List<Integer> Fsales = salesService.Ftotal();
        JSONArray ja = new JSONArray();

        for (int i = 0; i < Fsales.size(); i++) {
            JSONObject jo = new JSONObject();
            jo.put("value", Fsales.get(i));
            ja.add(jo);
        }

        List<Integer> Msales = salesService.Mtotal();
        JSONArray ja2 = new JSONArray();

        for (int i = 0; i < Msales.size(); i++) {
            JSONObject jo = new JSONObject();
            jo.put("value", Msales.get(i));
            ja2.add(jo);
        }

        JSONObject joFinal = new JSONObject();
        joFinal.put("Msales", ja2);
        joFinal.put("Fsales", ja);

        return joFinal;
    }

    @RequestMapping("/mainchart5")
    public Object mainchart5() throws Exception{
        List<Integer> Fsales = salesService.Ftotal();
        JSONArray ja2 = new JSONArray();

        for (int i = 0; i < Fsales.size(); i++) {
            JSONArray ja = new JSONArray();
            int n = i + 1;
            int f = Fsales.get(i)/10000;
            ja.add(n);
            ja.add(f);
            ja.add(f);
            ja2.add(ja);
        }

        List<Integer> Msales = salesService.Mtotal();
        JSONArray ja3 = new JSONArray();

        for (int i = 0; i < Msales.size(); i++) {
            JSONArray ja = new JSONArray();
            int n = i+1;
            int m = Msales.get(i)/10000;
            ja.add(n);
            ja.add(m);
            ja.add(m);
            ja3.add(ja);
        }

        JSONObject jo = new JSONObject();
        jo.put("Msales", ja3);
        jo.put("Fsales", ja2);

        return jo;
    }

    @RequestMapping("/mainchart6")
    public Object mainchart6() throws Exception{
        List<Integer> Fsales = salesService.Ftotal();
        JSONArray ja = new JSONArray();

        for (int i:Fsales) {
            ja.add(i);
        }

        List<Integer> Msales = salesService.Mtotal();
        JSONArray ja2 = new JSONArray();

        for (int i:Msales) {
            ja2.add(i);
        }

        JSONArray ja3 = new JSONArray();
        for(int i = 1; i <= 8; i++){
            ja3.add(i+"월");
        }

        Integer Msum = salesService.Msum();
        Integer Fsum = salesService.Fsum();

        JSONObject jo = new JSONObject();
        jo.put("Fsales", ja);
        jo.put("Msales", ja2);
        jo.put("cate", ja3);
        jo.put("Msum", Msum);
        jo.put("Fsum",Fsum);

        return jo;
    }

    @RequestMapping("/mainchart7")
    public Object mainchart7() throws Exception{
        List<Integer> Msales = salesService.Mtotal();
        List<Integer> Fsales = salesService.Ftotal();
        JSONObject jo = new JSONObject();

        jo.put("Msales", Msales);
        jo.put("Fsales", Fsales);

        return jo;
    }

}
