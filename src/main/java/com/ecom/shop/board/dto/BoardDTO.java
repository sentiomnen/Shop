package com.ecom.shop.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.web.context.WebApplicationContext;

import java.util.Date;

@Getter
@Setter
@Scope( value= WebApplicationContext.SCOPE_SESSION,
        proxyMode = ScopedProxyMode.TARGET_CLASS)
@ToString
public class BoardDTO{
    private int rn;
    private int no, ref, step, level;
    private String title, content, author, password, ip;
    private int views;
    private Date regdate;
}
