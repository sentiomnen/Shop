package com.ecom.shop.cart.service;

import com.ecom.shop.cart.dto.OrderDTO;
import com.ecom.shop.common.dto.PageDTO;

import java.util.List;

public interface CartService {
    int addCart(OrderDTO order);

    List<OrderDTO> list(PageDTO page, String sort, int dir, String id);
}
