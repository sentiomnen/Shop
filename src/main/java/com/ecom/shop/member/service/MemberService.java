package com.ecom.shop.member.service;

import com.ecom.shop.member.dto.MemberDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface MemberService{

    int checkID(String id);

    int memberJoin(MemberDTO member);
    MemberDTO getMember(MemberDTO member);

    String findID(MemberDTO member);
    String findPW(MemberDTO member);

    List<MemberDTO> listMember();
    int count();
}
