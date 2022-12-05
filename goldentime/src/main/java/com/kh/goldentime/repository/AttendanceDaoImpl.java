package com.kh.goldentime.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.AttendanceDto;

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
}
