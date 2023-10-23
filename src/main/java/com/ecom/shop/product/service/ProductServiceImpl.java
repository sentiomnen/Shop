package com.ecom.shop.product.service;

import com.ecom.shop.product.dao.ProductDAO;
import com.ecom.shop.common.dto.PageDTO;
import com.ecom.shop.product.dto.ProductDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service(value = "productService")
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductDAO productDAO;

    @Override
    public int count() {
        return productDAO.count();
    }

    // Region Action methods
    @Override
    public int insert(ProductDTO product) {
        return productDAO.insert(product);
    }
    @Override
    public int edit(ProductDTO product) {
        return productDAO.edit(product);
    }
    @Override
    public int delete(int no) {return productDAO.delete(no);}

    @Override
    public List<ProductDTO> list(PageDTO page, String sort, int dir) {
        Map<String, Object> result = new HashMap<>();
        String direction = "ASC";
        if (dir <= 0) direction = "DESC";

        result.put("page", page);
        result.put("sort", sort);
        result.put("dir", direction);
        return productDAO.listProduct(result);
    }
    @Override
    public ProductDTO getProduct(int no) {
        return productDAO.getProduct(no);
    }
    // End Region Action methods



    // Region Managing methods
    @Override
    public int addItem(ProductDTO product) { return productDAO.addItem(product); }
    @Override
    public int editInfo(ProductDTO product) { return productDAO.editInfo(product); }
    @Override
    public int editStock(ProductDTO product) { return productDAO.editStock(product); }
    @Override
    public int editPrice(ProductDTO product) { return productDAO.editPrice(product); }
    @Override
    public int deleteItem(ProductDTO product) { return productDAO.deleteItem(product); }
    // End Region Managing methods
}
