package com.gyub.WhereToDrive.board.service;


import com.gyub.WhereToDrive.board.mapper.BoardDAO;
import com.gyub.WhereToDrive.board.entity.BoardVO;
import com.gyub.WhereToDrive.common.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardDAO boardDAO;

    public List<BoardVO> getBoardList() throws Exception {
        return boardDAO.getBoardList();
    }

    @Override
    public void insertBoard(BoardVO boardVO) throws Exception {
        boardDAO.insertBoard(boardVO);
    }


    public BoardVO getBoardContent(int bid) throws Exception {
        boardDAO.updateViewCnt(bid);
        return boardDAO.getBoardContent(bid);
    }

    @Override

    public void deleteBoard(int bid) throws Exception {

        boardDAO.deleteBoard(bid);

    }

    @Override
    public void updateBoard(BoardVO boardVO) throws Exception {
        boardDAO.updateBoard(boardVO);
    }


    @Override
    public List<BoardVO> getBoardList(Search search) throws Exception {

        return boardDAO.getBoardList(search);

    }


    @Override
    public int getBoardListCnt(Search search) throws Exception {

        return boardDAO.getBoardListCnt(search);

    }
}



