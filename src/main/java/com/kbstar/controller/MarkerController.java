package com.kbstar.controller;



import com.kbstar.dto.Marker;
import com.kbstar.dto.MarkerSearch;
import com.kbstar.service.MarkerService;
import com.kbstar.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/marker")
public class MarkerController {

    String dir = "marker/";

    @Value("${uploadimgdir}")
    String imgdir;


    @Autowired
    MarkerService markerService;

    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("contents", dir+"add");

        return "index";
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, Marker marker) throws Exception {
        MultipartFile mf = marker.getImgname();
        String img = mf.getOriginalFilename();
        marker.setImg(img);
        markerService.register(marker);
        FileUploadUtil.saveFile(mf,imgdir);

        return "redirect:/marker/all";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Marker> list = null;
        list = markerService.get();
        log.info("----------------------------------------------------------------------------------------------------");
        log.info(list.toString());
        log.info("----------------------------------------------------------------------------------------------------");
        model.addAttribute("mlist", list);
        model.addAttribute("contents", dir+"all");

        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model,Integer id) throws Exception {
        Marker marker = null;
        marker = markerService.get(id);

        model.addAttribute("gmarker", marker);
        model.addAttribute("contents", dir+"detail");
        return "index";
    }

    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, Marker marker) throws Exception{
        MultipartFile mf = marker.getImgname();
        String img = mf.getOriginalFilename();
        if(!img.equals("") && img!=null){
            marker.setImg(img);
            markerService.modify(marker);
            FileUploadUtil.saveFile(mf,imgdir);
        } else {
            markerService.modify(marker);
        }

        return "redirect:/marker/detail?id="+marker.getId();
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, Integer id) throws Exception {
        markerService.remove(id);
        return "redirect:/marker/all";
    }

    @RequestMapping("/search")
    public String search(Model model, MarkerSearch ms) throws Exception {

        List<Marker> list = markerService.search(ms);
        model.addAttribute("ms",ms);
        model.addAttribute("mlist",list);
        model.addAttribute("contents",dir+"all");
        return "index";
    }

}
