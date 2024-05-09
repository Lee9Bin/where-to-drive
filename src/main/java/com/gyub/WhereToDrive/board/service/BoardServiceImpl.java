package com.gyub.WhereToDrive.board.service;


import com.gyub.WhereToDrive.board.entity.Board;
import com.gyub.WhereToDrive.board.mapper.BoardMapper;
import com.gyub.WhereToDrive.common.Search;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

    private final BoardMapper boardMapper;

    @Override
    public List<Board> findByAll() throws Exception {
        return boardMapper.findByAll();
    }

    @Override
    public Board findById(int bid) throws Exception {
        return boardMapper.findById(bid);
    }

    @Override
    public void insert(Board boardVO) throws Exception {
        boardMapper.insert(boardVO);
    }

    @Override
    public void update(Board boardVO) throws Exception {
        boardMapper.update(boardVO);
    }

    @Override
    public void delete(int bid) throws Exception {
        boardMapper.delete(bid);
    }

    @Override
    public void upHit(int bid) throws Exception {
        boardMapper.upHit(bid);
    }

    @Override
    public int getBoardListCnt(Search search) throws Exception {
        return boardMapper.getBoardListCnt(search);
    }
}



