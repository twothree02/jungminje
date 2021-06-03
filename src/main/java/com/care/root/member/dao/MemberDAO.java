package com.care.root.member.dao;

import org.apache.ibatis.annotations.Param;

import com.care.root.member.dto.MemberDTO;

public interface MemberDAO {
	public MemberDTO loginChk(String id);
	public MemberDTO findId(@Param("inputName") String name, @Param("inputTel") String tel);
}
