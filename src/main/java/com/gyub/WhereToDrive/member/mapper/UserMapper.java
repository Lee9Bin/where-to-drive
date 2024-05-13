package com.gyub.WhereToDrive.member.mapper;


import com.gyub.WhereToDrive.member.entity.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

	void register(User user) throws Exception;

	User login(User user) throws Exception;
	
	int idChk(User user) throws Exception;

	
}
