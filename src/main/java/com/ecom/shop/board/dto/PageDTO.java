package com.ecom.shop.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {
    public static final int ROW_PER_PAGE = 15;
    private int start, end;
}