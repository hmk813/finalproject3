package com.kh.goldentime.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.AttendanceDto;
import com.kh.goldentime.vo.AttendanceWorkTimeVO;
import com.kh.goldentime.vo.TimeFormatVO;
import com.kh.goldentime.vo.TodayTotalWorkTimeVO;

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
	public TodayTotalWorkTimeVO todayTimeWork(String attendanceStaffId) {
		return sqlSession.selectOne("attendance.totalWorkTime",attendanceStaffId);
	}

	@Override
	public TimeFormatVO todayLeaveTime(String attendanceStaffId) {
		return sqlSession.selectOne("attendance.todayLeaveTime",attendanceStaffId);
	}

	@Override
	public boolean leaveEarly(String attendanceStaffId) {
		return sqlSession.update("attendance.leaveEarly",attendanceStaffId)>0;
	}

	@Override
	public boolean normalWork(String attendanceStaffId) {
		return sqlSession.update("attendance.normalWork",attendanceStaffId)>0;
	}

	@Override
	public AttendanceDto todaywork(String attendanceStaffId) {
		return sqlSession.selectOne("attendance.todaywork",attendanceStaffId);
	}
}
