package com.ecom.shop.cart.dao;

import com.ecom.shop.cart.dto.OrderDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CartDAO {
    // Region Cart operations
    List<OrderDTO> getReceipt(Map<String, Object> params);
    int insertReceipt(OrderDTO order);
    int updateReceipt(OrderDTO order);
    int deleteReceipt(OrderDTO order);
    int orderReceipt( OrderDTO order);
    // End Region Cart operations



    int addCart(OrderDTO order);


    int insert(OrderDTO product);
    int edit(OrderDTO product);
    int delete(int no);

    List<OrderDTO> getFromID(Map<String, Object> sort);
    OrderDTO getProduct(int no);
    // End Region Query
    // Region small query
    int count();
    // End Region small query
}
