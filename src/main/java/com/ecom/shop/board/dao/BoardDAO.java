package com.ecom.shop.board.dao;

import com.ecom.shop.board.dto.BoardDTO;
import com.ecom.shop.board.dto.PageDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoardDAO {
    List<BoardDTO> getBoard(PageDTO page);

    int count();
    List<BoardDTO> listBoard(Map<String, Object> parameters);
    BoardDTO viewBoard(int no);
    int updateView(Map<String, Object> params);
}
