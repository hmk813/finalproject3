package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.entity.StaffDto;
import com.kh.goldentime.vo.StaffSearchVO;

public interface StaffDao {

	void insert(StaffDto staffDto); //등록
	
	List<StaffDto> list(); //목록
	
	boolean edit(StaffDto staffDto);//수정
	
	boolean delete(String staffId);//삭제

	StaffDto selectOne(String staffId);//마이페이지
	
	boolean login(StaffDto staffDto);//로그인
	
	boolean changeInformation(StaffDto staffDto);//개인정보 변경
		
	boolean changePassword(String staffId, String afterPw);//비밀번호 변경
	
	//<사원검색>
	List<StaffDto> search(StaffSearchVO vo);
	
	
}