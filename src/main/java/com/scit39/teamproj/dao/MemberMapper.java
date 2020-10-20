package com.scit39.teamproj.dao;

import java.util.ArrayList;

import com.scit39.teamproj.vo.MemberVO;

public interface MemberMapper {

	public int memberJoin(MemberVO member);
	
	public ArrayList<MemberVO> joinList();
	
	public int memberDelete(String member_id);
	
	public MemberVO memberSelectOne(String member_id);
	
	public int memberUpdate(MemberVO member);
}
