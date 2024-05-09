package com.gyub.WhereToDrive.member.dao;


import com.gyub.WhereToDrive.member.entity.MemberVO;
import org.apache.ibatis.session.SqlSession;

public class MemberDAOImpl implements MemberDAO {

	SqlSession sql;

	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert("memberMapper.register", vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {

		return sql.selectOne("memberMapper.login", vo);
	}

	// ���̵� �ߺ� üũ
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("memberMapper.idChk", vo);
		return result;
	}
}