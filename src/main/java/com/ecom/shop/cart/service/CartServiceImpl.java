package com.ecom.shop.cart.service;

import com.ecom.shop.cart.dao.CartDAO;
import com.ecom.shop.cart.dto.OrderDTO;
import com.ecom.shop.common.dto.PageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("cartService")
public class CartServiceImpl implements CartService {
    @Autowired
    CartDAO cartDAO;

    public int addCart(OrderDTO order) {
        return cartDAO.addCart(order);
    }

    // Region Cart operations
    @Override
    public List<OrderDTO> list(PageDTO page, String sort, int dir, String id) {
        Map<String, Object> result = new HashMap<>();
        String direction = "ASC";
        if (dir <= 0) direction = "DESC";

        result.put("id", id);
        result.put("page", page);
        result.put("sort", sort);
        result.put("dir", direction);

        List<OrderDTO> cart = cartDAO.getReceipt(result);
        System.out.println(cart);
        return cart;
    }
    // End Region Cart operations
}
