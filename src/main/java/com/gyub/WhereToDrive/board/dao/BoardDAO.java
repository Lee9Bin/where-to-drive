package com.gyub.WhereToDrive.board.dao;


import com.gyub.WhereToDrive.board.model.BoardVO;
import com.gyub.WhereToDrive.common.Search;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardDAO {

	public List<BoardVO> getBoardList() throws Exception;

	public BoardVO getBoardContent(int bid) throws Exception;

	public int insertBoard(BoardVO boardVO) throws Exception;

	public int updateBoard(BoardVO boardVO) throws Exception;

	public int deleteBoard(int bid) throws Exception;

	public int updateViewCnt(int bid) throws Exception;
	

	public int getBoardListCnt(Search search) throws Exception;

	List<BoardVO> getBoardList(Search search);
}