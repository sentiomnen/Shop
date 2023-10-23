package com.ecom.shop.product.service;

import com.ecom.shop.common.dto.PageDTO;
import com.ecom.shop.product.dto.ProductDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ProductService {
    int count();

    //Region Action methods
    int insert(ProductDTO product);
    int edit(ProductDTO product);
    int delete(int no);

    List<ProductDTO> list(PageDTO page, String sort, int dir );
    ProductDTO getProduct(int no);

    // Region Managing methods
    int addItem(ProductDTO product);

    int editInfo(ProductDTO product);

    int editStock(ProductDTO product);

    int editPrice(ProductDTO product);

    int deleteItem(ProductDTO product);
    //End Region Action methods
}
