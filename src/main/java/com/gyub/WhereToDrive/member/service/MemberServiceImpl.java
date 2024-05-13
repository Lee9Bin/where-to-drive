package com.gyub.WhereToDrive.member.service;

import com.gyub.WhereToDrive.member.entity.User;
import com.gyub.WhereToDrive.member.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final UserMapper userMapper;

	@Override
	public void register(User user) throws Exception {

		userMapper.register(user);

	}

	@Override
	public User login(User user) throws Exception {
		System.out.println(user);
		return userMapper.login(user);
	}
	
	@Override
	public int idChk(User user) throws Exception {
		int result = userMapper.idChk(user);
		return result;
	}
}