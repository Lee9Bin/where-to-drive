package com.gyub.WhereToDrive.member.service;


import com.gyub.WhereToDrive.member.vo.MemberVO;


public interface MemberService {

	public void register(MemberVO vo) throws Exception;

	public MemberVO login(MemberVO vo) throws Exception;

	public int idChk(MemberVO vo) throws Exception;

}
