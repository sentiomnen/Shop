package com.ecom.shop.board.service;

import com.ecom.shop.board.dto.BoardDTO;
import com.ecom.shop.common.dto.PageDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BoardService {
    List<BoardDTO> getBoard(int page);


    List<BoardDTO> list(PageDTO page, String sort, int dir);
    BoardDTO view(int no, boolean countView);
    int count();
}
