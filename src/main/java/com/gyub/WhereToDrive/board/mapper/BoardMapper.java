package com.gyub.WhereToDrive.board.mapper;

import com.gyub.WhereToDrive.board.entity.Board;
import com.gyub.WhereToDrive.common.Search;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface BoardMapper {

    List<Board> findByAll() throws Exception;
    Board findById(int bid) throws Exception;
    void insert(Board boardVO) throws Exception;
    void update(Board boardVO) throws Exception;
    void delete(int bid) throws Exception;
    void upHit(int bid) throws Exception;
    int getBoardListCnt(Search search) throws Exception;
}