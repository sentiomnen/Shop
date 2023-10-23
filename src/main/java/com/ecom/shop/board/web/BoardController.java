package com.ecom.shop.board.web;

import com.ecom.shop.board.dto.BoardDTO;
import com.ecom.shop.board.service.BoardService;
import com.ecom.shop.common.dto.PageDTO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
@RequestMapping("/board")
public class BoardController {
    @Autowired
    BoardService boardService;

    // Region Pages
    @RequestMapping("/")
    public String board(HttpServletRequest req, HttpServletResponse resp,
                        Model model, BoardDTO board) {
        int page = 1;
        try { page = Integer.parseInt(req.getParameter("page")); } catch (Exception e) {}

        List<BoardDTO> postList = boardService.getBoard(page);
        model.addAttribute("postList", postList);
        return "/board/index";
    }
    // End Region Pages
    @RequestMapping("/list")
    public String list(HttpServletRequest req, HttpServletResponse resp,
                       Model model, BoardDTO article) {
        HttpSession session = req.getSession();
        PageDTO page = new PageDTO();
        page.setRow(30);
        page.setStart(Integer.parseInt(req.getParameter("page")));
        List<BoardDTO> productList = boardService.list(page, "no", 0);
        if (productList.get(0) == null) productList = null;
        int pageCount  = boardService.count();
        int pageAmount = pageCount/page.getRow()+ 1;

        model.addAttribute("pageUnit",    page.getRow());
        model.addAttribute("pageCount",   pageCount);
        model.addAttribute("pageAmount",  pageAmount);
        model.addAttribute("productList", productList);
        return "board/list";
    }
    @RequestMapping("/view")
    public String view(HttpServletRequest req, HttpServletResponse resp,
                       Model model, BoardDTO post) {
        int postNumber = Integer.parseInt( req.getParameter("no") );
        String refer = "";

        post  = boardService.view(postNumber, true);
        try {
            refer = boardService.view(post.getRef(), false).getTitle();
        } catch (Exception e) {}

        req.setAttribute("post",  post);
        req.setAttribute("refer", refer);

        return "board/view";
    }
    // Region Action methods
    @PostMapping("/list.do")
    @ResponseBody
    public String doList(HttpServletRequest req, HttpServletResponse resp,
                         Model model, BoardDTO board) throws JsonProcessingException {
        String sort = req.getParameter("sort");
        int dir = Integer.parseInt(req.getParameter("dir"));

        PageDTO page = new PageDTO();
        page.setRow(30);
        page.setStart(Integer.parseInt(req.getParameter("page")));
        ObjectMapper mapper = new ObjectMapper();
        List<BoardDTO> boardList = boardService.list(page, sort, dir);
        String result = mapper.writeValueAsString(boardList);
        return result;
    }
    // Region Action methods
}
