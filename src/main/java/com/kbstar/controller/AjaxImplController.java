package com.kbstar.controller;

import com.kbstar.dto.Adm;
import com.kbstar.service.AdmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AjaxImplController {

    @Autowired
    AdmService admService;
    @RequestMapping("/checkid")
    public Object checkid(String id) throws Exception {

        int result = 0;
        Adm adm = null;
        try {
            adm = admService.get(id);
        } catch (Exception e) {
            throw new Exception("시스템 장애: ER0005");
        }
        if(adm!=null){
            result = 1;
        }
        return result;
    }
}
