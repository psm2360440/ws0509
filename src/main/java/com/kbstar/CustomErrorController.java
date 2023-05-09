package com.kbstar;

import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

//스프링컨테이너에서 예외사항이 발생하면 동작
@ControllerAdvice
public class CustomErrorController {
    @ExceptionHandler(Exception.class)
    public String except(Exception e, Model model){
        model.addAttribute("msg",e.getMessage());
        model.addAttribute("contents","error/error_page1");
        return "index";
    }
}