package com.ecom.shop.board.service;

import com.ecom.shop.board.dao.BoardDAO;
import com.ecom.shop.board.dto.BoardDTO;
import com.ecom.shop.board.dto.PageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
    @Autowired
    BoardDAO boardDAO;

    @Override
    public List<BoardDTO> getBoard(int page) {
        PageDTO pageDTO = new PageDTO();
        pageDTO.setStart((page-1)*PageDTO.ROW_PER_PAGE);
        pageDTO.setEnd((page)*PageDTO.ROW_PER_PAGE);
        return boardDAO.getBoard(pageDTO);
    }

    @Override
    public int count() {
        return boardDAO.count();
    }
    @Override
    public List<BoardDTO> list(com.ecom.shop.common.dto.PageDTO page, String sort, int dir) {
        Map<String, Object> result = new HashMap<String, Object>();
        String direction = "ASC";
        if (dir < 0) direction = "DESC";

        result.put("page", page);
        result.put("sort", sort);
        result.put("dir", direction);
        return boardDAO.listBoard(result);
    }

    @Override
    public BoardDTO view(int no, boolean countView) {
        if (countView) {
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("no", no);
            params.put("view", 1);
            boardDAO.updateView(params);
        }

        return boardDAO.viewBoard(no);
    }
}
