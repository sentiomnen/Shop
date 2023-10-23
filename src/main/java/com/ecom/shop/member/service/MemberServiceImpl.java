package com.ecom.shop.member.service;

import com.ecom.shop.member.dao.MemberDAO;
import com.ecom.shop.member.dto.MemberDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
    @Autowired
    MemberDAO memberDAO;

    @Override
    public int checkID(String id) {
        return memberDAO.checkID(id);
    }


    @Override
    public int memberJoin(MemberDTO member) {
        return memberDAO.memberJoin(member);
    }
    @Override
    public MemberDTO getMember(MemberDTO member) {
        return memberDAO.getMember(member);
    }

    //= Find Information =================================================================
    @Override
    public String findID(MemberDTO member) {
        return memberDAO.findID(member);
    }
    @Override
    public String findPW(MemberDTO member) {
        return memberDAO.findPW(member);
    }


    @Override
    public List<MemberDTO> listMember() {
        return memberDAO.listMember();
    }

    @Override
    public int count() {
        return memberDAO.count();
    }
}
