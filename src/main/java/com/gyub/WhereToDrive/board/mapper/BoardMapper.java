package com.gyub.WhereToDrive.board.mapper;

import com.gyub.WhereToDrive.board.entity.Board;
import com.gyub.WhereToDrive.common.Search;
import org.apache.ibatis.annotations.Mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


@Mapper
public interface BoardMapper {

    List<Board> findByAll() throws Exception;
    Board findById(int bid) throws Exception;
    void insert(Board boardVO) throws Exception;
    void update(Board boardVO) throws Exception;
    void delete(int bid) throws Exception;
    void upHit(int bid) throws Exception;

    int getTotalBoardCount(Map<String, Object> param) throws SQLException;
    List<Board> listBoard(Map<String, Object> param) throws SQLException;
}