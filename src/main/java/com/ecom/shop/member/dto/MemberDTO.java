package com.ecom.shop.member.dto;

import lombok.Data;
import lombok.ToString;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.web.context.WebApplicationContext;

import java.util.Date;

@Data
@Scope( value= WebApplicationContext.SCOPE_SESSION,
        proxyMode = ScopedProxyMode.TARGET_CLASS)
@ToString
public class MemberDTO {
    private String id, password, name;
    private String email;
    private int phone;
    private String zipcode, addr, addr2;
    private String job;
    private String role;
    private Date reg_date;
}
