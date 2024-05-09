package com.gyub.WhereToDrive.board.service;


import com.gyub.WhereToDrive.board.entity.Board;
import com.gyub.WhereToDrive.common.Search;

import java.util.List;

public interface BoardService {

	List<Board> findByAll() throws Exception;
	Board findById(int bid) throws Exception;
	void insert(Board boardVO) throws Exception;
	void update(Board boardVO) throws Exception;
	void delete(int bid) throws Exception;

	int getBoardListCnt(Search search) throws Exception;
	List<Board> getBoardList(Search search);
}