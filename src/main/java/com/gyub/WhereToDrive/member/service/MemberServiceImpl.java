package com.gyub.WhereToDrive.member.service;

import com.gyub.WhereToDrive.member.dao.MemberDAO;
import com.gyub.WhereToDrive.member.entity.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO dao;

	@Override
	public void register(MemberVO vo) throws Exception {

		dao.register(vo);

	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}
	
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}
}