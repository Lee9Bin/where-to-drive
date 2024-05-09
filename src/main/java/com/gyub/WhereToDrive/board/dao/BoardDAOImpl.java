package com.gyub.WhereToDrive.board.dao;


import com.gyub.WhereToDrive.board.model.BoardVO;
import com.gyub.WhereToDrive.common.Search;
import org.apache.ibatis.session.SqlSession;


import java.util.List;

public class BoardDAOImpl implements BoardDAO {


	private SqlSession sqlSession;

	@Override

	public List<BoardVO> getBoardList() throws Exception {

		return sqlSession.selectList("com.gyub.WhereToDrive.board.boardMapper.getBoardList");

	}

	@Override

	public BoardVO getBoardContent(int bid) throws Exception {

		return sqlSession.selectOne("com.gyub.WhereToDrive.board.boardMapper.getBoardContent", bid);

	}

	@Override

	public int insertBoard(BoardVO boardVO) throws Exception {

		return sqlSession.insert("com.gyub.WhereToDrive.board.boardMapper.insertBoard", boardVO);

	}

	@Override

	public int updateBoard(BoardVO boardVO) throws Exception {

		return sqlSession.update("com.gyub.WhereToDrive.board.boardMapper.updateBoard", boardVO);

	}

	@Override

	public int deleteBoard(int bid) throws Exception {

		return sqlSession.insert("com.gyub.WhereToDrive.board.boardMapper.deleteBoard", bid);

	}

	@Override

	public int updateViewCnt(int bid) throws Exception {

		return sqlSession.update("com.gyub.WhereToDrive.board.boardMapper.updateViewCnt", bid);

	}

	@Override
	public List<BoardVO> getBoardList(Search search) {

		return sqlSession.selectList("com.gyub.WhereToDrive.board.boardMapper.getBoardList", search);

	}



	@Override

	public int getBoardListCnt(Search search) throws Exception {

		return sqlSession.selectOne("com.gyub.WhereToDrive.board.boardMapper.getBoardListCnt", search);

	}

}