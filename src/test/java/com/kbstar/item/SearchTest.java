package com.kbstar.item;

import com.kbstar.dto.Item;
import com.kbstar.dto.ItemSearch;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
class SearchTest {

    @Autowired
    ItemService service;
    @Test
    void contextLoads() {
        ItemSearch ms = new ItemSearch("반",1000,"2023/04/25","2023/05/02");


        List<Item> list = null;

        try {
            list =  service.search(ms);
        } catch (Exception e) {
                log.info("시스템 장애입니다.");
                e.printStackTrace();
            }

//            log.info("register error.......");
//            e.printStackTrace();
        }
    }

