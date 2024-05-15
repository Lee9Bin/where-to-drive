package com.gyub.WhereToDrive.board.service;


import com.gyub.WhereToDrive.board.entity.Board;
import com.gyub.WhereToDrive.common.Pagination;
import com.gyub.WhereToDrive.common.Search;

import java.util.List;
import java.util.Map;

public interface BoardService {

	List<Board> findByAll() throws Exception;
	Board findById(int bid) throws Exception;
	void insert(Board boardVO) throws Exception;
	void update(Board boardVO) throws Exception;
	void delete(int bid) throws Exception;

	Pagination makePageNavigation(Map<String, String> map) throws Exception;
	List<Board> listArticle(Map<String, String> map) throws Exception;
}