package com.ecom.shop.product.dao;

import com.ecom.shop.product.dto.ProductDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ProductDAO {
    int insert(ProductDTO product);
    int edit(ProductDTO product);
    int delete(int no);

    int count();

    List<ProductDTO> listProduct(Map<String, Object> sort);
    ProductDTO getProduct(int no);

    // Region Managing methods
    int addItem(   ProductDTO product);
    int editInfo(  ProductDTO product);
    int editStock( ProductDTO product);
    int editPrice( ProductDTO product);
    int deleteItem(ProductDTO product);
    // End Region Managing methods
}
