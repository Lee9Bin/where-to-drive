package com.gyub.WhereToDrive.board.service;


import com.gyub.WhereToDrive.board.model.BoardVO;
import com.gyub.WhereToDrive.common.Search;

import java.util.List;

public interface BoardService {

	public List<BoardVO> getBoardList() throws Exception;
	public void insertBoard(BoardVO boardVO) throws Exception;
	
	public BoardVO getBoardContent(int bid) throws Exception;
	public void deleteBoard(int bid) throws Exception;
	public void updateBoard(BoardVO boardVO) throws Exception;
	
	public int getBoardListCnt(Search search) throws Exception;
	List<BoardVO> getBoardList(Search search) throws Exception;
}