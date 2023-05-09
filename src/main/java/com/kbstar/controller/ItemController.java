package com.kbstar.controller;

import com.kbstar.dto.Item;
import com.kbstar.dto.ItemSearch;
import com.kbstar.service.ItemService;
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
@RequestMapping("/item")
public class ItemController {
    //value는 프레임워크 쓸 것

    String dir = "item/";

    @Value("${uploadimgdir}")
    String imgdir;


    @Autowired
    ItemService itemService;

    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("contents", dir+"add");

        return "index";
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, Item item) throws Exception {
        MultipartFile mf = item.getImg();
        String imgname = mf.getOriginalFilename();
        log.info("---------------------------------------------------------------------------------------------");
        log.info(imgname);
        log.info("---------------------------------------------------------------------------------------------");
        item.setImgname(imgname);
        itemService.register(item);
        FileUploadUtil.saveFile(mf,imgdir);

        return "redirect:/item/all";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception{
        List<Item> list = null;
        list = itemService.get();
        model.addAttribute("ilist", list);
        model.addAttribute("contents", dir+"all");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model,Integer id) throws Exception {
        Item item = null;
        item = itemService.get(id);

        model.addAttribute("gitem", item);
        model.addAttribute("contents", dir+"detail");
        return "index";
    }

    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, Item item) throws Exception{
        MultipartFile mf = item.getImg();
        String imgname = mf.getOriginalFilename();
        if(!imgname.equals("") && imgname!=null){
            item.setImgname(imgname);
            itemService.modify(item);
            FileUploadUtil.saveFile(mf,imgdir);
        } else {
            itemService.modify(item);
        }

        return "redirect:/item/detail?id="+item.getId();
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, Integer id) throws Exception {
        itemService.remove(id);
        return "redirect:/item/all";
    }

    @RequestMapping("/search")
    public String search(Model model, ItemSearch ms) throws Exception {
        List<Item> list = null;
        list = itemService.search(ms);
        model.addAttribute("ms", ms);
        model.addAttribute("ilist", list);
        model.addAttribute("contents", dir+"all");
    return "index";
    }
}
