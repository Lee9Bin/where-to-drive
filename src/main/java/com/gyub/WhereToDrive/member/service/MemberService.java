package com.gyub.WhereToDrive.member.service;


import com.gyub.WhereToDrive.member.entity.User;


public interface MemberService {

	void register(User user) throws Exception;

	User login(User user) throws Exception;

	int idChk(User user) throws Exception;

}
