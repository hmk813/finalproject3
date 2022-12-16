package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.entity.DepartmentDto;
import com.kh.goldentime.entity.StaffDto;
import com.kh.goldentime.vo.StaffSearchVO;

public interface StaffDao {
	void insert(StaffDto staffDto);//직원 등록
	
	List<StaffDto> selectList(StaffSearchVO staffSearchVO);//직원 조회
	List<StaffDto> selectSearch(StaffSearchVO staffSearchVO);//직원 검색조회
	List<StaffDto> selectAll(StaffSearchVO staffSearchVO);//직원 전체조회
	
	StaffDto selectOne(String staffId);//직원 아이디로 단일조회(직원 상세, 마이페이지)
	
	boolean update(StaffDto staffDto);//수정
	boolean changeInformation(StaffDto staffDto);//개인정보 변경
	boolean changePassword(String staffId, String afterPw);//비밀번호 변경
	
	boolean delete(String staffId);//삭제
	
	int count(StaffSearchVO staffSearchVO);//직원 수
	int searchCount(StaffSearchVO staffSearchVO);//검색 조회 시 직원 수
	int listCount(StaffSearchVO staffSearchVO);//전체 조회 시 직원 수
	
	List<DepartmentDto> selectDepartment();//부서 조회
}