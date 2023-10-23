package com.ecom.shop.member.dao;

import com.ecom.shop.member.dto.MemberDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberDAO {
    int checkID(String id);

    int count();

    int memberJoin(MemberDTO member);
    MemberDTO getMember(MemberDTO member);


    String findID(MemberDTO member);
    String findPW(MemberDTO member);

    List<MemberDTO> listMember();
}
