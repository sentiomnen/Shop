package com.ecom.shop.product.dto;

import lombok.Data;
import lombok.ToString;

import java.util.Date;

@Data
@ToString
public class ProductDTO {
    // Region Database Columns
    private int no; // Product Number;
    private Date pr_date;

    private String label; // Product Name;
    private String desc;  // Product Description;
    private String image; // Product Image;
    private String path;  // Path of the product image;

    private int stock; // Amount of stock of the product;
    private int price; // Unit price of the product;
    // End Region Database Columns
    // Region Additional Columns
    private int rn;
    // End Region Additional Columns
}
