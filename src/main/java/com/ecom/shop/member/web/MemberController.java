package com.ecom.shop.member.web;

import com.ecom.shop.board.dto.PageDTO;
import com.ecom.shop.member.dto.MemberDTO;
import com.ecom.shop.member.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    MemberService memberService;

    @RequestMapping
    public String member(HttpServletRequest req, HttpServletResponse resp,
                         Model model, MemberDTO member) {
        return "/member/dashboard";
    }
    @RequestMapping("/login")
    public String memberLogin(HttpServletRequest req, HttpServletResponse resp,
                              Model model, MemberDTO member) {
        HttpSession session = req.getSession();
        MemberDTO ssKey = (MemberDTO) session.getAttribute("ssKey");
        return "/member/login";
    }

    @RequestMapping("/admin")
    public String admin(HttpServletRequest request, HttpServletResponse response,
                        Model model, MemberDTO member) {
        String url = "member/management";
        HttpSession session = request.getSession();
        try {
            MemberDTO ssKey = (MemberDTO) session.getAttribute("ssKey");
            if (ssKey.getRole().equals("admin")) {
                List<MemberDTO> memberList = memberService.listMember();

                int pageCount  = memberService.count();
                int pageAmount = pageCount/PageDTO.ROW_PER_PAGE + 1;
                model.addAttribute("pageUnit",   PageDTO.ROW_PER_PAGE);
                model.addAttribute("pageCount",  pageCount);
                model.addAttribute("pageAmount", pageAmount);
                model.addAttribute("memberList", memberList);
            }
        } catch (Exception e) {
            url = "redirect:/";
        }
        return url;
    }

    @RequestMapping("/view")
    public String view(HttpServletRequest req, HttpServletResponse resp,
                             Model model, MemberDTO member) {
        return "member/view";
    }
    @RequestMapping("/find")
    public String findMember(HttpServletRequest req, HttpServletResponse resp,
                             Model model, MemberDTO member) {
        HttpSession session = req.getSession();
        session.invalidate();
        return "member/find";
    }

    // Region Action methods
    @PostMapping("/login.do")
    @ResponseBody
    public String doLogin(HttpServletRequest req, HttpServletResponse resp,
                          Model model, MemberDTO member) throws Exception {
        String result = "failed";
        // Session Info - User info
        HttpSession session = req.getSession();
        MemberDTO ssKey = memberService.getMember(member);
        System.out.print("Login attempt: ");
        System.out.println(ssKey);
        if (ssKey != null) {
            result = "success";
            session.setAttribute("ssKey", ssKey);
            System.out.println("Successfully logged in");
        }
        return result;
    }
    @RequestMapping("/logout.do")
    public String doLogout(HttpServletRequest req, HttpServletResponse resp,
                          Model model, MemberDTO member) {
        HttpSession session = req.getSession();
        session.invalidate();
        System.out.println("Successfully logged out");
        return "redirect:/";
    }
    @RequestMapping("/register.do")
    public String doRegister(HttpServletRequest req, HttpServletResponse resp,
                           Model model, MemberDTO member) {
        int r = memberService.memberJoin(member);
        System.out.println("Successfully registered");
        return "redirect:/";
    }
    @PostMapping("/find-id.do")
    @ResponseBody
    public String findID(HttpServletRequest req, HttpServletResponse resp,
                         Model model, MemberDTO member) {
        String id = memberService.findID(member);
        return id;
    }
    @PostMapping("/find-pw.do")
    @ResponseBody
    public String findPW(HttpServletRequest req, HttpServletResponse resp,
                         Model model, MemberDTO member) {
        String pw = memberService.findPW(member);
        return pw;
    }
    // End Region Action methods
    // Region REST API
    @PostMapping("/check-id")
    @ResponseBody
    public int checkID(HttpServletRequest req, HttpServletResponse resp,
                       Model model, MemberDTO member) {
        memberService.checkID(member.getId());
        return 0;
    }
    @PostMapping("/check-role")
    @ResponseBody
    public String checkRole(HttpServletRequest req, HttpServletResponse resp,
                         Model model, MemberDTO member) {
        String role = "anonymous";
        HttpSession session = req.getSession();
        MemberDTO ssKey = (MemberDTO) session.getAttribute("ssKey");
        if (ssKey != null) role = ssKey.getRole();
        return role;
    }
    @PostMapping("/get-id")
    @ResponseBody
    public String getID(HttpServletRequest req, HttpServletResponse resp,
                            Model model, MemberDTO member) {
        String id = null;
        HttpSession session = req.getSession();
        MemberDTO ssKey = (MemberDTO) session.getAttribute("ssKey");
        if (ssKey != null) id = ssKey.getId();
        return id;
    }
    // End Region REST API
}
