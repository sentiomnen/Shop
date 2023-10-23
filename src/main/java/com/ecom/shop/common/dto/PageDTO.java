package com.ecom.shop.common.dto;

import lombok.Getter;

@Getter
public class PageDTO {
    public static final int ROW_PER_PAGE = 30;
    private int start;
    private int row;

    public void setRow(int i) {
        row = i;
    }

    public int setStart(int page) {
        start = (page - 1)*row;
        return 0;
    }
}
