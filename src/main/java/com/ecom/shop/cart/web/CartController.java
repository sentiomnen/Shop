package com.ecom.shop.cart.web;

import com.ecom.shop.cart.dto.OrderDTO;
import com.ecom.shop.cart.service.CartService;
import com.ecom.shop.common.dto.PageDTO;
import com.ecom.shop.member.dto.MemberDTO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    CartService cartService;

    @GetMapping
    public String cart(HttpServletRequest req, HttpServletResponse resp,
                       Model model, OrderDTO order) {
        HttpSession session = req.getSession();
        MemberDTO ssKey = (MemberDTO) session.getAttribute("ssKey");
        if (ssKey != null) { session.setAttribute("ssKey", ssKey); }


        return "cart/index";
    }

    @PostMapping("/list.do")
    @ResponseBody
    public String doList(HttpServletRequest req, HttpServletResponse resp,
                         Model model, OrderDTO order) throws JsonProcessingException {
        String sort = req.getParameter("sort");
        int dir = Integer.parseInt(req.getParameter("dir"));

        MemberDTO ssKey = (MemberDTO) req.getSession().getAttribute("ssKey");
        if (ssKey == null) return null;
        String id = ssKey.getId();

        int cur = 1;
        try {cur = Integer.parseInt(req.getParameter("page"));}
        catch (Exception e) {}

        PageDTO page = new PageDTO();
        page.setRow(30);
        page.setStart(cur);
        ObjectMapper mapper = new ObjectMapper();
        List<OrderDTO> cart = cartService.list(page, sort, dir, id);
        String result = mapper.writeValueAsString(cart);
        return result;
    }
    // Region Query Methods
    @PostMapping("/add.do")
    @ResponseBody
    public String doAdd(HttpServletRequest req, HttpServletResponse resp,
                        Model model, OrderDTO order) {
        String result = "failed";
        HttpSession session = req.getSession();
        MemberDTO ssKey = (MemberDTO) session.getAttribute("ssKey");
        if (ssKey != null) {
            order.setId(ssKey.getId());
            order.setProgress("cart");
        }
        else return result;

        cartService.addCart(order);
        return result;
    }
    // End Region Query Methods
}
