package com.care.root.member.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.care.root.board.academicdto.academicDTO;
import com.care.root.board.noticedto.noticeDTO;
import com.care.root.board.portaldto.portalDTO;
import com.care.root.member.dto.MemberDTO;

public interface MemberDAO {
	public MemberDTO loginChk(String id);
	public String findId(@Param("name") String name, @Param("phone") String phone);
	public MemberDTO findPw(@Param("id") String id, @Param("email") String email);
	public int tempPw(@Param("tempPw") String tempPw, @Param("id") String id);
	public ArrayList<MemberDTO> getInfo(String id);
	public int modify(MemberDTO dto);
	public void rememberId(Map<String, Object> dates);
	public String getSessionId(String id);
	public void setNull(String id);
	public String chkFirst(String id);
	public void updateFirst(String id);
	public String getBirth(String attribute);
	
	public List<noticeDTO> mainList();
	public List<portalDTO> portalMainList();
	public List<academicDTO> academicMainList();
	
}
