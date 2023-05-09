package com.kbstar.marker;

import com.kbstar.dto.Marker;
import com.kbstar.service.MarkerService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTest {
    @Autowired
    MarkerService service;

    @Test
    void contextLoads() throws Exception {
        Marker obj = new Marker(110,"불족", "http://www.naver.com", 37.635327, 127.010507, "yang.jpg", "S");

        try {
            service.modify(obj);
            log.info("수정 정상");
        } catch (Exception e) {
            log.info("수정 에러");
            e.printStackTrace();
        }
    }
}

