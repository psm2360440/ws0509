package com.kbstar.controller;

import com.kbstar.dto.Adm;
import com.kbstar.service.AdmService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;
@Slf4j
@Controller
public class MainController {

    @Value("${adminserver}")
    String adminserver;

    @RequestMapping("/")
    public String main(Model model){
        model.addAttribute("adminserver", adminserver);
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model){
        model.addAttribute("contents", "login");
        return "index";
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, String id, String pwd, HttpSession session) throws Exception {
        Adm adm = null;
        String nextPage = "loginfail";
        try {
            adm = admService.get(id);
            //앤퍼샌트두개: 앞애서 실패하면 뒷 부분을 굳이 실행하지 않는다.
            if(adm != null && encoder.matches(pwd,adm.getPwd())){
                nextPage = "loginok";
                // max시간이 지나면 자동으로 로그아웃
                //session에 담은 정보도 jsp화면단에서 $사인으로 접근 가능하다
                session.setMaxInactiveInterval(1000000);
                session.setAttribute("loginadm", adm);
            }
        } catch (Exception e) {
            throw new Exception("시스템 장애입니다. 잠시 후 다시 로그인 하십시오!");
        }
        model.addAttribute("contents", nextPage);
        return "index";
    }

    @RequestMapping("/logoutimpl")
    public String logout(Model model, HttpSession session) throws Exception {
        if(session != null){
            session.invalidate();
        }
        return "redirect:/";
    }

    @RequestMapping("/register")
    public String register(Model model){
        model.addAttribute("contents", "register");
        return "index";
    }

    @Autowired
    private BCryptPasswordEncoder encoder;
    @Autowired
    AdmService admService;
    @RequestMapping("/registerimpl")
    public String registerimpl(Model model, Adm adm, HttpSession session) throws Exception {
        try {
            //화면에서 입력한 패스워드를 가져와 그것을 암호화 한 후, adm 객체에 넣는다
            adm.setPwd(encoder.encode(adm.getPwd()));
            admService.register(adm);
            session.setAttribute("loginadm", adm);
        } catch (Exception e) {
            throw new Exception("시스템 장애: ER0006");
        }
        model.addAttribute("loginadm", adm);
        model.addAttribute("contents", "registerok");
        return "index";
    }

    @RequestMapping("/adminfo")
    public String adminfo(Model model, String id) throws Exception {
        Adm adm = null;
        try {
            adm = admService.get(id);
        } catch (Exception e) {
            throw new Exception("시스템장애");
        }
        model.addAttribute("adminfo", adm);
        model.addAttribute("contents", "adminfo");
        return "index";
    }

    @RequestMapping("/adminfoimpl")
    public String adminfoimpl(Model model, Adm adm) throws Exception {

        try {
            adm.setPwd(encoder.encode(adm.getPwd()));
            admService.modify(adm);
        } catch (Exception e) {
            throw new Exception("시스템장애");
        }

        return "redirect:/adminfo?id="+adm.getId();
    }

    @RequestMapping("/charts")
    public String charts(Model model){
        model.addAttribute("contents", "charts");
        return "index";
    }

    @RequestMapping("/livechart")
    public String livechart(Model model){
        model.addAttribute("adminserver", adminserver);
        model.addAttribute("contents", "livechart");
        return "index";
    }

    @RequestMapping("/dashboard")
    public String dashboard(Model model){
        model.addAttribute("contents", "dashboard");
        return "index";
    }

    @RequestMapping("/websocket")
    public String websocket(Model model){
        model.addAttribute("adminserver", adminserver);
        model.addAttribute("contents", "websocket");
        return "index";
    }


//    @RequestMapping("/tables")
//    public String tables(Model model){
//        List<Item> list = new ArrayList<>();
//
//        list.add(new Item("Tiger Nixon", "System Architect", "Edinburgh", 61, new Date(111,4,25), 320800 ));
//        list.add(new Item("Garrett Winters", "Accountant", "Tokyo", 63, new Date(111,7,25), 170750 ));
//        list.add(new Item("Ashton Cox", "Junior Technical Author", "San Francisco", 66, new Date(109,1,12), 86000 ));
//        list.add(new Item("Cedric Kelly", "Senior Javascript Developer", "Edinburgh", 22, new Date(112,3,29), 433060 ));
//        list.add(new Item("Airi Satou", "Accountant", "Tokyo", 33, new Date(108,11,28), 162700 ));
//        list.add(new Item("Brielle Williamson", "Integration Specialist", "New York", 61, new Date(112,11,02), 372000 ));
//        list.add(new Item("Herrod Chandler", "Sales Assistant", "San Francisco", 59, new Date(112,7,06), 137500 ));
//        list.add(new Item("Rhona Davidson", "Integration Specialist", "Tokyo", 55, new Date(110,10,14), 327900 ));
//        list.add(new Item("Colleen Hurst", "Javascript Developer", "San Francisco", 39, new Date(109,9,15), 205500 ));
//        list.add(new Item("Sonya Frost", "JSoftware Engineer", "Edinburgh", 23, new Date(108,10,13), 103600 ));
//        list.add(new Item("Jena Gaines", "Office Manager", "London", 30, new Date(108,10,19), 90560 ));
//        list.add(new Item("Quinn Flynn", "Support Lead", "Edinburgh", 22, new Date(113,3,03), 342000 ));
//        list.add(new Item("Charde Marshall", "Regional Director", "San Francisco", 36, new Date(108,10,16), 470600 ));
//        list.add(new Item("Haley Kennedy", "Senior Marketing Designer", "London", 43, new Date(112,11,18), 313500 ));
//        list.add(new Item("Tatyana Fitzpatrick", "Regional Director", "London", 19, new Date(110,3,17), 385750 ));
//        list.add(new Item("Michael Silva", "Marketing Designer", "London", 22, new Date(112,11,27), 198500 ));
//        list.add(new Item("Paul Byrd", "Chief Financial Officer (CFO)", "New York", 64, new Date(110,6,01), 725000 ));
//        list.add(new Item("Gloria Little", "Systems Administrator", "New York", 59, new Date(109,4,10), 237500));
//        list.add(new Item("Bradley Greer", "Software Engineer", "London", 41, new Date(112,10,13), 132000 ));
//        list.add(new Item("Dai Rios", "Personnel Lead", "Edinburgh", 35, new Date(112,2,26), 217500 ));
//
//        model.addAttribute("allitem", list);
//
//        model.addAttribute("contents", "tables");
//        return "index";
//    }

}
