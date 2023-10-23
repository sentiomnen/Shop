package com.ecom.shop.cart.dto;

import lombok.Data;
import lombok.ToString;

import java.sql.Date;

@Data
@ToString
public class OrderDTO {
    // Region Database Columns
    private int no;    // Order Number;
    private String id; // Member ID that ordered;
    private String progress; // Order Status;
    private Date reddate;

    private int ref;      // Product number of ordered product;
    private int quantity; // Quantity of ordered product
    // End Region Database Columns
    // Region Additional Columns
    private int price; // Price of ordered product
    private int total; // Total price of ordered product
    private String label; // Label of ordered product
    // End Region Additional Columns
}
