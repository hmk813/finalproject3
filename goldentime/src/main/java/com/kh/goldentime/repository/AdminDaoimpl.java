package com.kh.goldentime.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.VacationDto;
import com.kh.goldentime.vo.AdminAttendSearchVO;
import com.kh.goldentime.vo.AdminAttendanceVO;
import com.kh.goldentime.vo.AdminVacationVO;
import com.kh.goldentime.vo.VacationStaffVO;

@Repository
public class AdminDaoimpl implements AdminDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<AdminAttendanceVO> attendanceList(AdminAttendanceVO adminAttendanceVO) {
		return sqlSession.selectList("admin.attendanceSearchList", adminAttendanceVO);
	}
	
	
	
	@Override
	public List<VacationStaffVO> list() {
		return sqlSession.selectList("admin.vacationList");
	}

	@Override
	public boolean approve(int vacationNo) {
		return sqlSession.update("admin.vacationApprove",vacationNo)>0;
	}
	
	@Override
	public boolean refuse(int vacationNo) {
		return sqlSession.update("admin.vacationRefuse",vacationNo)>0;
	}



	@Override
	public List<AdminVacationVO> search(AdminVacationVO adminVacationVO) {
		return sqlSession.selectList("admin.vacationList",adminVacationVO);
	}

}
