package com.care.root.member.dao;

import org.apache.ibatis.annotations.Param;

import com.care.root.member.dto.MemberDTO;

public interface MemberDAO {
	public MemberDTO loginChk(String id);
	public String findId(@Param("name") String name, @Param("phone") String phone);
	public MemberDTO findPw(@Param("id") String id, @Param("email") String email);
	public int tempPw(@Param("tempPw") String tempPw, @Param("id") String id);
}
