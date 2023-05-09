package com.kbstar.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;

@Slf4j
@Controller
@RequestMapping("/tables")
public class TableController {


//        @RequestMapping("/tables")
//    public String tables(Model model){
//        List<tables> list = new ArrayList<>();
//
//        list.add(new tables("Tiger Nixon", "System Architect", "Edinburgh", 61, new Date(111,4,25), 320800 ));
//        list.add(new tables("Garrett Winters", "Accountant", "Tokyo", 63, new Date(111,7,25), 170750 ));
//        list.add(new tables("Ashton Cox", "Junior Technical Author", "San Francisco", 66, new Date(109,1,12), 86000 ));
//        list.add(new tables("Cedric Kelly", "Senior Javascript Developer", "Edinburgh", 22, new Date(112,3,29), 433060 ));
//        list.add(new tables("Airi Satou", "Accountant", "Tokyo", 33, new Date(108,11,28), 162700 ));
//        list.add(new tables("Brielle Williamson", "Integration Specialist", "New York", 61, new Date(112,11,02), 372000 ));
//        list.add(new tables("Herrod Chandler", "Sales Assistant", "San Francisco", 59, new Date(112,7,06), 137500 ));
//        list.add(new tables("Rhona Davidson", "Integration Specialist", "Tokyo", 55, new Date(110,10,14), 327900 ));
//        list.add(new tables("Colleen Hurst", "Javascript Developer", "San Francisco", 39, new Date(109,9,15), 205500 ));
//        list.add(new tables("Sonya Frost", "JSoftware Engineer", "Edinburgh", 23, new Date(108,10,13), 103600 ));
//        list.add(new tables("Jena Gaines", "Office Manager", "London", 30, new Date(108,10,19), 90560 ));
//        list.add(new tables("Quinn Flynn", "Support Lead", "Edinburgh", 22, new Date(113,3,03), 342000 ));
//        list.add(new tables("Charde Marshall", "Regional Director", "San Francisco", 36, new Date(108,10,16), 470600 ));
//        list.add(new tables("Haley Kennedy", "Senior Marketing Designer", "London", 43, new Date(112,11,18), 313500 ));
//        list.add(new tables("Tatyana Fitzpatrick", "Regional Director", "London", 19, new Date(110,3,17), 385750 ));
//        list.add(new tables("Michael Silva", "Marketing Designer", "London", 22, new Date(112,11,27), 198500 ));
//        list.add(new tables("Paul Byrd", "Chief Financial Officer (CFO)", "New York", 64, new Date(110,6,01), 725000 ));
//        list.add(new tables("Gloria Little", "Systems Administrator", "New York", 59, new Date(109,4,10), 237500));
//        list.add(new tables("Bradley Greer", "Software Engineer", "London", 41, new Date(112,10,13), 132000 ));
//        list.add(new tables("Dai Rios", "Personnel Lead", "Edinburgh", 35, new Date(112,2,26), 217500 ));
//
//        model.addAttribute("allitems", list);
//
//        model.addAttribute("contents", "tables");
//        return "index";
//    }
//

}
