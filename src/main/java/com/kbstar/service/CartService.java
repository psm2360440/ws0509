package com.kbstar.service;

import com.kbstar.dto.Cart;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.CartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService implements KBService<Integer, Cart> {

    @Autowired
    CartMapper mapper;

    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param cart
     */
    @Override
    public void register(Cart cart) throws Exception {
        mapper.insert(cart);
    }

    @Override
    public void remove(Integer i) throws Exception {
        mapper.delete(i);
    }

    @Override
    public void modify(Cart cart) throws Exception {
        mapper.update(cart);
    }

    @Override
    public Cart get(Integer i) throws Exception {
        return mapper.select(i);
    }

    public List<Cart> getMyCart(String cid) throws Exception{
        return mapper.getmycart(cid);
    }

    @Override
    public List<Cart> get() throws Exception {
        return mapper.selectall();
    }

    public Integer countCart() throws Exception{
        return mapper.countCart();
    }

    public Integer countPrice() throws Exception{
        return mapper.countPrice();
    }

}
