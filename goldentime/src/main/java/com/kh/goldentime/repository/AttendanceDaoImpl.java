package com.kh.goldentime.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.AttendanceDto;
import com.kh.goldentime.vo.AttendanceTotalWorkTimeVO;
import com.kh.goldentime.vo.AttendanceWorkTimeVO;

@Repository
public class AttendanceDaoImpl implements AttendanceDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public void goWork(AttendanceDto attendanceDto) {
		sqlSession.insert("attendance.goWork",attendanceDto);
	}

	@Override
	public boolean leaveWork(AttendanceDto attendanceDto) {
		int cnt =  sqlSession.update("attendance.leavework",attendanceDto);
		return cnt>0;
	}

	@Override
	public AttendanceDto goWorkFind(String attendanceStaffId) {
		return sqlSession.selectOne("attendance.goWorkfind",attendanceStaffId);
	}

	@Override
	public AttendanceWorkTimeVO stardEnd(String attendanceStaffId) {
		return sqlSession.selectOne("attendance.startendtime",attendanceStaffId);
	}

	@Override
	public AttendanceDto comeLate(String attendanceStaffId) {
		return sqlSession.selectOne("attendance.comeLate",attendanceStaffId);
	}

	@Override
	public boolean comeLateUpate(String attendanceStaffId) {
		return sqlSession.update("attendance.comeLateUpdate",attendanceStaffId)>0;
	}

	@Override
	public AttendanceTotalWorkTimeVO todayTimeWork(String attendanceStaffId) {
		return sqlSession.selectOne("attendance.totalWorkTime",attendanceStaffId);
	}
}
