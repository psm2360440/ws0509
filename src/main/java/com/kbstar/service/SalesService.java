package com.kbstar.service;

import com.kbstar.dto.Sales;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.SalesMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class SalesService implements KBService<String, Sales> {
    /**
     * 등록 및 가입 진행
     * argument : Object
     * return : null
     *
     * @param sales
     */
@Autowired
    SalesMapper mapper;
    @Override
    public void register(Sales sales) throws Exception {
        mapper.insert(sales);
    }

    @Override
    public void remove(String s) throws Exception {

    }

    @Override
    public void modify(Sales sales) throws Exception {

    }

    @Override
    public Sales get(String s) throws Exception {
        return null;
    }

    @Override
    public List<Sales> get() throws Exception {
        return mapper.selectall();
    }

    public List<Integer> Mtotal() throws Exception{
        return mapper.Mtotal();
    }

    public List<Integer> Ftotal() throws Exception{
        return mapper.Ftotal();
    }

    public Integer Msum() throws Exception {
        return mapper.Msum();
    }

    public Integer Fsum() throws Exception {
        return mapper.Fsum();
    }

    public List<Integer> AverageByGender() throws Exception {
        return mapper.AverageByGender();
    }
}
