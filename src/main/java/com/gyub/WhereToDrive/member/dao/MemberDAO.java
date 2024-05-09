package com.gyub.WhereToDrive.member.dao;


import com.gyub.WhereToDrive.member.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {

	public void register(MemberVO vo) throws Exception;

	public MemberVO login(MemberVO vo) throws Exception;
	
	public int idChk(MemberVO vo) throws Exception;

	
}
